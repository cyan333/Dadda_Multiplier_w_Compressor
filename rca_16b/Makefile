run:
	module load synopsys/vcs/2017
	module load synopsys
compile:
	vcs -full64  +v2k -debug_all time rca_16b.v rca_16b_test.v 
simv:
	./simv -gui &
DVE:
	dve -full64 -vpd inter.vpd &

