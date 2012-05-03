## Author: iohann.s.titov
## Keywords: BES3T format conversion
## Maintainer: iohann.s.titov
#This function turns DTA files into column of y-values.
function dta2y (filename)
filename(end-2:end)="DTA";
fid = fopen (filename,"rb"); q=fread(fid,"double","ieee-be") ;  fclose (fid);
clear y;

Data = zeros(Resolution,3);
filename(end-3:end+1) ="_.DAT";
fid=fopen(filename,"w");
fprintf(fid,"#index\tField [G]\tIntensity []\n");

for i = 1:Resolution
fprintf(fid,"%d\t%f\t%f\n",i,(i-1)*FieldStep,q(i));
endfor;
fclose(fid);
clear q,i,Data,i;
endfunction
