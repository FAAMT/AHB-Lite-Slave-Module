// $Id: $
// File name:   counter.sv
// Created:     10/15/2021
// Author:      Fahad Tajiki
// Version:     1.0  Initial Design Entry
// Description: This module counts the number of samples with a rollover value of 1000


module counter(
    input clk,
          n_rst,
          cnt_up,
          clear,
    output one_k_samples
);

flex_counter 
					#(
                        .NUM_CNT_BITS(10)
					)
					A1 (
                    .clk(clk), 
					.n_rst(n_rst), 
					.clear(clear), 
					.count_enable(cnt_up), 	
					.rollover_val(10'd1000),
					.count_out(),
					.rollover_flag(one_k_samples)
                    );

endmodule