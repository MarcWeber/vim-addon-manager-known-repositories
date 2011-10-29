#!/usr/bin/perl

use strict;
use warnings;

use LWP::UserAgent;
use HTML::TreeBuilder;
use Fcntl qw(:DEFAULT :flock);
use Time::HiRes;
use utf8;
use Data::Dumper;

my $verbose=shift @ARGV;
my $dumpall=shift @ARGV;

my $ua=LWP::UserAgent->new(cookie_jar => {},
                             max_size => 10*1024*1024,
                    protocols_allowed => ['http'],
                              timeout => 30,
                                agent => "www_vim_org.pl");

my $base="http://www.vim.org/scripts";
my $maxattempts=3;
my $threads=20;
my $vimtarget="plugin/vim.org-scripts.vim";

my %children;

#▶1 getHTML :: response → tree
sub getHTML($) {
    my $response=shift;
    my $tree=HTML::TreeBuilder->new();
    $tree->parse($response->decoded_content) or
        die "$!\nFailed to parse ".$response->decoded_content;
    return $tree;
}
#▶1 getScripts :: [ urlargs[, numtries]] → [script]
# This will give us a list of all scripts
sub getScripts(;$$);
sub getScripts(;$$) {
    my $urlargs=shift || "";
    my $attempt=shift || 0;
    my $url="$base/script_search_results.php$urlargs";
    print "Processing $url\n" if($verbose);
    my $response=$ua->get($url);
    if($response->is_error) {
        print STDERR "Failed to get scripts list from $url, attempt $attempt\n";
        die $response->status_line if($attempt > $maxattempts);
        return getScripts($urlargs, $attempt+1);
    }
    my $tree=getHTML($response);
    my $table=$tree->look_down(_tag => 'table',
                               sub {
                                   my $t=$_[0];
                                   (scalar ($t->content_list) > 2) or return 0;
                                   $t=[$t->content_list]->[0];
                                   return ($t->as_text =~ /Searched scripts/);
                               });
    die "Failed to find table on $url" unless $table;
    my @scripts;
    for my $row (splice @{[$table->content_list]}, 2, -1) {
        next unless ref $row;
        my @fields=($row->content_list);
        next unless (($fields[0]->attr('class') || "") =~ /^row/);
        my $a=[$fields[0]->content_list]->[0];
        my $snr;
        $snr=+$1 if ($a->attr('href') =~ /(\d+)$/);
        next unless $snr;
        push @scripts, {snr => $snr,
                       name => $a->as_text,
                       type => $fields[1]->as_text,
                     rating => +($fields[2]->as_text),
                  downloads => +($fields[3]->as_text),
                description => $fields[4]->as_text};
    }
    my $l=[[$table->content_list]->[-2]->content_list]->[0]->look_down(
                    _tag => 'a',
                    sub { $_[0]->as_text =~ /next/i });
    if($l) {
        my $link=$l->attr('href');
        $link=~s/.*\?&(.*)/?$1/;
        push @scripts, getScripts($link);
    }
    return @scripts;
}
#▶1 processScript :: script[, numtries] → + script
sub processScript($;$);
sub processScript($;$) {
    my $script  = shift;
    my $attempt = shift || 0;
    my $url="$base/script.php?script_id=".$script->{"snr"};
    print "Processing $url\n" if($verbose);
    my $response=$ua->get($url);
    if($response->is_error) {
        print STDERR "Failed to get script info from $url, attempt $attempt\n";
        die $response->status_line if($attempt > $maxattempts);
        return processScript($script, $attempt+1);
    }
    my $tree=getHTML($response);
    my $ktr=[$tree->look_down(_tag => 'table',
                              sub {
                                  my $t=$_[0];
                                  (scalar ($t->content_list)==2) or return 0;
                                  $t=[$t->content_list]->[0];
                                  return ($t->as_text =~ /Downloaded by \d+/);
                              })->content_list]->[0];
    if($ktr->as_text =~ /Rating (-?\d+)\/(\d+)/) {
        $script->{"rating_full"}=[(+$1), (+$2)];
    }
    my $table=$tree->look_down(_tag => 'table',
                               sub {
                                   my $t=$_[0];
                                   (scalar ($t->content_list) > 9) or return 0;
                                   $t=[$t->content_list]->[0];
                                   return ($t->as_text =~ /created by/);
                               });
    my $state;
    for my $line ($table->content_list) {
        next unless ref $line;
        my $fel=[$line->content_list]->[0];
        if($fel->attr('class')) {
            my $text=[$fel->content_list]->[0];
            if(not ref $text) {
                if($text =~ /created by/) {
                    $state='author'; }
                elsif($text =~ /description/) {
                    $state='description'; }
                elsif($text =~ /install details/) {
                    $state='install'; }
            }
            next;
        }
        if($state eq 'author') {
            $script->{"author"}=$fel->as_text; }
        elsif($state) {
            $script->{$state}=$fel->as_HTML('<>&', "\t", {}); }
        $state="";
    }
    $table=$tree->look_down(_tag => 'table',
                            sub {
                                my $t=$_[0];
                                (scalar ($t->content_list) > 1) or return 0;
                                $t=[$t->content_list]->[0];
                                $t->attr('class') or return 0;
                                (scalar ($t->content_list)==7) or return 0;
                                $t=[$t->content_list]->[0];
                                ref [$t->content_list]->[0] and return 0;
                                $t=[$t->content_list]->[0];
                                return ($t =~ /package/);
                            });
    $script->{"sources"}=[];
    for my $row (splice @{[$table->content_list]}, 1) {
        next unless ref $row;
        my @fields=($row->content_list);
        next unless (($fields[0]->attr('class') || "") =~ /^row/);
        my $a=[$fields[0]->content_list]->[0];
        my $srcnr;
        $srcnr=+$1 if ($a->attr('href') =~ /(\d+)$/);
        push @{$script->{"sources"}},
                  {srcnr => +$srcnr,
                 archive => $a->as_text,
                 version => ($fields[1]->as_text),
                    date => ($fields[2]->as_text),
             vim_version => ($fields[3]->as_text),
             description => ($fields[5]->as_HTML('<&>', "\t", {})),
                  };
    }
}
#▶1 WL :: filehandle, line → + FS
sub WL($$) {
    my $F=shift;
    my $l=shift;
    while(1) {
        flock $F, LOCK_EX and last;
        print STDERR "Lock failed";
        Time::HiRes::sleep(0.0625);
    }
    print $F $l;
    flush $F;
    flock $F, LOCK_UN
        or die "Failed to unlock file: $!";
}
#▶1 formatKey :: name, value → string
sub formatKey($$) {
    my $key=shift;
    my $val=shift;
    my $r="'$key': ";
    if($val=~/\n/) {
        $val=~s/(["\\])/\\$1/g;
        $val=~s/\n/\\n/g;
        $r.="\"$val\"";
    }
    else {
        $val=~s/'/''/g;
        $r.="'$val'";
    }
    $r.=", ";
    return $r;
}
#▶1 formatScripts :: fh, fh, [script] → + FS: scripts.yaml, scripts.dat
sub formatScripts($$$) {
    my $VIM     = shift;
    my $YAML    = shift;
    my $scripts = shift;
    for my $script (@$scripts) {
        eval {processScript($script);};
        if($@) {
            print STDERR "Failed to process script ".$script->{"snr"}.": $@";
            next;
        }
        elsif(not ref $script->{"sources"}) {
            print STDERR "sources is not a reference:\n";
            print STDERR Data::Dumper->Dump([$script], ['script']);
            next;
        }
        elsif(not scalar @{$script->{"sources"}}) {
            print STDERR "No sources for script ".$script->{"snr"}."\n";
            next;
        }
        my $lastsrc=$script->{"sources"}->[0];
        my $line="let s:p";
        if($script->{"id"} =~ /^[a-zA-Z0-9_]+$/) {
            $line.=".".$script->{"id"}; }
        else {
            # XXX Relying on name generator not outputting strings with \n or '
            $line.="['".$script->{"id"}."']"; }
        $line.="={".formatKey("title", $script->{"name"}).
                    formatKey("version", $lastsrc->{"version"}).
                    formatKey("url", "$base/download_script.php?src_id=".$lastsrc->{"srcnr"}).
                    formatKey("archive_name", $lastsrc->{"archive"}).
                    "'type': 'archive'}\n";
        WL($VIM, $line);
        if($dumpall) {
            use YAML::Any;
            WL($YAML, YAML::Any::Dump($script));
        }
    }
}
#▶1 getAllScripts :: () → + …
sub getAllScripts() {
    local $_;
    my $scripts=[getScripts("?show_me=4000")];
    my %scriptnames;
    for my $script (@$scripts) {
        $_=$script->{"name"};
        s/\.vim$//g;
        # XXX That must purge at least ' and \n
        s/[^ a-zA-Z0-9_\-.]//g;
        s/ /_/g;
        if(defined $scriptnames{$_}) {
            my $s=$scriptnames{$_};
            if(ref $s) {
                $s->{"id"}.=$s->{"snr"};
                $scriptnames{$s->{"id"}}=$s;
                $scriptnames{$_}=1;
            }
            $_.=$script->{"snr"};
        }
        $script->{"id"}=$_;
        $scriptnames{$_}=$script;
    }
    my $YAML;
    if($dumpall) {
        open $YAML, '>:utf8', 'scripts.yaml'
            or die $!;
    }
    my $VIM;
    open $VIM, '>:utf8', $vimtarget
        or die $!;
    print $VIM "if !exists('g:vim_addon_manager')\n";
    print $VIM "    let g:vim_addon_manager={}\n";
    print $VIM "endif\n";
    print $VIM "if !has_key(g:vim_addon_manager, 'plugin_sources')\n";
    print $VIM "    let g:vim_addon_manager.plugin_sources={}\n";
    print $VIM "endif\n";
    print $VIM "let s:p=g:vim_addon_manager.plugin_sources\n";
    my $i=0;
    my $numscripts=((scalar @$scripts)/$threads);
    if(($threads*$numscripts)<(scalar @$scripts)) {
        $threads++; }
    while($i<$threads) {
        my $pid=fork;
        if($pid) {
            $children{$pid}=1;
            $i++;
        }
        else {
            formatScripts($VIM, $YAML,
                [@$scripts[($i*$numscripts)..((($i+1)*$numscripts)-1)]]);
            last;
        }
    }
    map {waitpid $_, 0} (keys %children);
}
getAllScripts();
