run:
	module load synopsys/vcs/2017
	module load synopsys
compile:
	vcs -full64 +v2k -sverilog -debug_all dadda_16x16_uncompressed3.v product_16x16.v half_adder.v dadda_16x16_uncompressed_test.v full_adder.v rca_30b.v
simv:
	./simv -gui &
DVE:
	dve -full64 -vpd inter.vpd &

