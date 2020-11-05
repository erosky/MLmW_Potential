#!/bin/bash

input=components_longhalfindent10.dat

output=integral_longhalfindent10.txt

Z=100
H=$(expr $Z / 2)
dz=1

echo 'top and bottom: ' >> $output
awk 'BEGIN { I = 0 } { I += $8 } END { print I/2 }' $input >> $output

echo 'top: ' >> $output
awk -v H=$H 'BEGIN { I = 0 } {if (NR > H) { I += $8 }} END { print I }' $input >> $output

echo 'bottom: ' >> $output
awk -v H=$H 'BEGIN { I = 0 } {if (NR < H) { I += $8 }} END { print I }' $input >> $output
