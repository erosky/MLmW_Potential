#!/usr/bin/python
# Use:
# python3 plot_curves.py temp1 temp2 temp3

import sys
import matplotlib.pyplot as plt
import matplotlib.tri as tri
import numpy as np

N_args = len(sys.argv)
inputs = sys.argv
temps = inputs[2:]
N_inputs = len(temps)
output = inputs[1]

# load data
# plot all trials on same plot, highlight freezing temperature

#data = np.loadtxt('analysis/run_0/ice_ratio_smooth.dat')


x_temp = []
y_Ndens = []
z_pres = []

for temp in temps:
	data_file = temp + "/pres_density.dat"
	data = np.loadtxt(data_file)
	data = np.transpose(data)
	
	pres_avg = data[0]
	pres_std = data[1]
	Ndens_avg = data[2]
	Ndens_std = data[3]
	mdens_avg = data[4]
	mdens_std = data[5]
	for i in range(len(pres_avg)):
		x_temp.append(float(temp))
		z_pres.append(pres_avg[i])
		y_Ndens.append(Ndens_avg[i])
		

np.random.seed(19680801)
npts = 32
ngridx = 25
ngridy = 32


# -----------------------
# Interpolation on a grid
# -----------------------
# A contour plot of irregularly spaced data coordinates
# via interpolation on a grid.

# Create grid values first.
xi = np.linspace(205, 230, ngridx)
yi = np.linspace(0.0300, 0.0336, ngridy)

# Linearly interpolate the data (x, y) on a grid defined by (xi, yi).
triang = tri.Triangulation(x_temp, y_Ndens)
interpolator = tri.LinearTriInterpolator(triang, z_pres)
Xi, Yi = np.meshgrid(xi, yi)
zi = interpolator(Xi, Yi)

# Note that scipy.interpolate provides means to interpolate data on a grid
# as well. The following would be an alternative to the four lines above:
#from scipy.interpolate import griddata
#zi = griddata((x, y), z, (xi[None, :], yi[:, None]), method='linear')

plt.figure(1)
plt.contour(xi, yi, zi, levels=14, linewidths=0.5, colors='k')
cntr1 = plt.contourf(xi, yi, zi, levels=14, cmap="RdBu_r")

plt.colorbar(cntr1)
#plt.plot(x_temp, y_Ndens, 'ko', ms=3)
plt.xlabel("Temperature (K))")
plt.ylabel("Number density (1/A^3)")
plt.savefig(output)

# write searchable data
# save the x and y axis in temp_axes.csv and density_axes.csv
# save the searchable pressure (z) array in a separate file pressure_grid.csv
#
np.savetxt('temp_axes.csv', xi, delimiter=',')  
np.savetxt('density_axes.csv', yi, delimiter=',') 
np.savetxt('pressure_grid.csv', zi, delimiter=',')

