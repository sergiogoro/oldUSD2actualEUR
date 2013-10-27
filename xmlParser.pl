#! /usr/bin/env perl
use XML::Simple; use Data::Dumper; use YAML qw(Dump); use feature 'say';

my $xmlFile = shift || die "Quillo pásame un fichero xml!";
my $xmlData = XMLin($xmlFile);

#say Dump $xmlData;

#say foreach ( $xmlData->{"DataSet"}->{"Group"}->{UNIT} );

#foreach my $key (keys %{ $xmlData }) {
#    say "key <$key>";
#}
#
#say "ref: " . ref($xmlData{Dataset});
#
say "Va";
foreach my $key ( @{ $xmlData->{DataSet}->{Series}->{Obs} } ) {
    say "key <$key>";
    say "elem <" . $xmlData->{DataSet}->{Series}->{Obs}->{"%{$key}"} . ">";
}
say "Fue";




#my $clientes = XMLin("clientes.xml");
#for( @{$clientes->{cliente}} ) {
#  print "$_->{nombre} => $_->{pasta} ($_->{fecha})\n";
#} 
