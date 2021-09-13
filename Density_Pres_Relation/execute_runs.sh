#!/bin/bash


# TEMPS:
# 205 210 215 220 225 230

# PRESSURES:
# m1000 m950 m900 m850 m800 m750 m700 m650 m600 m550 m500 m450 m400 m350 m300 m250 m200 m150 m100 m50 p0 p1 p50 p100 p150 p200 p250 p300 p350 p400 p450 p500


for TEMP in 230
do
	cd $TEMP
	for PRES in m1000 m950 m900 m850 m800 m750 m700 m650 m600 m550 m500 m450 m400 m350 m300 m250 m200 m150 m100 m50 p0 p1 p50 p100 p150 p200 p250 p300 p350 p400 p450 p500
	do
		cd $PRES
		mpirun -np 6 ~/LAMMPS_Source/lammps/src/lmp_mpi -in in.liquid_density
		cd ..
	done
	cd ..
done

