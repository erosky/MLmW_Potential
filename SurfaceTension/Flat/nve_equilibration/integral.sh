#!/bin/bash

input=components.dat

output=integral.txt

Z=100
dz=1

awk 'BEGIN { I = 0 } { I += $8 } END { print I/2 }' $input >> $output
