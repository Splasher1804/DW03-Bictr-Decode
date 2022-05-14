onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /counter_preset_test/DUT_DW03_bictr_decode/clk
add wave -noupdate /counter_preset_test/DUT_DW03_bictr_decode/rst_n
add wave -noupdate /counter_preset_test/DUT_DW03_bictr_decode/count_up
add wave -noupdate /counter_preset_test/DUT_DW03_bictr_decode/load
add wave -noupdate -radix unsigned -radixshowbase 0 /DW03_bictr_decode_test/DUT_DW03_bictr_decode/data_preset
add wave -noupdate -radix unsigned -radixshowbase 0 /DW03_bictr_decode_test/DUT_DW03_bictr_decode/counter_out
add wave -noupdate /counter_preset_test/DUT_DW03_bictr_decode/carry_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {325 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {677 ns}
