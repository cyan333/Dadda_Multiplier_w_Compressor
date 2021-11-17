run:
	module load synopsys/vcs/2017
	module load synopsys
compile:
	vcs -full64  +v2k -debug_all time gen_part_products.v gen_part_products_test.v 
simv:
	./simv -gui &
DVE:
	dve -full64 -vpd inter.vpd &

