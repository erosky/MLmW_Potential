#!/bin/bash

# Verify that system is equilibrated by looking for 
# stable potential evergy and mean square displacement
# USAGE: ./validate_eq.sh



# Create data file of wanted lines from the log file START to END
echo $1

run=$1
start=115
end=136
logfile="log.water_box_298K_1atm_ML.eq_water"
datafile="water_box_298K_1atm_ML_eq.dat"

temp="298"
pres="1 atm"



# Convert timestep to ns, convert energies from kcal/mol to kJ/mol
sed "s/^[ \t]*//" ${logfile} | awk -v start=${start} -v end=${end} '{if ((NR>start)&&(NR<end)) { print $1/100000, $2, $3, $4, $5*4.184, $6*4.184, $7*4.184, $8, $9 }}' > ${datafile}


# Plot and save Pot Energy
gnuplot -e "set terminal png size 1000,600; \
            set output 'PE_${pres}_${temp}.png'; \
            set title 'Potential Energy - ${temp}K equilibration'; \
            set ylabel 'kJ/mol'; \
            set xlabel 'Time (ns)'; \
            set style data lines; \
            plot '${datafile}' using 1:7"

# Plot and save Mean square disp
gnuplot -e "set terminal png size 1000,600; \
            set output 'MSD_${pres}_${temp}.png'; \
            set title 'Mean Square Displacement vs Time - ${temp}K equilibration'; \
            set ylabel 'Angstroms'; \
            set xlabel 'Time (ns)'; \
            set style data lines; \
            plot '${datafile}' using 1:8"
