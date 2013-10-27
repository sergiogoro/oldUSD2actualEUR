#! /usr/bin/env perl

use strict;
use feature 'say';
use Text::CSV;
use Data::Dumper;
use YAML qw(Dump);

my $csvRateFile = shift || die "Pásame un fichero csv con la relación 'Fecha,precioDelEuroEnDolares'";
my $csvDateUSDFile = shift || die "Pásame un fichero csv con la relación 'Fecha,Dolares'";

open my $fh1, "<:encoding(utf8)", $csvRateFile or die "$csvRateFile $!";
open my $fh2, "<:encoding(utf8)", $csvDateUSDFile or die "$csvDateUSDFile $!";

my @rows;
my $csv = Text::CSV->new ( { binary => 1 } )  # should set binary attribute.
    or die "Cannot use CSV: ".Text::CSV->error_diag ();
                 
while ( my $row = $csv->getline( $fh1 ) ) {
    #if ($row->[0] =~ $date) {
    #    say "AKI";
    #    say $row->[0];
    #    say $row->[1];
    #}
    $row->[0] =~ m/$date/ or next; # 3rd field should match
    my $actualEuro = transform($row->[1], $USDamount);
    say $actualEuro;

    push @rows, $row;
}
$csv->eof or $csv->error_diag();
close $fh1;

sub transform {
    my $usdRate = shift;
    my $usdAmount = shift;
    my $actualEuroValue = $usdAmount * $usdRate;
    return $actualEuroValue;
}


#foreach (@rows) {
#    say $_->[0];
#    say $_->[1];
#}

