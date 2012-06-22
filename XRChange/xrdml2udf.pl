#!/usr/bin/perl -w
use strict;
use XML::Mini::Document;
foreach  $_(@ARGV){
my $xmlDoc = XML::Mini::Document->new();
$xmlDoc->parse($_);
s/\.xrdml$|$/\.udf/i ;
open OUT, ">", "$_" ;
select OUT;

print "SampleIdent,,/\n" ;
my $part = $xmlDoc->getElement('comment');
print "Title1,", $part->getElementByPath('entry',1)->getValue, ",/\n" ; 
print "Title2,", $part->getElementByPath('entry',2)->getValue, ",/\n" ;
$_ = $part->getElementByPath('entry',4)->getValue ;
s/Diffractometer system=//i ;
print "DiffrType,",$_, ",/\n";

$part = $xmlDoc->getElement('xrdMeasurement');
print "DiffrNumber,",$part->getElementByPath('scan')->attribute('appendNumber')+1 , ",/\n";
print "Anode,", $part->getElementByPath('incidentBeamPath/xRayTube/anodeMaterial')->getValue, ",/\n" ;
print "LambdaAlpha1, ", $part->getElementByPath('usedWavelength/kAlpha1')->getValue, ",/\n" ;
print "LambdaAlpha2, ", $part->getElementByPath('usedWavelength/kAlpha2')->getValue, ",/\n" ;
print "RatioAlpha21, ", $part->getElementByPath('usedWavelength/ratioKAlpha2KAlpha1')->getValue, ",/\n" ;
$_ = $part->getElementByPath('incidentBeamPath/divergenceSlit')->attribute('xsi:type');
s/DivergenceSlitType//i;
print "DivergenceSlit,$_, ", $part->getElementByPath('incidentBeamPath/divergenceSlit/irradiatedLength')->getValue,",/\n" ;
print "ReceivingSlit,UNDEFINED" , ",/\n" ;#Couldn't find corresponding field in .xrdml file :-(
print "MonochromatorUsed,NO,/\n" ;#Couldn't find corresponding field in .xrdml file :-(
print "GeneratorVoltage, ", $part->getElementByPath('incidentBeamPath/xRayTube/tension')->getValue, ",/\n" ;
print "TubeCurrent, ", $part->getElementByPath('incidentBeamPath/xRayTube/current')->getValue, ",/\n" ;
print "FileDateTime, ",$part->getElementByPath('scan/header/startTimeStamp')->getValue , ",/\n" ;
print "DataAngleRange, ", $part->getElementByPath('scan/dataPoints/positions/startPosition',1,1,1,1)->getValue,", ",$part->getElementByPath('scan/dataPoints/positions/endPosition',1,1,1,1)->getValue, ",/\n" ;
$_ = $part->getElementByPath('/scan/dataPoints/intensities')->getValue;
s/\n//g;
my @dpoints = split / /, $_ ;
chomp @dpoints;
my $step_size =  (( sprintf "%.12f",$part->getElementByPath('scan/dataPoints/positions/endPosition',1,1,1,1)->getValue - sprintf "%.12f",$part->getElementByPath('scan/dataPoints/positions/startPosition',1,1,1,1)->getValue)/ (@dpoints - 1)) ;
printf "ScanStepSize, %12.11f,/\n", $step_size ;
print "ScanType," , $part->getElementByPath('scan')->attribute('mode'), ",/\n" ;
print "ScanStepTime, " , $part->getElementByPath('scan/dataPoints/commonCountingTime')->getValue, ",/\n" ;
print "RawScan\n" ;
my $step = (sprintf "%.12f",$part->getElementByPath('scan/dataPoints/positions/startPosition',1,1,1,1)->getValue)-$step_size; 
while (@dpoints) { #Could use \t instead of 4 spaces, but it it used in standart... :-(
	print "   ",shift @dpoints,",    ", shift @dpoints,",    ", shift @dpoints,",    ", shift @dpoints,",    ", shift @dpoints,",    ", shift @dpoints,",    ", shift @dpoints,",    ", shift @dpoints, "\n";
}
print "/\n" ;
close OUT;
}