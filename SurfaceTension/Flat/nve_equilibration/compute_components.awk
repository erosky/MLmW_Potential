#!/usr/bin/awk -f

# desired output:
# z, Pxx(z), Pyy(z), Pzz(z), Pn(z), Pt(z), (Pn-Pt), N

# values will be averaged over all timesteps

# TOTAL is the number of atoms in simulation, must remain constant throughout sim
# threshold is the height of a slice centered at z, in units of Angstroms
# The system is periodic so the slice will wrap around if at the edges of the simulation box

# each timestep, update the average value for each z 

# sim timestep is 10 fs each step, 0.000001 ns


BEGIN { Z = 100 ; thickness = 6 ; V = 30000 ; start = 0 ; t = 0 ; Pxx = 0 ; Pyy = 0 ; Pzz = 0 } 
{
	if ($2=="TIMESTEP") {
		if (start==1) { 
			Pxx += v_Pxx/V ; Pyy += v_Pyy/V ; Pzz += v_Pzz/V ; n += v_n ; t++ ; a = 0 ;
		}
		else { 
			start = 1 ; 
		}
	} 


	if ($2=="ATOMS") {
		a = 1 ; v_n = 0 ; v_Pxx = 0 ; v_Pyy = 0 ; v_Pzz = 0 ; next
	}
	if (a==1 && $5>Z-thickness && $5<Z+thickness) { v_Pxx += $14 ; v_Pyy += $15 ; v_Pzz += $16 ; v_n++ }
}
END { print Z "\t" Pxx/t "\t" Pyy/t "\t" Pzz/t "\t" Pzz/t "\t" 0.5*(Pxx/t + Pyy/t) "\t" n/t }
