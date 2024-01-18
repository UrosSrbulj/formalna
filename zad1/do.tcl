clear -all
analyze -sv09 zad1_checker.sv bind.sv
analyze -vhdl zad1.vhd
elaborate -vhdl -top zad1
clock clk
reset rst
prove -bg -all
