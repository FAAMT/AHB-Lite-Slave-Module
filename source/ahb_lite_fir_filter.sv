// $Id: $
// File name:   ahb_lite_fir_filter.sv
// Created:     10/29/2021
// Author:      Fahad Tajiki
// Version:     1.0  Initial Design Entry
// Description: This is the full design module that connects the dedicated AHB-Lite Slave interface modules together to form the overall SoC accelerator module.


module ahb_lite_fir_filter(
    input clk,
          n_rst,
    input logic hsel,
    input logic [3:0] haddr,
    input logic hsize,
    input logic [1:0] htrans,
    input logic hwrite,
    input logic [15:0] hwdata,
    output logic [15:0] hrdata,
    output logic hresp
);

logic [15:0] fir_out, sample_data, fir_coefficient;
logic [1:0] coefficient_num;
logic processed, err, modwait, data_ready, new_coefficient_set, load_coeff, clear_new_coefficient;


ahb_lite_slave AHB (.clk(clk), 
                    .n_rst(n_rst),
                    // FIR Filter Operation signals
                    .fir_out(fir_out),
                    .modwait(modwait),
                    .err(err),
                    .sample_data(sample_data),
                    .data_ready(data_ready),
                    .fir_coefficient(fir_coefficient),
                    .new_coefficient_set(new_coefficient_set),
                    .coefficient_num(coefficient_num),
                    .clear_new_coefficient(clear_new_coefficient),
                    // AHB-Lite-Slave bus signals
                    .hsel(hsel),
                    .htrans(htrans),
                    .haddr(haddr),
                    .hsize(hsize),
                    .hwrite(hwrite),
                    .hwdata(hwdata),
                    .hrdata(hrdata),
                    .hresp(hresp),
                    .processed(processed));


coefficient_loader CFL  (.clk(clk),
                        .n_reset(n_rst),
                        .new_coefficient_set(new_coefficient_set),
                        .modwait(modwait),
                        .load_coeff(load_coeff),
                        .coefficient_num(coefficient_num),
                        .clear_new_coefficient(clear_new_coefficient));


fir_filter FF      (.clk(clk),
                  .n_reset(n_rst),
                  .sample_data(sample_data),
                  .fir_coefficient(fir_coefficient),
                  .load_coeff(load_coeff),
                  .data_ready(data_ready),
                  .one_k_samples(),
                  .modwait(modwait),
                  .fir_out(fir_out),
                  .err(err),
                  .processed(processed)
);


endmodule