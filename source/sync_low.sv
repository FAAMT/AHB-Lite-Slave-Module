// $Id: $
// File name:   sync_low.sv
// Created:     9/14/2021
// Author:      Fahad Tajiki
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: synchronizer module from postlab1

module sync_low(
	input wire clk,
	input wire n_rst,
	input wire async_in,
	output logic sync_out
);
	logic next_Q;//define a mediator

	//first flip flop
	always_ff @ (posedge clk, negedge n_rst)
	begin 

		if(1'b0 == n_rst) begin
			sync_out <= 0; 
			next_Q <= 0;
		end
		else if(async_in == 1 || async_in == 0) begin
			next_Q <= async_in;
			sync_out <= next_Q;
		end
	end
endmodule
