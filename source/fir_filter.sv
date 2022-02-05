// $Id: $
// File name:   fir_filter
// Created:     10/15/2021
// Author:      Fahad Tajiki
// Version:     1.0  Initial Design Entry
// Description: The top level module that implement a FIR filtration system using lower level modules

module fir_filter(
    input clk,
          n_reset,
    input logic [15:0] sample_data,
                        fir_coefficient,
    input logic load_coeff,
                data_ready,
    output logic one_k_samples,
                 processed,
                 modwait,
    output logic [15:0] fir_out,
    output logic err
);
    logic  cnt_up,
          clear,
          overflow;
    logic [2:0] op;
    logic [3:0] src1, src2, dest;
    logic [16:0] outreg_data;  
    logic done;

    assign processed = done;

    controller    B1(
                    .clk(clk),
                    .n_rst(n_reset),
                    .dr(data_ready),
                    .lc(load_coeff),
                    .overflow(overflow),
                    .cnt_up(cnt_up),
                    .clear(clear),
                    .modwait(modwait),
                    .op(op),
                    .src1(src1),
                    .src2(src2),
                    .dest(dest),
                    .err(err),
                    .processed(done)
                    );


    counter   C1(
                    .clk(clk),
                    .n_rst(n_reset),
                    .cnt_up(cnt_up),
                    .clear(clear),
                    .one_k_samples(one_k_samples)
                    );

    datapath    D1(
                    .clk(clk),
                    .n_reset(n_reset),
                    .op(op),
                    .src1(src1),
                    .src2(src2),
                    .dest(dest),
                    .ext_data1(sample_data),
                    .ext_data2(fir_coefficient),
                    .outreg_data(outreg_data),
                    .overflow(overflow)
                    );

    magnitude   E1(
                    .in(outreg_data),
                    .out(fir_out)
                    );
endmodule