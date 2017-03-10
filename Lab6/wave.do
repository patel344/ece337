onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {TESTBENCH VARS}
add wave -noupdate /tb_i2c_slave/tb_clk
add wave -noupdate /tb_i2c_slave/tb_scl
add wave -noupdate /tb_i2c_slave/tb_n_rst
add wave -noupdate /tb_i2c_slave/tb_sda_in
add wave -noupdate /tb_i2c_slave/tb_write_enable
add wave -noupdate /tb_i2c_slave/tb_write_data
add wave -noupdate /tb_i2c_slave/tb_sda_out
add wave -noupdate /tb_i2c_slave/tb_fifo_empty
add wave -noupdate /tb_i2c_slave/tb_fifo_full
add wave -noupdate /tb_i2c_slave/tb_expected_sda_out
add wave -noupdate /tb_i2c_slave/tb_expected_fifo_empty
add wave -noupdate /tb_i2c_slave/tb_expected_fifo_full
add wave -noupdate -divider {TIMER VARS}
add wave -noupdate /tb_i2c_slave/DUT/timaa/rising_edge_found
add wave -noupdate /tb_i2c_slave/DUT/timaa/falling_edge_found
add wave -noupdate /tb_i2c_slave/DUT/timaa/stop_found
add wave -noupdate /tb_i2c_slave/DUT/timaa/start_found
add wave -noupdate /tb_i2c_slave/DUT/timaa/byte_received
add wave -noupdate /tb_i2c_slave/DUT/timaa/ack_prep
add wave -noupdate /tb_i2c_slave/DUT/timaa/check_ack
add wave -noupdate /tb_i2c_slave/DUT/timaa/ack_done
add wave -noupdate /tb_i2c_slave/DUT/timaa/enable_condition
add wave -noupdate -radix unsigned /tb_i2c_slave/DUT/timaa/count
add wave -noupdate -divider {CONTROLLER VARS}
add wave -noupdate /tb_i2c_slave/DUT/controlla/stop_found
add wave -noupdate /tb_i2c_slave/DUT/controlla/start_found
add wave -noupdate /tb_i2c_slave/DUT/controlla/byte_received
add wave -noupdate /tb_i2c_slave/DUT/controlla/ack_prep
add wave -noupdate /tb_i2c_slave/DUT/controlla/check_ack
add wave -noupdate /tb_i2c_slave/DUT/controlla/ack_done
add wave -noupdate /tb_i2c_slave/DUT/controlla/rw_mode
add wave -noupdate /tb_i2c_slave/DUT/controlla/address_match
add wave -noupdate /tb_i2c_slave/DUT/controlla/sda_in
add wave -noupdate /tb_i2c_slave/DUT/controlla/rx_enable
add wave -noupdate /tb_i2c_slave/DUT/controlla/tx_enable
add wave -noupdate /tb_i2c_slave/DUT/controlla/read_enable
add wave -noupdate /tb_i2c_slave/DUT/controlla/sda_mode
add wave -noupdate /tb_i2c_slave/DUT/controlla/load_data
add wave -noupdate /tb_i2c_slave/DUT/controlla/state
add wave -noupdate /tb_i2c_slave/DUT/controlla/next_state
add wave -noupdate -divider {SDA SELCECTER VARS}
add wave -noupdate /tb_i2c_slave/DUT/selecta/tx_out
add wave -noupdate /tb_i2c_slave/DUT/selecta/sda_mode
add wave -noupdate /tb_i2c_slave/DUT/selecta/sda_out
add wave -noupdate -divider {TX TRANSMITTER VARS}
add wave -noupdate /tb_i2c_slave/DUT/transmita/falling_edge_found
add wave -noupdate /tb_i2c_slave/DUT/transmita/tx_enable
add wave -noupdate /tb_i2c_slave/DUT/transmita/tx_data
add wave -noupdate /tb_i2c_slave/DUT/transmita/load_data
add wave -noupdate /tb_i2c_slave/DUT/transmita/tx_out
add wave -noupdate -divider {FIFO VARS}
add wave -noupdate /tb_i2c_slave/DUT/fifa/read_enable
add wave -noupdate /tb_i2c_slave/DUT/fifa/write_enable
add wave -noupdate /tb_i2c_slave/DUT/fifa/write_data
add wave -noupdate /tb_i2c_slave/DUT/fifa/read_data
add wave -noupdate /tb_i2c_slave/DUT/fifa/fifo_empty
add wave -noupdate /tb_i2c_slave/DUT/fifa/fifo_full
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {144057 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 172
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
configure wave -timelineunits ps
update
WaveRestoreZoom {115246 ps} {345737 ps}
