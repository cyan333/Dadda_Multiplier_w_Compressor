run:
	module load synopsys/vcs/2017
	module load synopsys
compile:
	vcs -full64  +v2k -debug_all time half_adder.v full_adder.v product_8x8.v compressor_4_2.v compressor_4_2_ld.v
simv:
	./simv -gui &
DVE:
	dve -full64 -vpd inter.vpd &

