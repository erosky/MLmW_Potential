#!/bin/bash

# USAGE: ./validate_water.sh LOG_FILE OUTPUT_DATA_FILE


# Create a data file of wanted lines from timestep START to END

#awk '{print $1}' $1
echo $1
echo $2

start=4193
# count number of lines in log file. subtract 
end=44191

datafile=$2


sed "s/^[ \t]*//" $1 | awk -v start=${start} -v end=${end} '{if ((NR>start)&&(NR<end)) {print $0}}' > ${datafile}


