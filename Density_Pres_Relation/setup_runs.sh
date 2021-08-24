#! /bin/bash
#
# Set up new folder for running simulations
# Input directory, pressure, start temp, end temp, steps, model


# Temperatures
for TEMP in 205 210 215 220 225 230
do
	mkdir $TEMP
	for MPRES in 1000 950 900 850 800 750 700 650 600 550 500 450 400 350 300 250 200 150 100 50 
	do
		./create_runs.sh $TEMP $MPRES m
	done
	
	
	for PPRES in 0 1 50 100 150 200 250 300 350 400 450 500
	do
		./create_runs.sh $TEMP $PPRES p
	done
done


