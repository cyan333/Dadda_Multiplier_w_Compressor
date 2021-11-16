run:
	module load synopsys/vcs/2017
	module load synopsys
compile:
	vcs -full64  +v2k -debug_all time half_adder.v half_adder_test.v 
simv:
	./simv -gui &
DVE:
	dve -full64 -vpd inter.vpd &

