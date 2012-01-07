#!/usr/bin/perl
use strict;
use warnings;

use JSON;
use LWP::Simple;

if($ARGV[0] eq "--help") {
    print "Usage: $0 regex\n";
    print "You must run this with current directory set to vam-kr root.\n";
    print "Do not forget to run\n";
    print "    curl 'http://www.vim.org/script-info.php' > vodb.json\n";
    print "before running this script.\n";
    exit 0;
}

binmode STDOUT, ':utf8';

my $scmdb="db/scmsources.vim";
my $vimorg="http://www.vim.org";
my $vodburl="$vimorg/script-info.php";

my $regex=shift @ARGV;
$regex=qr($regex);

my $sumreg=$regex;
my $descreg=$regex;
my $instreg=$regex;

my $VIM;
open $VIM, '<:utf8', $scmdb;

my %knownsources=();
local $_;
while(<$VIM>) {
    next unless /^(?:" )?let scmnr\.(\d+)\s*=/;
    $knownsources{$1}=$_;
}
close $VIM;

# my %vo=%{JSON::decode_json(LWP::Simple::get($vodburl))};
my $VODB;
open $VODB, '<:utf8', "vodb.json";
my %vo=%{JSON::decode_json(join "", <$VODB>)};
close $VODB;
sub PrintWithPrefix {
    my ($prefix, $text)=@_;
    print $prefix;
    $prefix=~s/./ /g;
    $text=~s/\r//g;
    local $_;
    my @lines=split /\n/, $text;
    print (shift @lines);
    print "\n";
    for my $line (map {"$prefix$_"} @lines) {
        print "$line\n";
    }
}
sub PrintSinfo {
    my ($sinfo)=@_;
    print "Script type: ".$sinfo->{"script_type"}."\n";
    print "Author: ";
    print $sinfo->{"first_name"} if($sinfo->{"first_name"});
    print " " if($sinfo->{"first_name"} and $sinfo->{"last_name"});
    print $sinfo->{"last_name"} if($sinfo->{"last_name"});
    print "\n";
    print "Summary: ".$sinfo->{"summary"}."\n";
    PrintWithPrefix("Description: ", $sinfo->{"description"});
    PrintWithPrefix("Install details: ", $sinfo->{"install_details"});
}
for my $snr (sort {$a<=>$b} (grep {not defined $knownsources{$_}} (keys %vo))) {
    my $sinfo=$vo{$snr};
    if(defined $sumreg and $sinfo->{"summary"} =~ $sumreg) {
        print "Summary matches for $snr:\n";
        PrintSinfo($sinfo);
    }
    elsif(defined $descreg and $sinfo->{"description"} =~ $descreg) {
        print "\nDescription matches for $snr:\n";
        PrintSinfo($sinfo);
    }
    elsif(defined $instreg and $sinfo->{"install_details"} =~ $instreg) {
        print "Installation details match for $snr:\n";
        PrintSinfo($sinfo);
    }
}
