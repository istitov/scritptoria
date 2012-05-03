## Author: iohann.s.titov
## Keywords: BES3T format conversion
## Maintainer: iohann.s.titov
#That particular function that makes magic :-)
function dta2dat (filename)
y= textread (filename, "%s","commentstyle","*");
CenterField = str2double(y{find(index(y,"CenterField"))+1});
SweepWidth = str2double(y{find(index(y,"SweepWidth"))+1});
Resolution = str2double(y{find(index(y,"Resolution"))+1});
filename(end-2:end)="DTA";
fid = fopen (filename,"rb"); q=fread(fid,"double","ieee-be") ;  fclose (fid);
clear y;

StartField = CenterField + 0.5 * abs(SweepWidth);
EndField = CenterField - 0.5 * abs(SweepWidth);
FieldStep = SweepWidth/(Resolution-1);

filename(end-3:end+1) ="_.DAT";
fid=fopen(filename,"w");
fprintf(fid,"#index\tField [G]\tIntensity []\n");

for i = 1:Resolution
fprintf(fid,"%d\t%f\t%f\n",i,(i-1)*FieldStep,q(i));
endfor;
fclose(fid);
clear q,i;
endfunction

