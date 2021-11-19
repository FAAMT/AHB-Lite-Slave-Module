onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group {TRANSACTION INFO} -color white /tb_ahb_lite_slave/tb_transaction_write
add wave -noupdate -expand -group {TRANSACTION INFO} -color white -radix hexadecimal /tb_ahb_lite_slave/tb_transaction_size
add wave -noupdate -expand -group {TRANSACTION INFO} -color white /tb_ahb_lite_slave/tb_transaction_fake
add wave -noupdate -expand -group {TRANSACTION INFO} -color white /tb_ahb_lite_slave/tb_transaction_error
add wave -noupdate -expand -group {TRANSACTION INFO} -color white -radix hexadecimal /tb_ahb_lite_slave/tb_transaction_data
add wave -noupdate -expand -group {TRANSACTION INFO} -color white -radix hexadecimal /tb_ahb_lite_slave/tb_transaction_addr
add wave -noupdate -expand -group {TRANSACTION INFO} -color white /tb_ahb_lite_slave/tb_model_reset
add wave -noupdate -expand -group {TRANSACTION INFO} -color red /tb_ahb_lite_slave/tb_mismatch
add wave -noupdate -expand -group {TRANSACTION INFO} -color white /tb_ahb_lite_slave/tb_enable_transactions
add wave -noupdate -expand -group {TRANSACTION INFO} -color white /tb_ahb_lite_slave/tb_current_transaction_num
add wave -noupdate -expand -group {TRANSACTION INFO} -color white /tb_ahb_lite_slave/tb_current_transaction_error
add wave -noupdate -expand -group {TEST DATA} -color white -radix hexadecimal /tb_ahb_lite_slave/tb_test_data
add wave -noupdate -expand -group {TEST DATA} -color white /tb_ahb_lite_slave/tb_test_case_num
add wave -noupdate -expand -group {TEST DATA} -color white /tb_ahb_lite_slave/tb_test_case
add wave -noupdate -expand -group {TEST DATA} -color white /tb_ahb_lite_slave/tb_check_tag
add wave -noupdate -expand -group {TEST DATA} -color white /tb_ahb_lite_slave/tb_check
add wave -noupdate -expand -group {CLK & NRST} -color yellow /tb_ahb_lite_slave/tb_n_rst
add wave -noupdate -expand -group {CLK & NRST} -color yellow /tb_ahb_lite_slave/tb_clk
add wave -noupdate -expand -group {MAIN INPUT SIGNALS} -color purple /tb_ahb_lite_slave/tb_coeff_num
add wave -noupdate -expand -group {MAIN INPUT SIGNALS} -color purple /tb_ahb_lite_slave/tb_modwait
add wave -noupdate -expand -group {MAIN INPUT SIGNALS} -color purple /tb_ahb_lite_slave/tb_hsel
add wave -noupdate -expand -group {MAIN INPUT SIGNALS} -color purple /tb_ahb_lite_slave/tb_hwrite
add wave -noupdate -expand -group {MAIN INPUT SIGNALS} -color purple -radix hexadecimal /tb_ahb_lite_slave/tb_hwdata
add wave -noupdate -expand -group {MAIN INPUT SIGNALS} -color purple -radix hexadecimal /tb_ahb_lite_slave/tb_htrans
add wave -noupdate -expand -group {MAIN INPUT SIGNALS} -color purple -radix hexadecimal /tb_ahb_lite_slave/tb_hsize
add wave -noupdate -expand -group {MAIN INPUT SIGNALS} -color purple -radix hexadecimal /tb_ahb_lite_slave/tb_haddr
add wave -noupdate -expand -group {MAIN INPUT SIGNALS} -color purple /tb_ahb_lite_slave/tb_err
add wave -noupdate -expand -group {INTERNAL CONTROL SIGNALS} -color RED /tb_ahb_lite_slave/DUT/write1
add wave -noupdate -expand -group {INTERNAL CONTROL SIGNALS} -color RED -radix hexadecimal /tb_ahb_lite_slave/DUT/storeadd
add wave -noupdate -expand -group {MAIN OUTPUT SIGNALS} -color cyan -radix hexadecimal /tb_ahb_lite_slave/tb_sample_data
add wave -noupdate -expand -group {MAIN OUTPUT SIGNALS} -color cyan /tb_ahb_lite_slave/tb_new_coeff_set
add wave -noupdate -expand -group {MAIN OUTPUT SIGNALS} -color cyan /tb_ahb_lite_slave/tb_clear_new_coefficient
add wave -noupdate -expand -group {MAIN OUTPUT SIGNALS} -color cyan /tb_ahb_lite_slave/tb_hresp
add wave -noupdate -expand -group {MAIN OUTPUT SIGNALS} -color cyan -radix hexadecimal /tb_ahb_lite_slave/tb_hrdata
add wave -noupdate -expand -group {MAIN OUTPUT SIGNALS} -color cyan -radix hexadecimal /tb_ahb_lite_slave/tb_fir_out
add wave -noupdate -expand -group {MAIN OUTPUT SIGNALS} -color cyan -radix hexadecimal /tb_ahb_lite_slave/tb_fir_coefficient
add wave -noupdate -expand -group {MAIN OUTPUT SIGNALS} -color cyan /tb_ahb_lite_slave/tb_data_ready
add wave -noupdate -expand -group {EXPECTED OUTPUTS} -radix hexadecimal /tb_ahb_lite_slave/tb_expected_sample
add wave -noupdate -expand -group {EXPECTED OUTPUTS} /tb_ahb_lite_slave/tb_expected_new_coeff_set
add wave -noupdate -expand -group {EXPECTED OUTPUTS} /tb_ahb_lite_slave/tb_expected_data_ready
add wave -noupdate -expand -group {EXPECTED OUTPUTS} -radix hexadecimal /tb_ahb_lite_slave/tb_expected_coeff
add wave -noupdate -expand -group {EXPECTED OUTPUTS} /tb_ahb_lite_slave/tb_enqueue_transaction
add wave -noupdate -expand -group REGISTERS -color Coral -radix hexadecimal -childformat {{{/tb_ahb_lite_slave/DUT/register[15]} -radix hexadecimal} {{/tb_ahb_lite_slave/DUT/register[14]} -radix hexadecimal} {{/tb_ahb_lite_slave/DUT/register[13]} -radix hexadecimal} {{/tb_ahb_lite_slave/DUT/register[12]} -radix hexadecimal} {{/tb_ahb_lite_slave/DUT/register[11]} -radix hexadecimal} {{/tb_ahb_lite_slave/DUT/register[10]} -radix hexadecimal} {{/tb_ahb_lite_slave/DUT/register[9]} -radix hexadecimal} {{/tb_ahb_lite_slave/DUT/register[8]} -radix hexadecimal} {{/tb_ahb_lite_slave/DUT/register[7]} -radix hexadecimal} {{/tb_ahb_lite_slave/DUT/register[6]} -radix hexadecimal} {{/tb_ahb_lite_slave/DUT/register[5]} -radix hexadecimal} {{/tb_ahb_lite_slave/DUT/register[4]} -radix hexadecimal} {{/tb_ahb_lite_slave/DUT/register[3]} -radix hexadecimal} {{/tb_ahb_lite_slave/DUT/register[2]} -radix hexadecimal} {{/tb_ahb_lite_slave/DUT/register[1]} -radix hexadecimal} {{/tb_ahb_lite_slave/DUT/register[0]} -radix hexadecimal}} -expand -subitemconfig {{/tb_ahb_lite_slave/DUT/register[15]} {-color Coral -height 16 -radix hexadecimal} {/tb_ahb_lite_slave/DUT/register[14]} {-color Coral -height 16 -radix hexadecimal} {/tb_ahb_lite_slave/DUT/register[13]} {-color Coral -height 16 -radix hexadecimal} {/tb_ahb_lite_slave/DUT/register[12]} {-color Coral -height 16 -radix hexadecimal} {/tb_ahb_lite_slave/DUT/register[11]} {-color Coral -height 16 -radix hexadecimal} {/tb_ahb_lite_slave/DUT/register[10]} {-color Coral -height 16 -radix hexadecimal} {/tb_ahb_lite_slave/DUT/register[9]} {-color Coral -height 16 -radix hexadecimal} {/tb_ahb_lite_slave/DUT/register[8]} {-color Coral -height 16 -radix hexadecimal} {/tb_ahb_lite_slave/DUT/register[7]} {-color Coral -height 16 -radix hexadecimal} {/tb_ahb_lite_slave/DUT/register[6]} {-color Coral -height 16 -radix hexadecimal} {/tb_ahb_lite_slave/DUT/register[5]} {-color Coral -height 16 -radix hexadecimal} {/tb_ahb_lite_slave/DUT/register[4]} {-color Coral -height 16 -radix hexadecimal} {/tb_ahb_lite_slave/DUT/register[3]} {-color Coral -height 16 -radix hexadecimal} {/tb_ahb_lite_slave/DUT/register[2]} {-color Coral -height 16 -radix hexadecimal} {/tb_ahb_lite_slave/DUT/register[1]} {-color Coral -height 16 -radix hexadecimal} {/tb_ahb_lite_slave/DUT/register[0]} {-color Coral -height 16 -radix hexadecimal}} /tb_ahb_lite_slave/DUT/register
add wave -noupdate -expand -group REGISTERS -color Coral -radix hexadecimal /tb_ahb_lite_slave/DUT/nexregister
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1035774 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 229
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
WaveRestoreZoom {304786 ps} {1045758 ps}
