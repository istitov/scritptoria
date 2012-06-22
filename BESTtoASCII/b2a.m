%With this code we convert to ASCII files all BEST file at given path.
filename = glob ("*.DSC");
for j = 1: size(filename)(1) dta2dat(filename{j}) endfor;
clear j;

%With this code we convert to all ASCII files at given path to "Collective graph".
filename = glob ("*_.dat")
y = zeros(4096,size(filename)(1));
for j = 1: size(filename)(1)
y(:,j)= textread (filename{j}, "%*d %*f %f","commentstyle","#");

endfor;

x = transpose(0:3.907204:16002);
plot(x,y);

%With this code we convert to all ASCII files at given path to "Collective graph" and makes "collective ASCII".

%With this code we convert to all ASCII files at given path to "Collective graph".
filename = glob ("*.DAT")
y = zeros(4096,size(filename)(1));
x = transpose(0:3.9062:16002);
for j = 1: size(filename)(1)  y(:,1)=textread (filename{j}, "%*d %*f %f","commentstyle","#"); filename{j}(end-2:end)="png" ; saveas(plot(x,y),filename{j}); endfor

plot(x,y);
saveas(plot(x,y),"Ni_55Mn_20Sn_25.png")

filename = glob ("*.DAT");
y = zeros(4096,size(filename)(1));

fid=fopen("Ni45Mn30Ga25.DAT","w");
fprintf(fid,"Field[G],\t")
for j = 1: size(filename)(1) fprintf(fid,"%s\t",strread(filename{j},"%s","delimiter",'-'){2}); endfor;
fprintf(fid,"\n");

for j = 1: size(filename)(1) y(:,j)= textread (filename{j}, "%*d %*f %f","commentstyle","#"); endfor;

%Searches subdirectories
dirname = glob("*/");
for k = 1:size(dirname)(1);
fid = fopen(strcat(dirname{k}(1:end-1),".DAT"),"w");
filename = glob (strcat(dirname{k},"Ni*.DAT"));
y = zeros(4096,size(filename)(1));
x = transpose(0:3.9062:16000-1);
fprintf(fid,"Field[G],\t")
for j = 1: size(filename)(1) fprintf(fid,"%s\t",strread(filename{j},"%s","delimiter",'-'){2}); endfor;
fprintf(fid,"\n");
for j = 1: size(filename)(1) y(:,j)= textread (filename{j}, "%*d %*f %f","commentstyle","#"); endfor;
fclose(fid);
dlmwrite (strcat(dirname{k}(1:end-1),".DAT"), [x,y], "-append","delimiter", "\t", "newline", "\\n");
endfor;

function dat2imagesc(filename)
filename = glob ("Ni_55Mn_20Sn_25/*.DAT");
y = zeros(4097,size(filename)(1));
x = transpose(0:3.9062:16000-1);
for j = 1: size(filename)(1) y(1,j) = str2double(strread(filename{j},"%s","delimiter",'-'){2}(1:end-1)); endfor;
for j = 1: size(filename)(1) y(2:end,j)= textread (filename{j}, "%*d %*f %f","commentstyle","#"); endfor;
y=sort(y,2);
saveas(imagesc(y(1,:),x,y(2:end,:)),"-2D.png");
endfunction

function dat2png(filename)

endfunction

pcolor (x, y, c)
#least element in 2D matrix 
sort(sort(datum(2:end,2:end))(1,:))(1)
#max. el. in 2D matrix 
sort(sort(datum(2:end,2:end))(end,:))(end)

Fnyq = 12.207/2;Fc=1;[b,a]=butter(10, Fc/Fnyq);
output=filter(b,a,datum2(:,2));plot(datum(2:end,1), datum2(:,2), datum(2:end,1),output);axis([0,1600,0,2])

#Find *.csv files with xyy data 
filename = glob("Ni*/*csv");
# for each file in the list
for k = 1:size(filename)(1) 
# read data from csv file to datum
datum = dlmread (filename{k});
# first, let's plot out "raw data"
imagesc(datum(2:end,1),datum(1,2:end),datum'(2:end,2:end));
#set title
#title ( filename{k}(1:end-4));
#title(regexprep(regexprep(filename{k},'/.+csv','$1'),'_(\d{2})','_{$1}'));
#set x- and y- axis label
xlabel ( "Field, G"); ylabel ( "Temperature, K ");
#remove legend
#legend( "option", "off");
#add colorbar
colorbar( "EastOutside");
print ("-dpng", strcat(filename{k}(1:end-4),"-raw-",".png"));
# create second array for "normalized data"
datum2 = zeros(size(datum(2:end,2:end)));
# for each column ( intensity(field), T=const) normalize intensity
for i = 1:size(datum(2:end,2:end))(2) datum2(:,i)= ((datum(2:end,i+1)-sort(datum(2:end,i+1))(1))./(sort(datum(2:end,i+1))(end)-sort(datum(2:end,i+1))(1))); endfor;                                                                                                 
#let's show the result
imagesc(datum(2:end,1),datum(1,2:end),datum2');
#set title
#title ( filename{k}(1:end-4));
#title(regexprep(regexprep(filename{k},'/.+csv','$1'),'_(\d{2})','_{$1}'));
#set x- and y- axis label
xlabel ( "Field, G"); ylabel ( "Temperature, K ");
#remove legend
#legend( "option", "off");
#add colorbar
colorbar( "EastOutside");
print ("-dpng", strcat(filename{k}(1:end-4),"-normalized-",".png"));

clear datum, datum2;
endfor

Fnyq = 12.207/2;Fc=0.001;[b,a]=butter(2, Fc/Fnyq);
for a = 1:29
datum3(1:1)=datum2(1,a); datum3(1:4096)=datum2(:,a);
datum4(1:4096,a)=filter(b,a,datum3)(1:4096);
datum4(:,a)= (datum4(:,a)-sort(datum4(:,a))(1))./(sort(datum4(:,a))(end)-sort(datum4(:,a))(1));
clear ("output","datum3");
endfor
plot(datum(2:end,1),datum4(:,1),datum(2:end,1),datum2(:,1),"."); axis([0,16000]);

widnowSize=100;
for a = 1:26
datum3(1:100)=datum2(1,a); datum3(101:4196)=datum2(:,a);
datum4(1:4096,a)=filter(ones(1,windowSize)/windowSize,1,datum3)(101:4196);
datum4(:,a)= (datum4(:,a)-sort(datum4(:,a))(1))./(sort(datum4(:,a))(end)-sort(datum4(:,a))(1));
clear ("output","datum3");
endfor
plot(datum(2:end,1),datum4(:,1),datum(2:end,1),datum2(:,1),"."); axis([0,16000]);
