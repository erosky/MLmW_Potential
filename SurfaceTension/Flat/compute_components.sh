#!/bin/bash

output=components.dat

dumpfile=log.run_slab_289K_1atm

volume=30000

truncate -s 0 $output

for Z in {0..100}
do
        # make temporary data file 
        touch $Z.dat
        text="BEGIN { Z = $Z ; thickness = 12 ; V = $volume ; start = 0 ; t = 0 ; Pxx = 0 ; Pyy = 0 ; Pzz = 0 } "
        sed -i -E "16 s/^.*$/$text/" compute_components.awk # replace Z variable in script
	./compute_components.awk $dumpfile > $Z.dat
	
	# record values and remove temp file
	awk '{print $0}' $Z.dat >> $output
	# rm $Z.dat

done
