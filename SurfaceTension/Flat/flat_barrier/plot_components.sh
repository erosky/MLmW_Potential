# Plot and save Pot Energy
gnuplot -e "set terminal png size 1000,600; \
            set output 'N-6.png'; \
            set title 'Number of Molecules in Slice'; \
            set ylabel 'N'; \
            set xlabel 'Z (Anstroms)'; \
            set style data lines; \
            plot 'components_6A.dat' using 1:7"

# Plot and save Pot Energy vs Temp
gnuplot -e "set terminal png size 1000,600; \
            set output 'P_T-6.png'; \
            set title 'Tangential Pressure'; \
            set ylabel 'Pressure'; \
            set xlabel 'Z (Angstroms)'; \
            set style data lines; \
            plot 'components_6A.dat' using 1:6"

# Plot and save Total Energy
gnuplot -e "set terminal png size 1000,600; \
            set output 'P_N-6.png'; \
            set title 'Normal Pressure'; \
            set ylabel 'Pressure'; \
            set xlabel 'Z (Angstroms)'; \
            set style data lines; \
            plot 'components_6A.dat' using 1:5"

# Plot and save Total Energy
gnuplot -e "set terminal png size 1000,600; \
            set output 'Pn_Pt-6.png'; \
            set title 'P_n - P_t'; \
            set ylabel 'P_n - P_t'; \
            set xlabel 'Z (Angstroms)'; \
            set style data lines; \
            plot 'components_6A.dat' using 1:8"
