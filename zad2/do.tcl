clear -all
analyze -sv09 zad2_checker.sv bind.sv
analyze -vhdl zad2_lut.vhd; 
analyze -vhdl zad2.vhd;
elaborate -vhdl -top zad2
clock clk
reset rst
prove -bg -all
