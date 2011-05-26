#!/usr/bin/perl -w
use strict;
use XML::Mini::Document;
foreach  $_(@ARGV){
my $xmlDoc = XML::Mini::Document->new();
$xmlDoc->parse($_);
s/\.xrdml$|$/\.csv/i ;
open OUT, ">", "$_" ;
select OUT;

print "\[Measurement conditions\] \n" ;
print "Sample identification,\n" ;
my $part = $xmlDoc->getElement('comment');
print 'Comment - 1,"', $part->getElementByPath('entry',1)->getValue, "\"\n" ; 
print 'Comment - 2,"', $part->getElementByPath('entry',2)->getValue, "\"\n" ;
print 'Comment - 3,"', $part->getElementByPath('entry',3)->getValue, "\"\n" ;
print 'Comment - 4,"', $part->getElementByPath('entry',4)->getValue, "\"\n" ;
print 'Comment - 5,"', $part->getElementByPath('entry',5)->getValue, "\"\n" ;

$part = $xmlDoc->getElement('xrdMeasurement');
print "Anode material,", $part->getElementByPath('incidentBeamPath/xRayTube/anodeMaterial')->getValue, "\n" ;
print "K-Alpha1 wavelength,", $part->getElementByPath('usedWavelength/kAlpha1')->getValue, "\n" ;
print "K-Alpha2 wavelength,", $part->getElementByPath('usedWavelength/kAlpha2')->getValue, "\n" ;
print "Ratio K-Alpha2/K-Alpha1,", $part->getElementByPath('usedWavelength/ratioKAlpha2KAlpha1')->getValue, "\n" ;
print "Monochromator used,NO\n" ; #Couldn't find corresponding field in .xrdml file :-(
print "Generator voltage, ", $part->getElementByPath('incidentBeamPath/xRayTube/tension')->getValue, "\n" ;
print "Tube current, ", $part->getElementByPath('incidentBeamPath/xRayTube/current')->getValue, "\n" ;
print "File date and time, ",$part->getElementByPath('scan/header/startTimeStamp')->getValue , "\n" ;
print "Unit cell," , "\n" ; #Couldn't find corresponding field in .xrdml file :-(
print "h k l, 0 0 0 " , "\n" ; #Couldn't find corresponding field in .xrdml file :-(
print "Scan axis,", $part->getElementByPath('scan/')->attribute('scanAxis'), "\n" ;
print "Scan range,", $part->getElementByPath('scan/dataPoints/positions/startPosition',1,1,1,1)->getValue,",",$part->getElementByPath('scan/dataPoints/positions/endPosition',1,1,1,1)->getValue, "\n" ;
$_ = $part->getElementByPath('/scan/dataPoints/intensities')->getValue;
s/\n//g;
my @dpoints = split / /, $_ ;
chomp @dpoints;
my $step_size =  (( sprintf "%.12f",$part->getElementByPath('scan/dataPoints/positions/endPosition',1,1,1,1)->getValue - sprintf "%.12f",$part->getElementByPath('scan/dataPoints/positions/startPosition',1,1,1,1)->getValue)/ (@dpoints - 1)) ;
printf "Scan step size, %8.7f\n", $step_size ;
printf "No. of points, %d\n" , scalar @dpoints ;
print "Scan type," , $part->getElementByPath('scan')->attribute('mode'), "\n" ;
print "Time per step," , $part->getElementByPath('scan/dataPoints/commonCountingTime')->getValue, "\n" ;
print "\[Scan points\]\n" ;
print "Angle,Intensity\n" ;
my $step = (sprintf "%.12f",$part->getElementByPath('scan/dataPoints/positions/startPosition',1,1,1,1)->getValue)-$step_size; 
foreach my $dpoints (@dpoints) {
	printf  "%.9f,%.1f\n", $step+=$step_size, $dpoints;
}
close OUT;
}