onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label RA /testbench/RA
add wave -noupdate -label RB /testbench/RB
add wave -noupdate -label ADDA /testbench/ADDA
add wave -noupdate -label SUBA /testbench/SUBA
add wave -noupdate -label ORA /testbench/ORA
add wave -noupdate -label ANDA /testbench/ANDA
add wave -noupdate -label XORA /testbench/XORA
add wave -noupdate -label SHRA /testbench/SHRA
add wave -noupdate -label MOVB /testbench/MOVB
add wave -noupdate -label EXCHA /testbench/EXCHA
add wave -noupdate -label EXCHB /testbench/EXCHB
add wave -noupdate -label INS /testbench/ins
add wave -noupdate -label sel /testbench/sel
add wave -noupdate -label outA /testbench/outA
add wave -noupdate -label outB /testbench/outB


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
