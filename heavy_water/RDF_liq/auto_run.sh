#!/bin/bash


cd Ice_Box/295K_m500atm
python3 ../Data_Analysis/compute_properties.py run.dat properties.txt

cd ../298K_m1000atm
python3 ../Data_Analysis/compute_properties.py run.dat properties.txt

cd ../292K_1atm
python3 ../Data_Analysis/compute_properties.py run.dat properties.txt
