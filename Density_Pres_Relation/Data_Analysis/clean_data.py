#!/usr/bin/python
# Use:
# python3 clean_data.py /path/datafile /path/outputfile

# retrieved from lammps log files average values, standard deviations
# For each pressure, finds pressure variance, avg density and variance
# append to the outputfile

import sys
import numpy as np
import matplotlib.pyplot as plt

N_args = len(sys.argv)
inputs = sys.argv
input_file = inputs[1]
output = inputs[2]

# load data
# plot all trials on same plot, highlight freezing temperature

#data = np.loadtxt('analysis/run_0/ice_ratio_smooth.dat')
data_file = input_file
data = np.loadtxt(data_file)
data = np.transpose(data)

time = data[0]
temp = data[1]
pres = data[2]
vol = data[3]
m_dens = data[8]

N_dens = []
for i, v in enumerate(vol):
	N_dens.append(4175/v)
	
	
pres_avg = np.average(pres)
pres_std = np.std(pres)
Ndens_avg = np.average(N_dens)
Ndens_std = np.std(N_dens)
mdens_avg = np.average(m_dens)
mdens_std = np.std(m_dens)
	
f = open(output, "a")
f.write(str(pres_avg) + "\t" + str(pres_std) + "\t" + str(Ndens_avg) + "\t" + str(Ndens_std) + "\t" + str(mdens_avg) + "\t" + str(mdens_std) + "\n")
f.close()

