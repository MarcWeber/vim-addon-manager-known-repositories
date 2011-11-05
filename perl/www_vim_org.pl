#!/usr/bin/perl

use strict;
use warnings;

use LWP::UserAgent;
use HTML::TreeBuilder;
use Fcntl qw(:DEFAULT :flock);
use Time::HiRes;
use utf8;
use Data::Dumper;
use YAML::XS;
use JSON;

my $verbose=shift @ARGV;
my $dumpall=shift @ARGV;

my $ua=LWP::UserAgent->new(cookie_jar => {},
                             max_size => 10*1024*1024,
                    protocols_allowed => ['http'],
                              timeout => 30,
                                agent => "www_vim_org.pl");

my $vimorg="http://www.vim.org";
my $base="$vimorg/scripts";
my $maxattempts=3;
my $threads=20;
my $vimtarget="plugin/vim.org-scripts.vim";
my $yamltarget="scripts.yaml";

my %children;

#▶1 get :: url → response
sub get($) {
    my $url     = shift;
    my $attempt = 0;
    my $response=shift;
    while($attempt<$maxattempts) {
        $response=$ua->get($url);
        return $response if($response->is_success);
        $maxattempts++;
        print STDERR "Failed to get $url, attempt $attempt";
    }
    die "Failed to get $url";
}
#▶1 getHTML :: response → tree
sub getHTML($) {
    my $response=shift;
    my $tree=HTML::TreeBuilder->new();
    $tree->parse($response->decoded_content) or
        die "$!\nFailed to parse ".$response->decoded_content;
    return $tree;
}
#▶1 getScripts :: [ urlargs] → [script]
# This will give us a list of all scripts
sub getScripts(;$);
sub getScripts(;$) {
    my $urlargs=shift || "";
    my $url="$base/script_search_results.php$urlargs";
    print "Processing $url\n" if($verbose);
    my $response=get($url);
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
#▶1 processScript :: script → + script
sub processScript($) {
    my $script  = shift;
    my $url="$base/script.php?script_id=".$script->{"snr"};
    print "Processing $url\n" if($verbose);
    my $response=get($url);
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
sub formatScripts($$$;$) {
    my $VIM     = shift;
    my $YAML    = shift;
    my $scripts = shift;
    my $nodl    = defined shift;
    for my $script (@$scripts) {
        unless($nodl) {
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
        }
        my $lastsrc=$script->{"sources"}->[0];
        my $line="let s:p";
        if($script->{"id"} =~ /^[a-zA-Z0-9_]+$/) {
            $line.=".".$script->{"id"}; }
        else {
            # XXX Relying on name generator not outputting strings with \n or '
            $line.="['".$script->{"id"}."']"; }
        $line.="={".formatKey("title", $script->{"name"}).
                    formatKey("script-type", $script->{"type"}).
                    formatKey("version", $lastsrc->{"version"}).
                    formatKey("url", "$base/download_script.php?src_id=".$lastsrc->{"srcnr"}).
                    formatKey("archive_name", $lastsrc->{"archive"}).
                    "'type': 'archive'}\n";
        WL($VIM, $line);
        if($dumpall) {
            WL($YAML, YAML::XS::Dump($script));
        }
    }
}
#▶1 openScript :: () → FD + …
sub openScript() {
    my $VIM;
    open $VIM, '>:utf8', $vimtarget
        or die $!;
    print $VIM "if !exists('g:vim_addon_manager')\n";
    print $VIM "    let g:vim_addon_manager={}\n";
    print $VIM "endif\n";
    print $VIM "if !has_key(g:vim_addon_manager, 'vim_org_sources')\n";
    print $VIM "    let g:vim_addon_manager.vim_org_sources={}\n";
    print $VIM "endif\n";
    print $VIM "let s:p=g:vim_addon_manager.vim_org_sources\n";
    return $VIM;
}
#▶1 addScriptID :: [script] → + [script]
sub addScriptID($) {
    my $scripts=shift;
    local $_;
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
}
#▶1 getAllScripts_parseHTML :: () → + …
sub getAllScripts_parseHTML() {
    local $_;
    my $scripts=[getScripts("?show_me=4000")];
    addScriptID($scripts);
    my $numscripts=((scalar @$scripts)/$threads);
    if(($threads*$numscripts)<(scalar @$scripts)) {
        $threads++; }
    my $i=0;
    while($i<$threads) {
        my $pid=fork;
        if($pid) {
            $children{$pid}=1;
            $i++;
        }
        else {
            my $VIM;
            open $VIM, '>:utf8', "$vimtarget.$i"
                or die $!;
            my $YAML;
            if($dumpall) {
                open $YAML, '>:utf8', "$yamltarget.$i"
                    or die $!; }
            formatScripts($VIM, $YAML,
                [@$scripts[($i*$numscripts)..((($i+1)*$numscripts)-1)]]);
            return;
        }
    }
    map {waitpid $_, 0} (keys %children);
    my $YAML;
    if($dumpall) {
        open $YAML, '>:utf8', $yamltarget
            or die $!; }
    my $VIM=openScript();
    $i=0;
    while($i<$threads) {
        my $VIM2;
        open $VIM2, '<:utf8', "$vimtarget.$i"
            or die $!;
        while(<$VIM2>) {
            print $VIM $_; }
        close $VIM2;
        unlink "$vimtarget.$i";
        if($dumpall) {
            my $YAML2;
            open $YAML2, '<:utf8', "$yamltarget.$i"
                or die $!;
            while(<$YAML2>) {
                print $YAML $_; }
            close $YAML2;
            unlink "$yamltarget.$i";
        }
        $i++;
    }
    close $VIM;
    close $YAML;
}
#▶1 getAllScripts
sub getAllScripts() {
    return getAllScripts_parseHTML();
    my $url="$vimorg/script-info.php";
    print "Processing $url\n" if($verbose);
    my $response=get($url);
    return getAllScripts_parseHTML() unless $response;
    my $json;
    eval {$json=JSON::decode_json($response->decoded_content())};
    unless(defined $json) {
        print STDERR "Failed to parse json: $@";
        return getAllScripts_parseHTML();
    }
    local $_;
    my $scripts=[sort {$a->{"snr"} <=> $b->{"snr"}}
                      (map {{snr => +$_->{"script_id"},
                            name => $_->{"script_name"},
                            type => $_->{"script_type"},
                         sources => [map {{srcnr => +$_->{"script_id"},
                                         archive => $_->{"package"},
                                         version => $_->{"script_version"},
                                     vim_version => $_->{"vim_version"},}}
                                         (reverse @{$_->{"releases"}})],
                            }} values %$json)];
    addScriptID($scripts);
    my $VIM=openScript();
    formatScripts($VIM, undef, $scripts, 0);
    return;
}
getAllScripts();
