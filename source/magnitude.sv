// $Id: $
// File name:   magnitude.sv
// Created:     10/15/2021
// Author:      Fahad Tajiki
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: This module is meant to convert negative 2's complement to positive
// 

module magnitude(
    input logic  [16:0] in,
    output logic [15:0] out
);

always_comb begin
    if (in[16] == 1'b1) begin //check for negated input
        out = ~(in[15:0]) + 1;
    end
    else begin
        out = in[15:0];
    end
end
endmodule