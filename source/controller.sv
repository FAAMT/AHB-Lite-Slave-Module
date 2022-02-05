// $Id: $
// File name:   controller
// Created:     10/15/2021
// Author:      Fahad Tajiki
// Version:     1.0  Initial Design Entry
// Description: The controller unit responsible for guiding the process of the datapath module


module controller (
    input clk,
          n_rst,
    input logic dr,
                lc,
                overflow,
    output logic cnt_up,
                 clear,
                 modwait,
    output reg [2:0] op,
    output reg [3:0] src1,
                     src2,
                     dest,
    output logic err,
                 processed
);

typedef enum bit[4:0] {idle,//0
                    eidle,//1
                    eidle2,
                    load1,//2
                    load2,//3
                    load3,//4
                    load4,//5
                    coeff1,//6
                    coeff2,//7
                    coeff3,//8
                    coeff4,//9
                    store,//10
                    check,//11
                    zero,//12
                    sort1,//13
                    sort2,//14
                    sort3,//15
                    sort4,//16
                    mul1,//17
                    mul2,//18
                    mul3,//19
                    mul4,//20
                    sub1,//21
                    sub2,//22
                    add1,//23
                    add2,//24
                    done
}firState;

firState curstate, nexstate;
logic next_modwait, next_processed;

always_ff @ (posedge clk, negedge n_rst) begin
    
    if (!n_rst)begin
    curstate <= idle;
    modwait <= 0;
    processed <= 0;
    end
    else begin
    curstate <= nexstate;
    modwait <= next_modwait;
    processed <= next_processed;
    end
end

always_comb begin
    nexstate = idle;
    err = 0;
    clear = 0;
    cnt_up = 0;
    next_modwait = 0;
    next_processed = 0;

    op = 3'b000;
    src1 = 4'd0;
    src2 = 4'd0;
    dest = 4'd0;

    case (curstate) 

        idle:
            begin
                //set initial output values
                next_modwait = 0; 
                clear = 0;
                cnt_up = 0;
                op = 3'b000;
                err = 0;

                //path condition
                if (lc) begin
                    nexstate = load1;
                end
                else if (dr) begin
                    nexstate = store;
                    next_modwait = 1;
                end
                else begin
                    nexstate = idle;
                end
            end

        eidle:
                begin
                    //assert error
                    err = 1;
                    next_modwait = 0;
                    nexstate = eidle2;
                end
        eidle2:
                begin
                    err = 1;

                    if (lc) begin
                        nexstate = load1;
                    end
                    else if (dr) begin
                        nexstate = store;
                    end
                    else begin
                        nexstate = eidle2; 
                    end
                end
        load1: //lc asserted
                begin
                    next_modwait = 1;
                    clear = 1;
                    err = 0;
                    op = 3'b011;
                    dest = 4'd5; //register 5

                    //next state conditions
                    nexstate = coeff1;
                end

        coeff1: //F0
                begin
                    next_modwait = 0;
                    clear = 0;
                    op = 3'b000;
                    //next state conditions
                    if (lc) begin
                        nexstate = load2;
                    end
                    else begin
                        nexstate = coeff1;
                    end
                end
        load2:
                begin
                    next_modwait = 1;
                    op = 3'b011;
                    dest = 4'd6; //register 6

                    //next state conditions
                    nexstate = coeff2;
                end
        coeff2: //F1
                begin
                    next_modwait = 0;
                    op = 3'b000;

                    //next state conditions
                    if (lc) begin
                        nexstate = load3;
                    end
                    else begin
                        nexstate = coeff2;
                    end
                end
        load3:
                begin
                    next_modwait = 1;
                    op = 3'b011;
                    dest = 4'd7; //register 7

                    //next state conditions
                    nexstate = coeff3;
                end
        coeff3: //F2
                begin
                    next_modwait = 0;
                    op = 3'b000;

                    //next state conditions
                    if (lc) begin
                        nexstate = load4;
                    end
                    else begin
                    nexstate = coeff3;
                    end
                end
        load4:
                begin
                  next_modwait = 1;
                  op = 3'b011;
                  dest = 4'd8; //register 7

                    //next state conditions
                  nexstate = coeff4;
                end
        coeff4: //F3
                begin
                    next_modwait = 0;
                    op = 3'b000;

                    //next state conditions
                    nexstate = idle;
                end

        store: //dr asserted 
                begin
                    //next state conditions
                    if (dr) begin
                    cnt_up = 1;
                    next_modwait = 1;
                    op = 3'b010;
                    dest = 4'd9; //register 9
                    nexstate = zero;
                    end
                    else begin
                        nexstate = eidle;
                    end
                end
        zero:
                begin
                    cnt_up = 0;
                    next_modwait = 1;
                    src1 = 4'd0;
                    src2 = 4'd0;
                    dest = 4'd0; //register 0
                    op = 3'b101; //SUB

                    //next state conditions
                    nexstate = sort1;
                end
        sort1:
                begin
                    next_modwait = 1;
                    src1 = 4'd2;
                    dest = 4'd1; //register 1 = register 2
                    op = 3'b001; //COPY

                    //next state conditions
                    nexstate = sort2;
                end
        sort2:
                begin
                    next_modwait = 1;
                    src1 = 4'd3;
                    dest = 4'd2; //register 2 = register 3
                    op = 3'b001; //COPY

                    //next state conditions
                    nexstate = sort3;
                end
        sort3:
                begin
                    next_modwait = 1;
                    src1 = 4'd4;
                    dest = 4'd3; //register 3 = register 4
                    op = 3'b001; //COPY

                    //next state conditions
                    nexstate = sort4;
                end
        sort4:
                begin
                    next_modwait = 1;
                    src1 = 4'd9;
                    dest = 4'd4; //register 4 = register 9
                    op = 3'b001; //COPY

                    //next state conditions
                    nexstate = mul1;
                end
        mul1:
                begin
                    next_modwait = 1;
                    src1 = 4'd4;//sample1
                    src2 = 4'd5;//F0
                    dest = 4'd9; //register 9 = sample1 * F0
                    op = 3'b110; //MUL

                    //next state conditions
                    nexstate = sub1;
                end
        sub1:
                begin
                    next_modwait = 1;
                    src1 = 4'd0;//
                    src2 = 4'd9;//
                    dest = 4'd0; //register 0 = register 0 - register 9
                    op = 3'b101; //SUB

                    if (overflow) begin
                        nexstate = eidle;
                        next_processed = 1;
                    end
                    else begin
                        nexstate = mul2;
                    end
                end
        mul2: 
                begin
                    next_modwait = 1;
                    src1 = 4'd3;//sample2
                    src2 = 4'd6;//F1
                    dest = 4'd9; //register 9 = sample2 * F1
                    op = 3'b110; //MUL

                    //next state conditions
                    nexstate = add1;
                end
        add1:
                begin
                    next_modwait = 1;
                    src1 = 4'd0;//
                    src2 = 4'd9;//
                    dest = 4'd0; //register 0 = register 0 + register 9
                    op = 3'b100; //ADD

                    if (overflow) begin
                        nexstate = eidle;
                        next_processed = 1;
                    end
                    else begin
                        nexstate = mul3;
                    end
                end
        mul3:
                begin
                    next_modwait = 1;
                    src1 = 4'd2;//sample3
                    src2 = 4'd7;//F2
                    dest = 4'd9; //register 9 = sample3 * F2
                    op = 3'b110; //MUL

                    //next state conditions
                    nexstate = sub2;
                end
        sub2:
                begin
                    next_modwait = 1;
                    src1 = 4'd0;//
                    src2 = 4'd9;//
                    dest = 4'd0; //register 0 = register 0 - register 9
                    op = 3'b101; //SUB

                    if (overflow) begin
                        nexstate = eidle;
                        next_processed = 1;
                    end
                    else begin
                        nexstate = mul4;
                    end
                end
        mul4:
                begin
                    next_modwait = 1;
                    src1 = 4'd1;//sample4
                    src2 = 4'd8;//F3
                    dest = 4'd9; //register 9 = sample4 * F3
                    op = 3'b110; //MUL

                    //next state conditions
                    nexstate = add2;
                end
        add2:
                begin
                    next_modwait = 1;
                    src1 = 4'd0;//
                    src2 = 4'd9;//
                    dest = 4'd0; //register 0 = register 0 + register 9
                    op = 3'b100; //ADD

                    if (overflow) begin
                        nexstate = eidle;
                        next_processed = 1;
                    end
                    else begin
                        nexstate = done;
                        next_processed = 1;
                    end
                end
        done:
                begin
                    op = 3'b000;
                    next_modwait = 0;
                    nexstate = idle;
                end
                
    endcase
end

endmodule