// $Id: $
// File name:   coefficient_loader
// Created:     10/29/2021
// Author:      Fahad Tajiki
// Version:     1.0  Initial Design Entry
// Description: This manages loading a full set of coefficients from the AHB-Lite interface module into the FIR Filter module.

module coefficient_loader(
    input clk,
          n_reset,
    input logic new_coefficient_set,
    input logic modwait,
    output logic load_coeff,
    output logic [1:0] coefficient_num,
    output logic clear_new_coefficient
);

typedef enum bit [2:0] {IDLE, 
                        F0,
                        F1,
                        F2,
			            F3} loadState;	

loadState state, nexstate;

always_ff @ (posedge clk, negedge n_reset) begin
    if(!n_reset) begin
        state <= IDLE;
    end
    else begin
        state <= nexstate;
    end
end

always_comb begin
    //Initial Logic
     nexstate = state; //next state logic
     coefficient_num = 2'b00; //coefficient num value
     load_coeff = 0; //load coeff initial state
     clear_new_coefficient = 0; //initial value of clear signal

    case (state)

        IDLE:
            begin
                clear_new_coefficient = 0;

                if(new_coefficient_set && !modwait) begin
                    nexstate = F0;
                end
                else begin
                    nexstate = IDLE;
                end
            end
        F0:
            begin
                coefficient_num = 2'b00; //assign coeff 

                if(!modwait) begin
                    load_coeff = 1; //allow module to load    
                end
                else if (load_coeff && !modwait) begin
                    load_coeff = 0; //deassert load_coeff
                end
                else begin
                    nexstate = F1; //wait 
                end
            end
        F1:
            begin
                coefficient_num = 2'b01; //assign coeff 

                if(!modwait) begin
                    load_coeff = 1; //allow module to load
                    
                end
                else if (load_coeff) begin
                    load_coeff = 0; //deassert load_coeff
                end
                else begin
                     nexstate = F2; //move to next state
                end
            end
        F2:
            begin
                 coefficient_num = 2'b10; //assign coeff 

                if(!modwait) begin
                    load_coeff = 1; //allow module to load
                end
                else if (load_coeff) begin
                    load_coeff = 0; //deassert load_coeff
                end
                else begin
                    nexstate = F3; //move to next state
                end
            end
        F3:
            begin
                  coefficient_num = 2'b11; //assign coeff 

                if(!modwait) begin
                    load_coeff = 1; //allow module to load
                end
                else if (load_coeff) begin
                    load_coeff = 0; //deassert load_coeff
                end
                else begin
                    nexstate = IDLE; //move to next state
                    clear_new_coefficient = 1; //sequence should be done
                end
            end
    endcase 

end

endmodule
