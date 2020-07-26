# Plot and save Pot Energy
gnuplot -e "set terminal png size 1000,600; \
            set output 'N.png'; \
            set title 'Number of Molecules in Slice'; \
            set ylabel 'N'; \
            set xlabel 'Z (Anstroms)'; \
            set style data lines; \
            plot 'components.dat' using 1:7"

# Plot and save Pot Energy vs Temp
gnuplot -e "set terminal png size 1000,600; \
            set output 'P_T.png'; \
            set title 'Tangential Pressure'; \
            set ylabel 'Pressure'; \
            set xlabel 'Z (Angstroms)'; \
            set style data lines; \
            plot 'components.dat' using 1:6"

# Plot and save Total Energy
gnuplot -e "set terminal png size 1000,600; \
            set output 'P_N.png'; \
            set title 'Normal Pressure'; \
            set ylabel 'Pressure'; \
            set xlabel 'Z (Angstroms)'; \
            set style data lines; \
            plot 'components.dat' using 1:5"
