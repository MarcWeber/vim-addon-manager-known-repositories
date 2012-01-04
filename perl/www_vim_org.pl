#!/usr/bin/perl

use strict;
use warnings;

use LWP::UserAgent;
use HTML::TreeBuilder;
use Fcntl qw(:DEFAULT :flock);
use Time::HiRes;
use utf8;
use Data::Dumper;
use JSON;
use HTML::Entities;

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
#▶1 formatScripts :: [script], fh, fh, fh → + FS: scripts.yaml, scripts.dat, db/
sub formatScripts($@) {
    my $scripts=shift;
    my ($VIM, $NrNDB, $NNrDB) = @_;
    for my $script (@$scripts) {
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
                    "'vim_script_nr': ".$script->{"snr"}.", ".
                    "'type': 'archive'}\n";
        WL($VIM, $line);
    }
}
#▶1 openDBs :: () → FD + …
sub openDBs() {
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
    return ($VIM, undef, undef);
}
#▶1 genName :: name, snr, scriptnames → sname + scriptnames
sub genName($$$) {
    local $_=shift;
    my $snr=shift;
    my $scriptnames=shift;
    s/\.vim$//g;
    # XXX That must purge at least ' and \n
    s/[^ a-zA-Z0-9_\-.]//g;
    s/ /_/g;
    while(defined $scriptnames->{$_}) {
        my $s=$scriptnames->{$_};
        if(ref $s) {
            $s->{"id"}.="%".$s->{"snr"};
            $scriptnames->{$s->{"id"}}=$s;
            $scriptnames->{$_}=1;
        }
        $_.="\%$snr";
    }
    return $_;
}
#▶1 addScriptID :: [script] → + [script]
sub addScriptID($) {
    my $scripts=shift;
    local $_;
    my $scriptnames={};
    for my $script (@$scripts) {
        $script->{"id"}=genName($script->{"name"}, $script->{"snr"},
                                $scriptnames);
        $scriptnames->{$script->{"id"}}=$script;
    }
}
#▶1 getAllScripts
sub getAllScripts() {
    my $url="$vimorg/script-info.php";
    print "Processing $url\n" if($verbose);
    my $response=get($url);
    my $json;
    eval {$json=JSON::decode_json($response->decoded_content())};
    unless(defined $json) {
        die "Failed to parse json: $@";
    }
    local $_;
    my $scripts=[sort {$b->{"snr"} <=> $a->{"snr"}}
                      (map {{snr => +$_->{"script_id"},
                            name => decode_entities($_->{"script_name"}),
                            type => $_->{"script_type"},
                         sources => [map {{srcnr => +$_->{"src_id"},
                                         archive => $_->{"package"},
                                         version => $_->{"script_version"},
                                     vim_version => $_->{"vim_version"},}}
                                         (sort {$b->{"creation_date"} <=>
                                                $a->{"creation_date"}}
                                               @{$_->{"releases"}})],
                            }} values %$json)];
    addScriptID($scripts);
    formatScripts($scripts, openDBs());
    return;
}
getAllScripts();
# vim: ft=perl tw=80 ts=4 sts=4 sw=4 et fmr=▶,▲
