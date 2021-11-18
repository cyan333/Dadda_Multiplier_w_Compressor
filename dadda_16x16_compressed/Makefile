run:
	module load synopsys/vcs/2017
	module load synopsys
compile:
	vcs -full64  +v2k -debug_all -sverilog rca.v product_16x16.v compressor_4_2.sv dadda_16x16_compressed.sv dadda_16x16_compressed_tb.sv
simv:
	./simv -gui &
DVE:
	dve -full64 -vpd inter.vpd &

