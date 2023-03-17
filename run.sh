#!/bin/bash

cd Karatsuba_Multiplier.srcs/sources_1/new

iverilog multiplier_tb.v multiplier.v km_81.v km_40.v km_20.v km_10.v km_5.v km_2.v km_1.v mod.v -o multiplier
./multiplier>../../../result.out
rm multiplier