#!/usr/bin/perl
use XML::Simple;
my $clientes = XMLin("clientes.xml");
for( @{$clientes->{cliente}} ) {
  print "$_->{nombre} => $_->{pasta} ($_->{fecha})\n";
} 
