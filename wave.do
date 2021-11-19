onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group {TRANSACTION INFO} -color white /tb_ahb_lite_fir_filter/tb_transaction_write
add wave -noupdate -group {TRANSACTION INFO} -color white /tb_ahb_lite_fir_filter/tb_transaction_size
add wave -noupdate -group {TRANSACTION INFO} -color white /tb_ahb_lite_fir_filter/tb_transaction_fake
add wave -noupdate -group {TRANSACTION INFO} -color white /tb_ahb_lite_fir_filter/tb_transaction_error
add wave -noupdate -group {TRANSACTION INFO} -color white -radix hexadecimal /tb_ahb_lite_fir_filter/tb_transaction_data
add wave -noupdate -group {TRANSACTION INFO} -color white /tb_ahb_lite_fir_filter/tb_transaction_addr
add wave -noupdate -group {TEST INFO} -color white /tb_ahb_lite_fir_filter/tb_check_tag
add wave -noupdate -group {TEST INFO} -color white /tb_ahb_lite_fir_filter/tb_check
add wave -noupdate -group {TEST INFO} -color white /tb_ahb_lite_fir_filter/tb_mismatch
add wave -noupdate -group {TEST INFO} -color white -radix hexadecimal /tb_ahb_lite_fir_filter/tb_test_data
add wave -noupdate -group {TEST INFO} -color white /tb_ahb_lite_fir_filter/tb_test_case_num
add wave -noupdate -group {TEST INFO} -color white /tb_ahb_lite_fir_filter/tb_test_case
add wave -noupdate -group {CLK & NRST} -color yellow /tb_ahb_lite_fir_filter/tb_n_rst
add wave -noupdate -group {CLK & NRST} -color yellow /tb_ahb_lite_fir_filter/tb_clk
add wave -noupdate -group {FINAL DESIGN SIGNALS} -color {Blue Violet} /tb_ahb_lite_fir_filter/tb_hwrite
add wave -noupdate -group {FINAL DESIGN SIGNALS} -color {Blue Violet} -radix hexadecimal /tb_ahb_lite_fir_filter/tb_hwdata
add wave -noupdate -group {FINAL DESIGN SIGNALS} -color {Blue Violet} /tb_ahb_lite_fir_filter/tb_htrans
add wave -noupdate -group {FINAL DESIGN SIGNALS} -color {Blue Violet} /tb_ahb_lite_fir_filter/tb_hsize
add wave -noupdate -group {FINAL DESIGN SIGNALS} -color {Blue Violet} /tb_ahb_lite_fir_filter/tb_hsel
add wave -noupdate -group {FINAL DESIGN SIGNALS} -color {Blue Violet} /tb_ahb_lite_fir_filter/tb_hresp
add wave -noupdate -group {FINAL DESIGN SIGNALS} -color {Blue Violet} -radix hexadecimal /tb_ahb_lite_fir_filter/tb_hrdata
add wave -noupdate -group {FINAL DESIGN SIGNALS} -color {Blue Violet} -radix hexadecimal /tb_ahb_lite_fir_filter/tb_haddr
add wave -noupdate -expand -group {BUS SIGNALS} -color Goldenrod /tb_ahb_lite_fir_filter/tb_model_reset
add wave -noupdate -expand -group {BUS SIGNALS} -color Goldenrod /tb_ahb_lite_fir_filter/tb_enqueue_transaction
add wave -noupdate -expand -group {BUS SIGNALS} -color Goldenrod /tb_ahb_lite_fir_filter/tb_enable_transactions
add wave -noupdate -expand -group {BUS SIGNALS} -color Goldenrod /tb_ahb_lite_fir_filter/tb_current_transaction_num
add wave -noupdate -expand -group {BUS SIGNALS} -color Goldenrod /tb_ahb_lite_fir_filter/tb_current_transaction_error
add wave -noupdate -expand -group {AHB REGISTERS} -color Magenta -radix hexadecimal -childformat {{{/tb_ahb_lite_fir_filter/DUT/AHB/register[15]} -radix hexadecimal} {{/tb_ahb_lite_fir_filter/DUT/AHB/register[14]} -radix hexadecimal} {{/tb_ahb_lite_fir_filter/DUT/AHB/register[13]} -radix hexadecimal} {{/tb_ahb_lite_fir_filter/DUT/AHB/register[12]} -radix hexadecimal} {{/tb_ahb_lite_fir_filter/DUT/AHB/register[11]} -radix hexadecimal} {{/tb_ahb_lite_fir_filter/DUT/AHB/register[10]} -radix hexadecimal} {{/tb_ahb_lite_fir_filter/DUT/AHB/register[9]} -radix hexadecimal} {{/tb_ahb_lite_fir_filter/DUT/AHB/register[8]} -radix hexadecimal} {{/tb_ahb_lite_fir_filter/DUT/AHB/register[7]} -radix hexadecimal} {{/tb_ahb_lite_fir_filter/DUT/AHB/register[6]} -radix hexadecimal} {{/tb_ahb_lite_fir_filter/DUT/AHB/register[5]} -radix hexadecimal} {{/tb_ahb_lite_fir_filter/DUT/AHB/register[4]} -radix hexadecimal} {{/tb_ahb_lite_fir_filter/DUT/AHB/register[3]} -radix hexadecimal} {{/tb_ahb_lite_fir_filter/DUT/AHB/register[2]} -radix hexadecimal} {{/tb_ahb_lite_fir_filter/DUT/AHB/register[1]} -radix hexadecimal} {{/tb_ahb_lite_fir_filter/DUT/AHB/register[0]} -radix hexadecimal}} -expand -subitemconfig {{/tb_ahb_lite_fir_filter/DUT/AHB/register[15]} {-color Magenta -height 16 -radix hexadecimal} {/tb_ahb_lite_fir_filter/DUT/AHB/register[14]} {-color Magenta -height 16 -radix hexadecimal} {/tb_ahb_lite_fir_filter/DUT/AHB/register[13]} {-color Magenta -height 16 -radix hexadecimal} {/tb_ahb_lite_fir_filter/DUT/AHB/register[12]} {-color Magenta -height 16 -radix hexadecimal} {/tb_ahb_lite_fir_filter/DUT/AHB/register[11]} {-color Magenta -height 16 -radix hexadecimal} {/tb_ahb_lite_fir_filter/DUT/AHB/register[10]} {-color Magenta -height 16 -radix hexadecimal} {/tb_ahb_lite_fir_filter/DUT/AHB/register[9]} {-color Magenta -height 16 -radix hexadecimal} {/tb_ahb_lite_fir_filter/DUT/AHB/register[8]} {-color Magenta -height 16 -radix hexadecimal} {/tb_ahb_lite_fir_filter/DUT/AHB/register[7]} {-color Magenta -height 16 -radix hexadecimal} {/tb_ahb_lite_fir_filter/DUT/AHB/register[6]} {-color Magenta -height 16 -radix hexadecimal} {/tb_ahb_lite_fir_filter/DUT/AHB/register[5]} {-color Magenta -height 16 -radix hexadecimal} {/tb_ahb_lite_fir_filter/DUT/AHB/register[4]} {-color Magenta -height 16 -radix hexadecimal} {/tb_ahb_lite_fir_filter/DUT/AHB/register[3]} {-color Magenta -height 16 -radix hexadecimal} {/tb_ahb_lite_fir_filter/DUT/AHB/register[2]} {-color Magenta -height 16 -radix hexadecimal} {/tb_ahb_lite_fir_filter/DUT/AHB/register[1]} {-color Magenta -height 16 -radix hexadecimal} {/tb_ahb_lite_fir_filter/DUT/AHB/register[0]} {-color Magenta -height 16 -radix hexadecimal}} /tb_ahb_lite_fir_filter/DUT/AHB/register
add wave -noupdate -expand -group {COEFF LOADER SIGNALS} /tb_ahb_lite_fir_filter/DUT/AHB/new_coefficient_set
add wave -noupdate -expand -group {COEFF LOADER SIGNALS} /tb_ahb_lite_fir_filter/DUT/fir_coefficient
add wave -noupdate -expand -group {COEFF LOADER SIGNALS} /tb_ahb_lite_fir_filter/DUT/load_coeff
add wave -noupdate -expand -group {COEFF LOADER SIGNALS} -color Cyan /tb_ahb_lite_fir_filter/DUT/CFL/state
add wave -noupdate -expand -group {COEFF LOADER SIGNALS} -color Cyan /tb_ahb_lite_fir_filter/DUT/CFL/nexstate
add wave -noupdate -expand -group {COEFF LOADER SIGNALS} -color Cyan /tb_ahb_lite_fir_filter/DUT/CFL/coefficient_num
add wave -noupdate -expand -group {FIR FILTER SIGNALS} -color {Spring Green} -radix hexadecimal /tb_ahb_lite_fir_filter/DUT/FF/src2
add wave -noupdate -expand -group {FIR FILTER SIGNALS} -color {Spring Green} -radix hexadecimal /tb_ahb_lite_fir_filter/DUT/FF/src1
add wave -noupdate -expand -group {FIR FILTER SIGNALS} -color {Spring Green} -radix hexadecimal /tb_ahb_lite_fir_filter/DUT/FF/sample_data
add wave -noupdate -expand -group {FIR FILTER SIGNALS} -color {Spring Green} -radix hexadecimal /tb_ahb_lite_fir_filter/DUT/FF/outreg_data
add wave -noupdate -expand -group {FIR FILTER SIGNALS} -color {Spring Green} /tb_ahb_lite_fir_filter/DUT/FF/modwait
add wave -noupdate -expand -group {FIR FILTER SIGNALS} -color {Spring Green} /tb_ahb_lite_fir_filter/DUT/FF/load_coeff
add wave -noupdate -expand -group {FIR FILTER SIGNALS} -color {Spring Green} -radix hexadecimal /tb_ahb_lite_fir_filter/DUT/FF/fir_out
add wave -noupdate -expand -group {FIR FILTER SIGNALS} -color {Spring Green} -radix hexadecimal /tb_ahb_lite_fir_filter/DUT/FF/fir_coefficient
add wave -noupdate -expand -group {FIR FILTER SIGNALS} -color {Spring Green} -radix hexadecimal /tb_ahb_lite_fir_filter/DUT/FF/dest
add wave -noupdate -expand -group {FIR FILTER SIGNALS} -color {Spring Green} /tb_ahb_lite_fir_filter/DUT/FF/data_ready
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2900897 ps} 0}
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
WaveRestoreZoom {0 ps} {4486407 ps}
