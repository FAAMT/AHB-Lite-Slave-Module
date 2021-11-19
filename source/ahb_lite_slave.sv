// $Id: $
// File name:   ahb_lite_slave
// Created:     10/26/2021
// Author:      Fahad Tajiki
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: AHB Lite Slave Interface module

// $Id: $
// File name:   apb_slave.sv
// Created:     10/22/2021
// Author:      Fahad Tajiki
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: This is the slvae interface for the UART peripheral to interact with


module ahb_lite_slave(
    input   clk,
            n_rst,
    output logic [15:0] sample_data,
    output logic data_ready,
                new_coefficient_set,
    input logic clear_new_coefficient,
                processed,
    input logic [1:0] coefficient_num,
    output logic [15:0] fir_coefficient,
    input logic modwait,
    input logic [15:0] fir_out,
    input logic err,
                hsel,
    input logic [3:0] haddr,
    input logic hsize,
    input logic [1:0] htrans,
    input logic hwrite,
    input logic [15:0] hwdata,
    output logic [15:0] hrdata,
    output logic hresp
);

logic [15:0] [7:0] register, nexregister; 
logic [15:0] nexhrdata, nexfir_coefficient;
logic next_data_ready;
logic write1, nexwrite1;
logic [3:0]storeadd, nexstoreadd;

always_ff @ (posedge clk, negedge n_rst) begin

if(!n_rst) begin
    //read register
    hrdata <= 0;
    data_ready <= 0;
    write1 <= 0;
    storeadd <= 0;
     //clear registers
    register[0] <= 0;
    register[1] <= 0;
    register[2] <= 0;
    register[3] <= 0;
    register[4] <= 0;
    register[5] <= 0;
    register[6] <= 0;
    register[7] <= 0;
    register[8] <= 0;
    register[9] <= 0;
    register[10] <= 0;
    register[11] <= 0;
    register[12] <= 0;
    register[13] <= 0;
    register[14] <= 0;
    register[15] <= 0;
end
else begin
    //retain register value
    hrdata <= nexhrdata;
    data_ready <= next_data_ready;
    write1 <= nexwrite1;
    storeadd <= nexstoreadd;
    register[0] <= nexregister[0];
    register[1] <= nexregister[1];
    register[2] <= nexregister[2];
    register[3] <= nexregister[3];
    register[4] <= nexregister[4];
    register[5] <= nexregister[5];
    register[6] <= nexregister[6];
    register[7] <= nexregister[7];
    register[8] <= nexregister[8];
    register[9] <= nexregister[9];
    register[10] <= nexregister[10];
    register[11] <= nexregister[11];
    register[12] <= nexregister[12];
    register[13] <= nexregister[13];
    register[14] <= nexregister[14];
    register[15] <= nexregister[15];
    
end

end


//INIT_REGISTERS();
always_comb begin
    //INITIAL OUTPUTS CONDITIONS
    hresp = 0; //error feedback is initially low
    nexhrdata = 0; //hrdata readability reset

    if(processed) begin
        next_data_ready = 0;
    end
    else begin
        next_data_ready = data_ready; //reset data ready
    end

    nexwrite1 = write1; //update nexwrite1
    nexstoreadd = storeadd; //update nexstoreadd
    //REGISTER SETUP
    
    //Status Register
    nexregister[0][0] = {modwait | new_coefficient_set}; //FIR Filter is busy/idle
    nexregister[0][7:1] = {7'd0}; //Empty Fill
    nexregister[1][0] = {err}; //FIR Filter encountered an error
    nexregister[1][7:1] = {7'd0}; //Empty Fill

    //Result Register
    nexregister[2] = fir_out[7:0];
    nexregister[3] = fir_out[15:8];

    //Sample Register
    nexregister[4] = register[4];
    nexregister[5] = register[5];

    //Coefficient Registers
    nexregister[6] = register[6];
    nexregister[7] = register[7];
    nexregister[8] = register[8];
    nexregister[9] = register[9];
    nexregister[10] = register[10];
    nexregister[11] = register[11];
    nexregister[12] = register[12];
    nexregister[13] = register[13];

    //Coefficient Set register
    if (clear_new_coefficient) begin
        nexregister[14] = 8'h0000;
    end
    else begin
        nexregister[14] = register[14];
    end
   //Register 15
    nexregister[15] = register[15];

//INIT_TRANSACTION_PROCESS():

    
    if (hsel) //NON-SEQ State 
    begin
        //STAGE 2: Assignment Phase

        //EOS1: WRITE OPERATION DATA PHASE
            if (write1) begin
                nexwrite1 = 0; //disable write1 
                
                if({storeadd[3:1], 1'b0} == 4'd4) 
                begin
                    next_data_ready = 1'b1;
                end

                nexregister[{storeadd[3:1], 1'b0}] = hwdata[7:0]; //assign lsb byte to even register
                nexregister[{storeadd[3:1], 1'b1}] = hwdata[15:8]; //assign msb byte to odd register
            end

        //STAGE 1: Address Mapping
        //CHECK VALID HADDR
        if(haddr < 0  ||  14 < haddr)
        begin
            hresp = 1;
        end
        else
        begin
            //STAGE 2: WRITE OPERATION SETUP 
            if(hwrite && (htrans == 2'd2)) 
            begin
                if(!hsize) //1 byte
                begin
                    //R/W Registers Only
                    if(!((haddr == 0)
                    | (haddr == 1)
                    | (haddr == 2)
                    | (haddr == 3))) 
                    begin
                        if(haddr[3:1] == 4'd6) 
                        begin
                            next_data_ready = 1'b1;
                        end

                        nexregister[haddr] = hwdata; //assign new data
                    end
                    else //R Register = Error
                    begin
                            hresp = 1; //assert error
                    end  
                end
                else //2 byte 
                begin
                    //R/W Registers Only
                    if(!((haddr == 0)
                    | (haddr == 1)
                    | (haddr == 2)
                    | (haddr == 3))) 
                    begin
                        //wait 1 clock cyle for hwdata
                        nexwrite1 = 1; //enable write1
                        nexstoreadd = haddr; //store address
                    end
                    else //R Register = Error
                    begin
                            hresp = 1; //assert error
                    end  
                end
            end

            //STAGE 2: READ OPERATION SETUP
            else 
            begin
                if(!hsize) //1 byte
                begin
                        nexhrdata = register[haddr]; //assign lsb byte to even register
                end
                else //2 byte 
                begin
                       nexhrdata[7:0] = nexregister[{haddr[3:1], 1'b0}]; //assign lsb byte to even register
                       nexhrdata[15:8] = nexregister[{haddr[3:1], 1'b1}]; //assign msb byte to odd register 
                end
            end
        end
    end
end

//ASSIGN OUTPUTS
assign fir_coefficient = {register[7 + (coefficient_num * 2)], register[6 + (coefficient_num * 2)]};

assign new_coefficient_set = {register[14][0]};

assign  sample_data = {register[5], register[4]};

endmodule