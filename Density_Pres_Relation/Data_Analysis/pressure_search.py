#!/usr/bin/python
# Use:
# python3 pressure_search.py temperature number_density
#
# will work in the range of 205 to 230 K for the ML-mW water model

import sys
import matplotlib.pyplot as plt
import matplotlib.tri as tri
import numpy as np

N_args = len(sys.argv)
inputs = sys.argv

# check validity if inputs
if (len(inputs) != 3):
	print ("incorrect number of inputs")
	quit()
	
temp = float(inputs[1])
dens = float(inputs[2])

if not ((float(temp)<=230) and (float(temp)>=205)):
	print ("temperature out of range")
	quit()

if not ((float(dens)<=0.0336) and (float(dens)>=0.0300)):
	print ("density out of range")
	quit()	

# load data
# plot all trials on same plot, highlight freezing temperature

#data = np.loadtxt('analysis/run_0/ice_ratio_smooth.dat')


temp_ax = np.loadtxt('../temp_axes.csv', delimiter=',')
dens_ax = np.loadtxt('../density_axes.csv', delimiter=',')
pres_grid = np.loadtxt('../pressure_grid.csv', delimiter=',')

# find temperature and density index
#
def closest(lst, K):
      
     lst = np.asarray(lst)
     idx = (np.abs(lst - K)).argmin()
     return idx

temp_x = closest(temp_ax, temp)
dens_y = closest(dens_ax, dens)


# Search pressure grid to find the corresponding pressure
#
pressure = pres_grid[dens_y][temp_x]


if np.isnan(pressure):
	print ("pressure value unavailable, either larger than 600 atm, or smaller than -1000 atm")
else: print (pressure)



