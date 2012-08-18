## Author: iohann.s.titov
## Keywords: plotting functions
## Maintainer: iohann.s.titov
#This function plots .prf files (Fullprof output files)
#loading files
function prf_plot (filename)
	fid = fopen(filename,"r");
#reading file by line
#reading header
# name    CELL:    a b c alpha beta gamma   SPGR: sp ace gro up

#num.of.phases num.points lambda1 lambda2 smth smth smth smth

#whatever line
# theta beginning end of excluded region(s)
#2Theta^IYobs^IYcal^IYobs-Ycal^IBackg^IBragg^IPosr^I(hkl)^IK
	data=zeros(1,5);
	bragg=zeros(1,7);
	i=1;
do
	line = fgetl(fid);
	until(strcmpi(regexprep(line,'\s*',' ')," 2Theta Yobs Ycal Yobs-Ycal Backg Bragg Posr (hkl) K"))
while(1)
	line = fgetl(fid);
	if (line == -1) break endif
	M=regexp(line,'([-+.\d]+)','match');
	data(i,1:5)=str2double(M(1:5));
	if(size(M)(2)==12) bragg(i,1:7)=str2double(M(6:12)); endif 
	i++;
	endwhile
	fclose(fid);

#plotting the data
	plot(data(:,1),data(:,2),'+',data(:,1),data(:,3),data(:,1),data(:,4));
	hold on;
#plotting bragg reflections
	plot(bragg(:,1),bragg(:,2),'.');
	axis ("tight");
endfunction
#determination of graph "borders"
#X axis, 2Theta
#	x(1)=sort(data(:,1))(1);
#	x(2)=sort(data(:,1))(end);
#Y axis. let's brainfuck begin
#y(1)=sort([sort(data(:,2))(1),
#		sort(data(:,3))(1),
#		sort(data(:,4))(1),
#		sort(data(:,5))(1)
#		])(1)
#y(2)=sort([sort(data(:,2))(end),
#		sort(data(:,3))(end),
#		sort(data(:,4))(end),
#		sort(data(:,5))(end)
#		])(end)
#axis([x(1),x(2),y(1),y(2)])
#	endfunction
