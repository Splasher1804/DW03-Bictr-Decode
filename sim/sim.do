vlib work
vmap work work

vlog  ../../hdl/DW03_bictr_decode.v
vlog  ../hdl/ck_rst_tb.v
vlog  ../hdl/DW03_bictr_decode_tb.v
vlog  ../hdl/DW03_bictr_decode_test.v

vsim -novopt work.DW03_bictr_decode_test

do wave.do

run -all

