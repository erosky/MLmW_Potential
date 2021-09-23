import numpy as np
import matplotlib.pyplot as plt


data = np.loadtxt("components_6A.dat")
data = np.transpose(data)
z = data[0][:-1]
print (z)
number = np.roll(data[6][1:],15)
tangential = np.negative(np.roll(data[5][:-1],15))
normal = np.negative(np.roll(data[4][:-1],15))
total = np.negative(np.roll(data[7][:-1],15))


plt.figure(1)
plt.xlabel('Angstrom')
plt.ylabel('Number Density')
plt.plot(z, number, color='#000066')
plt.savefig('number.png', dpi=200)

plt.figure(2)
plt.xlabel('Angstrom')
plt.ylabel('Pressure (atm)')
plt.plot(z, tangential, color='#000066', label="tangential")
plt.plot(z, normal, color='#cc99ff', label="normal")
plt.legend()
plt.savefig('pressure.png', dpi=200)


# load dens pres search data
#
temp_ax = np.loadtxt('temp_axes.csv', delimiter=',')
dens_ax = np.loadtxt('density_axes.csv', delimiter=',')
pres_grid = np.loadtxt('pressure_grid.csv', delimiter=',')

# find temperature and density index
#
def closest(lst, K):
      
     lst = np.asarray(lst)
     idx = (np.abs(lst - K)).argmin()
     return idx


temp = 225
dens_pres = []



for N in number:
	if not ((float(N)<=0.0336) and (float(N)>=0.0300)): dens_pres.append(0.0)
	else:
		temp_x = closest(temp_ax, temp)
		dens_y = closest(dens_ax, N)
		pressure = pres_grid[dens_y][temp_x] # Search pressure grid to find the corresponding pressure
		if np.isnan(pressure):
			dens_pres.append(0.0)
		else: dens_pres.append(pressure)




plt.figure(3)
plt.xlabel('Angstrom')
plt.ylabel('Pressure (atm)')
plt.plot(z, dens_pres, color='#000066')
plt.savefig('density_pressure.png', dpi=200)


plt.figure(4)
plt.xlabel('Angstrom')
plt.ylabel('Total Pressure (atm)')
plt.plot(z, total, color='#000066')
plt.savefig('total_pressure.png', dpi=200)
