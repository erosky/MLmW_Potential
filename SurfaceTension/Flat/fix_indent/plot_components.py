import numpy as np
import matplotlib.pyplot as plt


data = np.loadtxt("components_longhalfindent0p1.dat")
data = np.transpose(data)
z = data[0]
print (z)
number = data[6]
tangential = np.negative(data[5])
normal = np.negative(data[4])


plt.figure(1)
plt.xlabel('Angstrom')
plt.ylabel('Number')
plt.plot(z, number, color='#000066')
plt.savefig('number_longhalfindent0p1.png', dpi=200)

plt.figure(2)
plt.xlabel('Angstrom')
plt.ylabel('Pressure (atm)')
plt.plot(z, tangential, color='#000066', label="tangential")
plt.plot(z, normal, color='#cc99ff', label="normal")
plt.legend()
plt.savefig('pressure_longhalfindent0p1.png', dpi=200)

