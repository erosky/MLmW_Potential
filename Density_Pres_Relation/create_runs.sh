#! /bin/bash
#
# Set up new folder for running simulations
# Input directory, pressure, start temp, end temp, steps, model


# Check for correct number of input arguments
if [ $# -ne 3 ]
then
  echo
  echo "  Usage: $0 temperature pressure sign(p/m)"
  echo "   e.g.: $0 215 1000 m"
  echo 
  exit ${E_ARGS}
fi

## make directory ##
####################
mkdir $1/$3$2

## make lammps input file ##
############################
cp in.template $1/$3$2/in.liquid_density
cp ML_mW.sw $1/$3$2/ML_mW.sw

# set temperatures
sed -i -E "13 s/[0-9]+/$1/" $1/$3$2/in.liquid_density
# set pressure
if [ $3 == 'p' ]
then
	sed -i -E "14 s/[0-9]+/$2/" $1/$3$2/in.liquid_density
fi
if [ $3 == 'm' ]
then
	sed -i -E "14 s/[0-9]+/-$2/" $1/$3$2/in.liquid_density
fi
