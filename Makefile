run:
	module load synopsys/vcs/2017
	module load synopsys
compile:
	vcs -full64  +v2k -debug_all -sverilog rca_16b.v product_8x8.sv compressor_4_2.sv dadda_8x8_compressed.sv dadda_8x8_compressed_tb.sv
simv:
	./simv -gui &
DVE:
	dve -full64 -vpd inter.vpd &

