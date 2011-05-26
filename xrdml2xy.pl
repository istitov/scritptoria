#!/usr/bin/perl -w
use strict;
use XML::Mini::Document;
foreach  $_(@ARGV){
my $xmlDoc = XML::Mini::Document->new();
$xmlDoc->parse($_);
s/\.xrdml$|$/\.xy/i ;
open OUT, ">", "$_" ;
select OUT;

my $part = $xmlDoc->getElement('xrdMeasurement');
$_ = $part->getElementByPath('/scan/dataPoints/intensities')->getValue();
s/\n//g;
my @dpoints = split / /, $_ ;
chomp @dpoints;
my $step_size =  (( sprintf "%.12f",$part->getElementByPath('scan/dataPoints/positions/endPosition',1,1,1,1)->getValue() - sprintf "%.12f",$part->getElementByPath('scan/dataPoints/positions/startPosition',1,1,1,1)->getValue())/ (@dpoints - 1)) ;
my $step = (sprintf "%.12f",$part->getElementByPath('scan/dataPoints/positions/startPosition',1,1,1,1)->getValue())-$step_size; 
foreach my $dpoints (@dpoints) {
	printf  "%.9f %.1f\n", $step+=$step_size, $dpoints;
}
close OUT;
}