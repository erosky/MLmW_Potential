#! /bin/bash

# TEMPS:
# 205 210 215 220 225 230

# PRESSURES:
# m1000 m950 m900 m850 m800 m750 m700 m650 m600 m550 m500 m450 m400 m350 m300 m250 m200 m150 m100 m50 p0 p1 p50 p100 p150 p200 p250 p300 p350 p400 p450 p500

cd ..
for TEMP in 205 210 215 220
do
	cd $TEMP
	touch pres_density.dat
	for PRES in m1000 m950 m900 m850 m800 m750 m700 m650 m600 m550 m500 m450 m400 m350 m300 m250 m200 m150 m100 m50 p0
	do
		cd $PRES
		start=500
		end=4040
		input=log.run_liquid_density_MLmW
		datafile=liquid_density.dat

		# No Modulo, using all daya points in log file
		#
		#sed "s/^[ \t]*//" $1 | awk -v start=${start} -v end=${end} '{if ((NR>start)&&(NR<end)) {print $0}}' > ${datafile}
	
		# Use modulo to reduce datapoints, and try to remove correlation between data points
		# mod 20 is every 20 data points taken
		#
		sed "s/^[ \t]*//" $input | awk -v start=${start} -v end=${end} '{if ((NR>start)&&(NR<end)&&(NR%10 == 0)) {print $0}}' > ${datafile}
		cd ..
		pwd
		python3 ../Data_Analysis/clean_data.py $PRES/liquid_density.dat ./pres_density.dat
	done
	cd ..
done


