#!/bin/bash

input=components_indentNONE2.dat

output=integral_indentNONE2.txt

Z=100
dz=1

awk 'BEGIN { I = 0 } { I += $8 } END { print I/2 }' $input >> $output
