# ####################################################################

#  Created by Encounter(R) RTL Compiler v09.10-p104_1 on Thu Nov 18 14:27:19 CST 2021

# ####################################################################

set sdc_version 1.7

set_units -capacitance 1000.0fF
set_units -time 1000.0ps

# Set the current design
current_design dadda_8x8_uncompressed

set_clock_gating_check -setup 0.0 
set_wire_load_selection_group "WireAreaForZero" -library "tcbn65gplustc"
set_dont_use [get_lib_cells tcbn65gplustc/BHD]
set_dont_use [get_lib_cells tcbn65gplustc/BUFFD20]
set_dont_use [get_lib_cells tcbn65gplustc/BUFFD24]
set_dont_use [get_lib_cells tcbn65gplustc/BUFTD20]
set_dont_use [get_lib_cells tcbn65gplustc/BUFTD24]
set_dont_use [get_lib_cells tcbn65gplustc/CKBD20]
set_dont_use [get_lib_cells tcbn65gplustc/CKBD24]
set_dont_use [get_lib_cells tcbn65gplustc/CKLHQD20]
set_dont_use [get_lib_cells tcbn65gplustc/CKLHQD24]
set_dont_use [get_lib_cells tcbn65gplustc/CKLNQD20]
set_dont_use [get_lib_cells tcbn65gplustc/CKLNQD24]
set_dont_use [get_lib_cells tcbn65gplustc/CKND20]
set_dont_use [get_lib_cells tcbn65gplustc/CKND24]
set_dont_use [get_lib_cells tcbn65gplustc/GAN2D1]
set_dont_use [get_lib_cells tcbn65gplustc/GAN2D2]
set_dont_use [get_lib_cells tcbn65gplustc/GAOI21D1]
set_dont_use [get_lib_cells tcbn65gplustc/GAOI21D2]
set_dont_use [get_lib_cells tcbn65gplustc/GAOI22D1]
set_dont_use [get_lib_cells tcbn65gplustc/GBUFFD1]
set_dont_use [get_lib_cells tcbn65gplustc/GBUFFD2]
set_dont_use [get_lib_cells tcbn65gplustc/GBUFFD3]
set_dont_use [get_lib_cells tcbn65gplustc/GBUFFD4]
set_dont_use [get_lib_cells tcbn65gplustc/GBUFFD8]
set_dont_use [get_lib_cells tcbn65gplustc/GDCAP]
set_dont_use [get_lib_cells tcbn65gplustc/GDCAP10]
set_dont_use [get_lib_cells tcbn65gplustc/GDCAP2]
set_dont_use [get_lib_cells tcbn65gplustc/GDCAP3]
set_dont_use [get_lib_cells tcbn65gplustc/GDCAP4]
set_dont_use [get_lib_cells tcbn65gplustc/GDFCNQD1]
set_dont_use [get_lib_cells tcbn65gplustc/GDFQD1]
set_dont_use [get_lib_cells tcbn65gplustc/GFILL]
set_dont_use [get_lib_cells tcbn65gplustc/GFILL10]
set_dont_use [get_lib_cells tcbn65gplustc/GFILL2]
set_dont_use [get_lib_cells tcbn65gplustc/GFILL3]
set_dont_use [get_lib_cells tcbn65gplustc/GFILL4]
set_dont_use [get_lib_cells tcbn65gplustc/GINVD1]
set_dont_use [get_lib_cells tcbn65gplustc/GINVD2]
set_dont_use [get_lib_cells tcbn65gplustc/GINVD3]
set_dont_use [get_lib_cells tcbn65gplustc/GINVD4]
set_dont_use [get_lib_cells tcbn65gplustc/GINVD8]
set_dont_use [get_lib_cells tcbn65gplustc/GMUX2D1]
set_dont_use [get_lib_cells tcbn65gplustc/GMUX2D2]
set_dont_use [get_lib_cells tcbn65gplustc/GMUX2ND1]
set_dont_use [get_lib_cells tcbn65gplustc/GMUX2ND2]
set_dont_use [get_lib_cells tcbn65gplustc/GND2D1]
set_dont_use [get_lib_cells tcbn65gplustc/GND2D2]
set_dont_use [get_lib_cells tcbn65gplustc/GND2D3]
set_dont_use [get_lib_cells tcbn65gplustc/GND2D4]
set_dont_use [get_lib_cells tcbn65gplustc/GND3D1]
set_dont_use [get_lib_cells tcbn65gplustc/GND3D2]
set_dont_use [get_lib_cells tcbn65gplustc/GNR2D1]
set_dont_use [get_lib_cells tcbn65gplustc/GNR2D2]
set_dont_use [get_lib_cells tcbn65gplustc/GNR3D1]
set_dont_use [get_lib_cells tcbn65gplustc/GNR3D2]
set_dont_use [get_lib_cells tcbn65gplustc/GOAI21D1]
set_dont_use [get_lib_cells tcbn65gplustc/GOAI21D2]
set_dont_use [get_lib_cells tcbn65gplustc/GOR2D1]
set_dont_use [get_lib_cells tcbn65gplustc/GOR2D2]
set_dont_use [get_lib_cells tcbn65gplustc/GSDFCNQD1]
set_dont_use [get_lib_cells tcbn65gplustc/GTIEH]
set_dont_use [get_lib_cells tcbn65gplustc/GTIEL]
set_dont_use [get_lib_cells tcbn65gplustc/GXNR2D1]
set_dont_use [get_lib_cells tcbn65gplustc/GXNR2D2]
set_dont_use [get_lib_cells tcbn65gplustc/GXOR2D1]
set_dont_use [get_lib_cells tcbn65gplustc/GXOR2D2]
set_dont_use [get_lib_cells tcbn65gplustc/INVD20]
set_dont_use [get_lib_cells tcbn65gplustc/INVD24]
