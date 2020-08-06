#!/bin/bash

output=components_6A.dat

dumpfile=prod.slab_289K_1atm.dump

volume=30000

truncate -s 0 $output

for Z in {0..100}
do
        # make temporary data file 
        touch $Z.dat
        text="BEGIN { Z = $Z ; thickness = 6 ; V = $volume ; start = 0 ; t = 0 ; Pxx = 0 ; Pyy = 0 ; Pzz = 0 } "
        sed -i -E "16 s/^.*$/$text/" compute_components.awk # replace Z variable in script
	./compute_components.awk $dumpfile > $Z.dat
	
	# record values and remove temp file
	awk '{print $0}' $Z.dat >> $output
	rm $Z.dat

done
