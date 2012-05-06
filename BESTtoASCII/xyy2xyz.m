## Author: iohann.s.titov@gmail.com
## Keywords: format conversion
## Maintainer: iohann.s.titov
#This function turns xyy table into xyz one.
#     z_1  z_2  z_3  ...      x_1 y_1 z_1
# x_1 y_11 y_12 y_13 ... ->   x_2 y_2 z_2
# x_2 y_21 y_22 y_23 ...      x_3 y_3 z_3
# Such data representation is required by Gnuplot and (sometimes) by Origin 7.x
function [data_xyz] = xyy2xyz(data_xyy)
x = size(data_xyy)(1)-1;
z = size(data_xyy)(2)-1;
data_xyz = zeros(x*z,3);
for i = 0:z-1
data_xyz(i*x+1:(i+1)*x,1)=data_xyy(2:end,1);
data_xyz(i*x+1:(i+1)*x,2)=data_xyy(2:end,i+2);
data_xyz(i*x+1:(i+1)*x,3)=data_xyy(1,i+2);
endfor
endfunction
