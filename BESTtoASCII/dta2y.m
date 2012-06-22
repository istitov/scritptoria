## Author: iohann.s.titov
## Keywords: BES3T format conversion
## Maintainer: iohann.s.titov
#This function turns DTA files into column of y-values.
function dta2y (filename)
filename(end-2:end)="DTA";
fid = fopen (filename,"rb"); q=fread(fid,"double","ieee-be") ;  fclose (fid);
clear y;
filename(end-3:end+1) ="_.DAT";
fid=fopen(filename,"w");
fprintf(fid,"#Intensity []\n");

for i = 1:size(q)(1)
fprintf(fid,"%f\n",q(i));
endfor;
fclose(fid);
clear q;
endfunction
