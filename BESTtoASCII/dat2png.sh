#!/bin/bash   
#Used it for plotting out tons of FMR data.
for i in $( ls *.dat ); do
tail -n 4096 "$i" | gnuplot -persistent -e "set terminal png ; plot '-'  u 2:3 smooth bezier ;" > "$i".png 
done

