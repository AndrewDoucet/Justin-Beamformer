onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label RA /testbench/RA
add wave -noupdate -label RB /testbench/RB
add wave -noupdate -label INS /testbench/ins
add wave -noupdate -label outA /testbench/RA_OUT
add wave -noupdate -label outB /testbench/RB_OUT


TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {80000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 77
configure wave -valuecolwidth 49
configure wave -justifyvalue left
configure wave -signalnamewidth 0
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
WaveRestoreZoom {9 ns} {189 ns}
