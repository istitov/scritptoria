## Author: iohann.s.titov
## Keywords: temperature analysis
## Maintainer: iohann.s.titov
#This function derives value of magnetocaloric effect
# from the temperature dependence measured on the following protocol
# H=0, dH/dt>0, H=H_0, dH/dt<0, H=0
#
function [T_1, dT_1, T_2, dT_2] = dT (filename)

T_1 = NaN; dT_1 = NaN; T_2 = NaN; dT_2 = NaN;
#load file
datum = dlmread(filename)(3:end,3:6)
datum(:,2:4)=datum(:,1:3)
x = datum(:,1); y = datum(:,3); z = datum(:,4);
#finding areas for approximation
i = 1; t(1)=i;

do i++; until ( abs(diff(z)(i))> 0.0004)
t(2)=i;

do i++; until ( abs(diff(z)(i))< 0.0004)
t(3)=i;

do i++; until ( abs(diff(z)(i))> 0.0004)
t(4)=i;

do i++; until ( abs(diff(z)(i))< 0.0004)
t(5)=i;

do i++; until ( abs(diff(z)(i))> 0.0004)
t(6)=i;

#approximation
k_1 = polyfit(x(t(1):t(2)),y(t(1):602),1);
k_2 = polyfit(x(t(3):t(4)),y(t(3):t(4)),1);
k_3 = polyfit(x(t(5):t(6)),y(t(5):t(6)),1);

#integration
for C = t(2):t(3)
D(C) = (trapz (x(t(2):C),polyval(k_1,x(t(2):C))) - trapz (x(t(2):C),y(t(2):C))) 
- (trapz (x(C:t(3)),y(C:t(3))) - trapz (x(C:t(3)),polyval(k_2,x(C:t(3)))) );
endfor;

for C = t(4):t(5)
D(C) = (trapz (x(t(4):C),polyval(k_2,x(t(4):C)))-trapz (x(t(4):C),y(t(4):C)))
- (trapz (x(C:t(5)),y(C:t(5))) - trapz (x(C:t(5)),polyval(k_3,x(C:t(5)))) );
endfor;

Z = inline("interp1(D,x,'cubic')","x");
X_1 = fzero (Z,[t(2),t(3)]);
X_2 = fzero (Z,[t(4),t(5)]);

#definition of temperatures
T_1 = polyval(k_1,X_1); 
dT_1 = polyval(k_2,X_1) - polyval(k_1,X_1);
T_2 = polyval(k_2,X_2);
dT_2 = polyval(k_3,X_2) - polyval(k_2,X_2);
#output 
plot(x,y,'k.');
hold on;
plot(x(t(1):t(3)),polyval(k_1,x(t(1):t(3))),'r-');
plot(x(t(2):t(5)),polyval(k_2,x(t(2):t(5))),'r-');
plot(x(t(4):t(6)),polyval(k_3,x(t(4):t(6))),'r-');

plot([X_1,X_1],[polyval(k_1,X_1),polyval(k_2,X_1)],'g-');
plot([X_2,X_2],[polyval(k_2,X_2),polyval(k_3,X_2)],'g-');

xlabel("Time, s"); ylabel("Temperature, K");
print ("-dpng", strcat(filename(1:end-3),"png"));
endfunction
