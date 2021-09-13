#!/usr/bin/python
# Use:
# python3 plot_curves.py /path/output /temperature1/input /temperature2/input /temperature3/input

import sys
import numpy as np
import matplotlib.pyplot as plt

N_args = len(sys.argv)
inputs = sys.argv
input_files = inputs[2:]
N_inputs = len(input_files)
output = inputs[1]

# load data
# plot all trials on same plot, highlight freezing temperature

#data = np.loadtxt('analysis/run_0/ice_ratio_smooth.dat')

plt.figure(1)

for inputfile in input_files:
	data_file = inputfile
	data = np.loadtxt(data_file)
	data = np.transpose(data)

	pres_avg = data[0]
	pres_std = data[1]
	Ndens_avg = data[2]
	Ndens_std = data[3]
	mdens_avg = data[4]
	mdens_std = data[5]

	plt.errorbar(mdens_avg, pres_avg, yerr=pres_std, xerr=mdens_std, fmt='-o', label=inputfile)

plt.xlabel("Density (g/cm^3)")
plt.ylabel("Pressure (atm)")
plt.legend()
plt.savefig(output)


