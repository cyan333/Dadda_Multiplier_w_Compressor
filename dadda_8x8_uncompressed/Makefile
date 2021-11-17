run:
	module load synopsys/vcs/2017
	module load synopsys
compile:
	vcs -full64 +v2k -sverilog -debug_all dadda_8x8_uncompressed.v product_8x8.v half_adder.v dadda_8x8_uncompressed_test.v full_adder.v rca_14b.v
simv:
	./simv -gui &
DVE:
	dve -full64 -vpd inter.vpd &

