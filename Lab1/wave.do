onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix decimal -childformat {{{/comparator/a[15]} -radix decimal} {{/comparator/a[14]} -radix decimal} {{/comparator/a[13]} -radix decimal} {{/comparator/a[12]} -radix decimal} {{/comparator/a[11]} -radix decimal} {{/comparator/a[10]} -radix decimal} {{/comparator/a[9]} -radix decimal} {{/comparator/a[8]} -radix decimal} {{/comparator/a[7]} -radix decimal} {{/comparator/a[6]} -radix decimal} {{/comparator/a[5]} -radix decimal} {{/comparator/a[4]} -radix decimal} {{/comparator/a[3]} -radix decimal} {{/comparator/a[2]} -radix decimal} {{/comparator/a[1]} -radix decimal} {{/comparator/a[0]} -radix decimal}} -subitemconfig {{/comparator/a[15]} {-height 17 -radix decimal} {/comparator/a[14]} {-height 17 -radix decimal} {/comparator/a[13]} {-height 17 -radix decimal} {/comparator/a[12]} {-height 17 -radix decimal} {/comparator/a[11]} {-height 17 -radix decimal} {/comparator/a[10]} {-height 17 -radix decimal} {/comparator/a[9]} {-height 17 -radix decimal} {/comparator/a[8]} {-height 17 -radix decimal} {/comparator/a[7]} {-height 17 -radix decimal} {/comparator/a[6]} {-height 17 -radix decimal} {/comparator/a[5]} {-height 17 -radix decimal} {/comparator/a[4]} {-height 17 -radix decimal} {/comparator/a[3]} {-height 17 -radix decimal} {/comparator/a[2]} {-height 17 -radix decimal} {/comparator/a[1]} {-height 17 -radix decimal} {/comparator/a[0]} {-height 17 -radix decimal}} /comparator/a
add wave -noupdate -radix decimal /comparator/b
add wave -noupdate -radix hexadecimal /comparator/gt
add wave -noupdate -radix hexadecimal /comparator/lt
add wave -noupdate -radix hexadecimal /comparator/eq
add wave -noupdate -radix hexadecimal /comparator/gte
add wave -noupdate -radix hexadecimal /comparator/lte
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {84640 ps} 0} {{Cursor 2} {3980 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
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
configure wave -timelineunits ps
update
WaveRestoreZoom {60270 ps} {79320 ps}
