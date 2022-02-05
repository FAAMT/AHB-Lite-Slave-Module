// $Id: $
// File name:   flex_counter.sv
// Created:     9/14/2021
// Author:      Fahad Tajiki
// Version:     1.0  Initial Design Entry
// Description: A counter with controlled roll over.

module flex_counter
#(
	parameter NUM_CNT_BITS = 4
)
(
	input wire clk,
	input wire n_rst,
	input wire clear,
	input wire count_enable,
	input wire [(NUM_CNT_BITS-1):0] rollover_val,
	output logic [(NUM_CNT_BITS-1):0] count_out,
	output logic rollover_flag
);

	logic [(NUM_CNT_BITS-1):0] next_count; //next count variable
	logic next_rollover_flag;
	
	always_ff @ (posedge clk, negedge n_rst) begin
	

	if (n_rst == 1'b0) begin //reset conditions
		rollover_flag <= 0;
		count_out <= 0;
	end
	else begin
		count_out <= next_count;
		rollover_flag <= next_rollover_flag;
	end

	end

	always_comb begin
	  next_count = count_out;
	  next_rollover_flag = 0;
	
	  if (clear == 1'b1) begin 
		next_count = 0;
	  end
	  else if ((rollover_val == count_out) && (count_enable == 1)) begin
		next_count = 1;
	  end
	  else if (count_enable == 1) begin 
		next_count = count_out + 1; 
	  end
	  
	  if (rollover_val == next_count) begin 
		next_rollover_flag = 1'b1; 
	  end
	  
	end
endmodule



