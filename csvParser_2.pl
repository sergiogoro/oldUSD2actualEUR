#! /usr/bin/env perl

use strict;
use feature 'say';
use Text::CSV;
use Data::Dumper;
use YAML qw(Dump);

my $csvFile = shift || die "Pásame un fichero csv con la relación 'Fecha,precioDelEuroEnDolares'";
my $date = shift || die "Pásame una fecha";
my $USDamount = shift || die "Pásame una cantidad de dolares";

open my $fh, "<:encoding(utf8)", $csvFile or die "$csvFile $!";

my @rows;
my $csv = Text::CSV->new ( { binary => 1 } )  # should set binary attribute.
    or die "Cannot use CSV: ".Text::CSV->error_diag ();
                 
while ( my $row = $csv->getline( $fh ) ) {
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
close $fh;

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



