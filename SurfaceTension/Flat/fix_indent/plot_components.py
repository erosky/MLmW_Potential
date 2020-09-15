import numpy as np
import matplotlib.pyplot as plt


data = np.loadtxt("components_6A.dat")
data = np.transpose(data)
z = data[0][:-1]
print (z)
number = np.roll(data[6][1:],15)
tangential = np.negative(np.roll(data[5][:-1],15))
normal = np.negative(np.roll(data[4][:-1],15))


plt.figure(1)
plt.xlabel('Angstrom')
plt.ylabel('Number')
plt.plot(z, number, color='#000066')
plt.savefig('number.png', dpi=200)

plt.figure(2)
plt.xlabel('Angstrom')
plt.ylabel('Pressure (atm)')
plt.plot(z, tangential, color='#000066', label="tangential")
plt.plot(z, normal, color='#cc99ff', label="normal")
plt.legend()
plt.savefig('pressure.png', dpi=200)

