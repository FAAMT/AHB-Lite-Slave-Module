

`timescale 1ns / 10ps

module tb_ahb_lite_fir_filter();

// Timing related constants
localparam CLK_PERIOD = 10;
localparam BUS_DELAY  = 800ps; // Based on FF propagation delay

// Sizing related constants
localparam DATA_WIDTH      = 2;
localparam ADDR_WIDTH      = 4;
localparam DATA_WIDTH_BITS = DATA_WIDTH * 8;
localparam DATA_MAX_BIT    = DATA_WIDTH_BITS - 1;
localparam ADDR_MAX_BIT    = ADDR_WIDTH - 1;

// Define our address mapping scheme via constants
localparam ADDR_STATUS      = 4'd0;
localparam ADDR_STATUS_BUSY = 4'd0;
localparam ADDR_STATUS_ERR  = 4'd1;
localparam ADDR_RESULT      = 4'd2;
localparam ADDR_SAMPLE      = 4'd4;
localparam ADDR_COEF_START  = 4'd6;  // F0
localparam ADDR_COEF_SET    = 4'd14; // Coeff Set Confirmation

// AHB-Lite-Slave reset value constants
// Student TODO: Update these based on the reset values for your config registers
localparam RESET_COEFF  = '0;
localparam RESET_SAMPLE = '0;

//*****************************************************************************
// Declare TB Signals (Bus Model Controls)
//*****************************************************************************
// Testing setup signals
logic                      tb_enqueue_transaction;
logic                      tb_transaction_write;
logic                      tb_transaction_fake;
logic [ADDR_MAX_BIT:0]     tb_transaction_addr;
logic [DATA_MAX_BIT:0]     tb_transaction_data;
logic                      tb_transaction_error;
logic [2:0]                tb_transaction_size;
// Testing control signal(s)
logic    tb_enable_transactions;
integer  tb_current_transaction_num;
logic    tb_current_transaction_error;
logic    tb_model_reset;
string   tb_test_case;
integer  tb_test_case_num;
logic [DATA_MAX_BIT:0] tb_test_data;
string                 tb_check_tag;
logic                  tb_mismatch;
logic                  tb_check;

//*****************************************************************************
// General System signals
//*****************************************************************************
logic tb_clk;
logic tb_n_rst;

//*****************************************************************************
// AHB-Lite-Slave side signals
//*****************************************************************************
logic                  tb_hsel;
logic [1:0]            tb_htrans;
logic [ADDR_MAX_BIT:0] tb_haddr;
logic [2:0]            tb_hsize;
logic                  tb_hwrite;
logic [DATA_MAX_BIT:0] tb_hwdata;
logic [DATA_MAX_BIT:0] tb_hrdata;
logic                  tb_hresp;

//*****************************************************************************
// Clock Generation Block
//*****************************************************************************
// Clock generation block
always begin
  // Start with clock low to avoid false rising edge events at t=0
  tb_clk = 1'b0;
  // Wait half of the clock period before toggling clock value (maintain 50% duty cycle)
  #(CLK_PERIOD/2.0);
  tb_clk = 1'b1;
  // Wait half of the clock period before toggling clock value via rerunning the block (maintain 50% duty cycle)
  #(CLK_PERIOD/2.0);
end

//*****************************************************************************
// Bus Model Instance
//*****************************************************************************
ahb_lite_bus BFM (.clk(tb_clk),
                  // Testing setup signals
                  .enqueue_transaction(tb_enqueue_transaction),
                  .transaction_write(tb_transaction_write),
                  .transaction_fake(tb_transaction_fake),
                  .transaction_addr(tb_transaction_addr),
                  .transaction_data(tb_transaction_data),
                  .transaction_error(tb_transaction_error),
                  .transaction_size(tb_transaction_size),
                  // Testing controls
                  .model_reset(tb_model_reset),
                  .enable_transactions(tb_enable_transactions),
                  .current_transaction_num(tb_current_transaction_num),
                  .current_transaction_error(tb_current_transaction_error),
                  // AHB-Lite-Slave Side
                  .hsel(tb_hsel),
                  .htrans(tb_htrans),
                  .haddr(tb_haddr),
                  .hsize(tb_hsize),
                  .hwrite(tb_hwrite),
                  .hwdata(tb_hwdata),
                  .hrdata(tb_hrdata),
                  .hresp(tb_hresp));


//*****************************************************************************
// DUT Instance
//*****************************************************************************
ahb_lite_fir_filter DUT (.clk(tb_clk), .n_rst(tb_n_rst),
                    // AHB-Lite-Slave bus signals
                    .hsel(tb_hsel),
                    .htrans(tb_htrans),
                    .haddr(tb_haddr),
                    .hsize(tb_hsize[0]),
                    .hwrite(tb_hwrite),
                    .hwdata(tb_hwdata),
                    .hrdata(tb_hrdata),
                    .hresp(tb_hresp));

//*****************************************************************************
// DUT Related TB Tasks
//*****************************************************************************
// Task for standard DUT reset procedure
task reset_dut;
begin
  // Activate the reset
  tb_n_rst = 1'b0;

  // Maintain the reset for more than one cycle
  @(posedge tb_clk);
  @(posedge tb_clk);

  // Wait until safely away from rising edge of the clock before releasing
  @(negedge tb_clk);
  tb_n_rst = 1'b1;

  // Leave out of reset for a couple cycles before allowing other stimulus
  // Wait for negative clock edges, 
  // since inputs to DUT should normally be applied away from rising clock edges
  @(negedge tb_clk);
  @(negedge tb_clk);
end
endtask

//*****************************************************************************
// Bus Model Usage Related TB Tasks
//*****************************************************************************
// Task to pulse the reset for the bus model
task reset_model;
begin
  tb_model_reset = 1'b1;
  #(0.1);
  tb_model_reset = 1'b0;
end
endtask

// Task to enqueue a new transaction
task enqueue_transaction;
  input logic for_dut;
  input logic write_mode;
  input logic [ADDR_MAX_BIT:0] address;
  input logic [DATA_MAX_BIT:0] data;
  input logic expected_error;
  input logic size;
begin
  // Make sure enqueue flag is low (will need a 0->1 pulse later)
  tb_enqueue_transaction = 1'b0;
  #0.1ns;

  // Setup info about transaction
  tb_transaction_fake  = ~for_dut;
  tb_transaction_write = write_mode;
  tb_transaction_addr  = address;
  tb_transaction_data  = data;
  tb_transaction_error = expected_error;
  tb_transaction_size  = {2'b00,size};

  // Pulse the enqueue flag
  tb_enqueue_transaction = 1'b1;
  #0.1ns;
  tb_enqueue_transaction = 1'b0;
end
endtask

// Task to wait for multiple transactions to happen
task execute_transactions;
  input integer num_transactions;
  integer wait_var;
begin
  // Activate the bus model
  tb_enable_transactions = 1'b1;
  @(posedge tb_clk);

  // Process the transactions (all but last one overlap 1 out of 2 cycles
  for(wait_var = 0; wait_var < num_transactions; wait_var++) begin
    @(posedge tb_clk);
  end

  // Run out the last one (currently in data phase)
  @(posedge tb_clk);

  // Turn off the bus model
  @(negedge tb_clk);
  tb_enable_transactions = 1'b0;
end
endtask

//*****************************************************************************
//*****************************************************************************
// Main TB Process
//*****************************************************************************
//*****************************************************************************
initial begin
  // Initialize Test Case Navigation Signals
  tb_test_case       = "Initilization";
  tb_test_case_num   = -1;
  tb_test_data       = '0;
  tb_check_tag       = "N/A";
  tb_check           = 1'b0;
  tb_mismatch        = 1'b0;
  // Initialize all of the directly controled DUT inputs
  tb_n_rst          = 1'b1;
  // Initialize all of the bus model control inputs
  tb_model_reset          = 1'b0;
  tb_enable_transactions  = 1'b0;
  tb_enqueue_transaction  = 1'b0;
  tb_transaction_write    = 1'b0;
  tb_transaction_fake     = 1'b0;
  tb_transaction_addr     = '0;
  tb_transaction_data     = '0;
  tb_transaction_error    = 1'b0;
  tb_transaction_size     = 3'd0;

  // Wait some time before starting first test case
  #(0.1);

  // Clear the bus model
  reset_model();

  //*****************************************************************************
  // Power-on-Reset Test Case
  //*****************************************************************************
  // Update Navigation Info
  tb_test_case     = "Power-on-Reset";
  tb_test_case_num = tb_test_case_num + 1;

  // Reset the DUT
  reset_dut();
  // Give some visual spacing between check and next test case start
  #(CLK_PERIOD * 3);

  //*****************************************************************************
  // Test Case: Full Design Test Case 1
  //*****************************************************************************
  // Update Navigation Info
  tb_test_case     = "Full Module Test case 1";
  tb_test_case_num = tb_test_case_num + 1;
  // Reset the DUT to isolate from prior test case
  reset_dut();



  //Check that the Status Register is idle
  tb_test_data = 16'd0; 
  //Enqueue the 'check' read
  enqueue_transaction(1'b1, 1'b0, ADDR_STATUS, tb_test_data, 1'b0, 1'b1);


  //Coeff F0
  // Enqueue the needed transactions (Low Coeff Address => F0, just add 2 x index)
  tb_test_data = 16'h8000; // Fixed decimal value of 1.0
  // Enqueue the write
  enqueue_transaction(1'b1, 1'b1, (ADDR_COEF_START + (2 * 0)), tb_test_data, 1'b0, 1'b1);
  // Enqueue the 'check' read
  enqueue_transaction(1'b1, 1'b0, (ADDR_COEF_START + (2 * 0)), tb_test_data, 1'b0, 1'b1);
  
  //Coeff F1
  // Enqueue the needed transactions
  tb_test_data = 16'h8000; // Fixed decimal value of 1.0
  // Enqueue the write
  enqueue_transaction(1'b1, 1'b1, (ADDR_COEF_START + (2 * 1)), tb_test_data, 1'b0, 1'b1);
  // Enqueue the 'check' read
  enqueue_transaction(1'b1, 1'b0, (ADDR_COEF_START + (2 * 1)), tb_test_data, 1'b0, 1'b1);
  
  //Coeff F2
  // Enqueue the needed transactions 
  tb_test_data = 16'h4000; // Fixed decimal value of 0.5
  // Enqueue the write
  enqueue_transaction(1'b1, 1'b1, (ADDR_COEF_START + (2 * 2)), tb_test_data, 1'b0, 1'b1);
  // Enqueue the 'check' read
  enqueue_transaction(1'b1, 1'b0, (ADDR_COEF_START + (2 * 2)), tb_test_data, 1'b0, 1'b1);

  //Coeff F3
  // Enqueue the needed transactions
  tb_test_data = 16'h4000; // Fixed decimal value of 0.5
  // Enqueue the write
  enqueue_transaction(1'b1, 1'b1, (ADDR_COEF_START + (2 * 3)), tb_test_data, 1'b0, 1'b1);
  // Enqueue the 'check' read
  enqueue_transaction(1'b1, 1'b0, (ADDR_COEF_START + (2 * 3)), tb_test_data, 1'b0, 1'b1);


//Read the status register before intiating
  tb_test_data = 16'd0; //Coeff set to decimal value of 1
  //Enqueue the read
  enqueue_transaction(1'b1, 1'b0, ADDR_STATUS_BUSY, tb_test_data, 1'b0, 1'b1);
 //Enqueue the read
  enqueue_transaction(1'b1, 1'b0, ADDR_STATUS_ERR, 8'd0, 1'b0, 1'b0);


//Initiate coefficient loading
  tb_test_data = 16'd1; //Coeff set to decimal value of 1
  //Enqueue the write
  enqueue_transaction(1'b1, 1'b1, ADDR_COEF_SET, tb_test_data, 1'b0, 1'b1);
  //Enqueue the 'check' read
  enqueue_transaction(1'b1, 1'b0, ADDR_COEF_SET, tb_test_data, 1'b0, 1'b1);

//utput = (-1) * (1) + (1) * (5) + s(-1/2) * (2) + (1/2) * (2) = 4
  enqueue_transaction(1'b1, 1'b0, ADDR_STATUS_BUSY, tb_test_data, 1'b0, 1'b1);
 //Enqueue the read
  enqueue_transaction(1'b1, 1'b0, ADDR_STATUS_ERR, 8'd0, 1'b0, 1'b0);
execute_transactions(15);

  #(CLK_PERIOD * 25) //wait 25 clk periods for calculations to complete

  //Send 4 samples
   tb_test_data = 16'd2; //Sample decimal value of 2
  //Enqueue the write
  enqueue_transaction(1'b1, 1'b1, ADDR_SAMPLE, tb_test_data, 1'b0, 1'b1);

execute_transactions(1);

  
  #(CLK_PERIOD * 25) //wait 25 clk periods for calculations to complete

   tb_test_data = 16'd2; //Sample decimal value of 2
  //Enqueue the write
  enqueue_transaction(1'b1, 1'b1, ADDR_SAMPLE, tb_test_data, 1'b0, 1'b1);

 execute_transactions(1);

  #(CLK_PERIOD * 25) //wait 10 clk periods for calculations to complete

  tb_test_data = 16'd5; //Sample decimal value of 5
  //Enqueue the write
  enqueue_transaction(1'b1, 1'b1, ADDR_SAMPLE, tb_test_data, 1'b0, 1'b1);

 // Run the transactions via the model
  execute_transactions(1);

  #(CLK_PERIOD * 25) //wait 10 clk periods for calculations to complete

 tb_test_data = 16'd1; //Sample decimal value of 1
  //Enqueue the write
  enqueue_transaction(1'b1, 1'b1, ADDR_SAMPLE, tb_test_data, 1'b0, 1'b1);
  
 execute_transactions(1);

  #(CLK_PERIOD * 25) //wait 15 clk periods for calculations to complete

  // output = (-1) * (1) + (1) * (5) + (-1/2) * (2) + (1/2) * (2) = 4

  //Test for result
  tb_test_data = 16'd4; //Result decimal value of 4
  //Enqueue the 'check' read
  enqueue_transaction(1'b1, 1'b0, ADDR_RESULT, tb_test_data, 1'b0, 1'b1);

  // Run the transactions via the model
  execute_transactions(1);

//*****************************************************************************
  // Test Case: Full Design Test Case 2
  //*****************************************************************************
  // Update Navigation Info
  tb_test_case     = "Full Module Test case 2";
  tb_test_case_num = tb_test_case_num + 1;
  // Reset the DUT to isolate from prior test case
  reset_dut();



  //Check that the Status Register is idle
  tb_test_data = 16'd0; 
  //Enqueue the 'check' read
  enqueue_transaction(1'b1, 1'b0, ADDR_STATUS, tb_test_data,1'b0, 1'b1);


  //Coeff F0
  // Enqueue the needed transactions (Low Coeff Address => F0, just add 2 x index)
  tb_test_data = 16'h8000; // Fixed decimal value of 1.0
  // Enqueue the write
  enqueue_transaction(1'b1, 1'b1, (ADDR_COEF_START + (2 * 0)), tb_test_data, 1'b0, 1'b1);
  // Enqueue the 'check' read
  enqueue_transaction(1'b1, 1'b0, (ADDR_COEF_START + (2 * 0)), tb_test_data, 1'b0, 1'b1);
  
  //Coeff F1
  // Enqueue the needed transactions
  tb_test_data = 16'h8000; // Fixed decimal value of 1.0
  // Enqueue the write
  enqueue_transaction(1'b1, 1'b1, (ADDR_COEF_START + (2 * 1)), tb_test_data, 1'b0, 1'b1);
  // Enqueue the 'check' read
  enqueue_transaction(1'b1, 1'b0, (ADDR_COEF_START + (2 * 1)), tb_test_data, 1'b0, 1'b1);
  
  //Coeff F2
  // Enqueue the needed transactions 
  tb_test_data = 16'h8000; // Fixed decimal value of 1
  // Enqueue the write
  enqueue_transaction(1'b1, 1'b1, (ADDR_COEF_START + (2 * 2)), tb_test_data, 1'b0, 1'b1);
  // Enqueue the 'check' read
  enqueue_transaction(1'b1, 1'b0, (ADDR_COEF_START + (2 * 2)), tb_test_data, 1'b0, 1'b1);

  //Coeff F3
  // Enqueue the needed transactions
  tb_test_data = 16'h8000; // Fixed decimal value of 1
  // Enqueue the write
  enqueue_transaction(1'b1, 1'b1, (ADDR_COEF_START + (2 * 3)), tb_test_data, 1'b0, 1'b1);
  // Enqueue the 'check' read
  enqueue_transaction(1'b1, 1'b0, (ADDR_COEF_START + (2 * 3)), tb_test_data, 1'b0, 1'b1);

//Initiate coefficient loading
  tb_test_data = 16'd1; //Coeff set to decimal value of 1
  //Enqueue the write
  enqueue_transaction(1'b1, 1'b1, ADDR_COEF_SET, tb_test_data, 1'b0, 1'b1);
  //Enqueue the 'check' read
  enqueue_transaction(1'b1, 1'b0, ADDR_COEF_SET, tb_test_data, 1'b0, 1'b1);

  execute_transactions(16);
  
  #(CLK_PERIOD * 25) //wait 25 clk periods for calculations to complete

  //Send sample data
   tb_test_data = 16'hffff; //Sample hexadecimal value of ffff
  //Enqueue the write
  enqueue_transaction(1'b1, 1'b1, ADDR_SAMPLE, tb_test_data, 1'b0, 1'b1);
   execute_transactions(1);

  #(CLK_PERIOD * 25) //wait 25 clk periods for calculations to complete


  //OVERFLOW SAMPLE 1utput = (-1) * (1) + (1) * (5) + (-1/2) * (2) + (1/2) * (2) = 4 1'b0, 1'b1);
  execute_transactions(1);


  #(CLK_PERIOD * 25) //wait 25 clk periods for calculations to complete



  //OVERFLOW SAMPLE 2
   tb_test_data = 16'hffff; //Sample hexadecimal value of 1
  //Enqueue the write
  enqueue_transaction(1'b1, 1'b1, ADDR_SAMPLE, tb_test_data, 1'b0, 1'b1);
  execute_transactions(1);

  #(CLK_PERIOD * 25) //wait 10 clk periods to check in the middle of the process

   //OVERFLOW SAMPLE 3
   tb_test_data = 16'hff; //Sample hexadecimal value of 1
  //Enqueue the write
  enqueue_transaction(1'b1, 1'b1, ADDR_SAMPLE, tb_test_data, 1'b0, 1'b1);
  execute_transactions(1);

  #(CLK_PERIOD * 25) //wait 10 clk periods to check in the middle of the process

  
  //TEST CASE CONDITION
  //Check for correct overflow condition operation
  tb_test_data = 16'h100; //Sample hexadecimal value of 1
  enqueue_transaction(1'b1, 1'b0, ADDR_STATUS_ERR, tb_test_data, 1'b0, 1'b1);
  execute_transactions(1);

end

endmodule