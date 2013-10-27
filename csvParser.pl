#! /usr/bin/env perl

use strict; use feature 'say';
use Text::CSV;

use Data::Dumper; use YAML qw(Dump);

my $csvFile = shift || die "Quillo pásame un fichero csv!";


my @rows;
my $csv = Text::CSV->new ( { binary => 1 } )  # should set binary attribute.
    or die "Cannot use CSV: ".Text::CSV->error_diag ();
                 
open my $fh, "<:encoding(utf8)", $csvFile or die "$csvFile $!";

while ( my $row = $csv->getline( $fh ) ) {
    say $row->[0];
    say $row->[1];
    #$row->[2] =~ m/pattern/ or next; # 3rd field should match
    $row->[2] =~ m/USD/ or next; # 3rd field should match
    push @rows, $row;
}
$csv->eof or $csv->error_diag();
close $fh;

