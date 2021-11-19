// 337 TA Provided Lab 4 Testbench
// This code serves as a starer test bench for the synchronizer design
// STUDENT: Replace this message and the above header section with an
// appropriate header based on your other code files

// 0.5um D-FlipFlop Timing Data Estimates:
// Data Propagation delay (clk->Q): 670ps
// Setup time for data relative to clock: 190ps
// Hold time for data relative to clock: 10ps

`timescale 1ns / 10ps

module tb_flex_counter();

  // Define local parameters used by the test bench
  localparam  CLK_PERIOD    = 1;
  localparam  FF_SETUP_TIME = 0.190;
  localparam  FF_HOLD_TIME  = 0.100;
  localparam  CHECK_DELAY   = (CLK_PERIOD - FF_SETUP_TIME); // Check right before the setup time starts
  
  localparam  INACTIVE_VALUE     = 0;
  localparam  RESET_OUTPUT_VALUE = INACTIVE_VALUE;
  localparam NUM_INPUT_BITS = 4; //4 bit input value

  // Declare DUT portmap signals
	reg 	tb_clk;	//clock
	reg	tb_n_rst; //reset
	reg	tb_clear; //clear
	reg	[(NUM_INPUT_BITS-1):0] tb_rollover_val; //main input
	reg	tb_count_en; //enable
	reg	[(NUM_INPUT_BITS-1):0] tb_count_out; // = tb_rollover_val
	reg	tb_rollover_flag; //main output
	reg   tb_expected_rollover_flag;
	reg   [(NUM_INPUT_BITS-1):0] tb_expected_count_out;

	

  // Declare test bench signals
  integer tb_test_num;
  string tb_test_case;
  integer tb_stream_test_num;
  string tb_stream_check_tag;
  
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

task incorrect_rollover;
	begin
	reset_dut(); //reset values
	//tb_n_rst = 1'b1; //reset
	
	
	
	@(negedge tb_clk);
	tb_count_en = 1'b1;
	tb_clear = 1'b0; //clear
	tb_rollover_val = 4'b0111; //input of 7

	repeat (7) begin
		@(posedge tb_clk); //wait 7 clock cycles
	end
	
		
	@(negedge tb_clk); //wait for negedge so that inoputs don't violate setup/hold
	tb_count_en = 1'b0;
	end
endtask


task continuous;
	begin		
	tb_n_rst = 1'b1;
	tb_clear = 1'b0;
	tb_rollover_val = 4'b1111;
	tb_count_en = 1'b1;
	repeat (16) begin
		@(posedge tb_clk);
	end

	tb_count_en = 1'b0;	
	@(negedge tb_clk);
	end
endtask


task discontinuous;
	begin		
	reset_dut(); //reset values
	tb_n_rst = 1'b1;
	tb_clear = 1'b0;
	tb_rollover_val = 4'b1111;
	
	//start counting
	tb_count_en = 1'b1;
	repeat (8) begin
		@(posedge tb_clk);
	end
	//stop counting
	tb_count_en = 1'b0;
	repeat (8) begin
		@(posedge tb_clk);
	end
	 //mid
     	check_output( 1'b0, 4'b1000, 
                  "middle of counting");
	//start counting again
	tb_count_en = 1'b1;
	repeat (8) begin
		@(posedge tb_clk);
	end

	tb_count_en = 1'b0;	
	@(negedge tb_clk);
	end
endtask

task clearenable;
	begin
	reset_dut(); //reset all the values
	tb_n_rst = 1'b1; //reset off
	tb_clear = 1'b1; //clear on
	tb_count_en = 1'b1; //enable set to on

	repeat (5) begin
		@(posedge tb_clk);
	end
	
	tb_count_en = 1'b0;
	tb_clear = 1'b0;
	@(negedge tb_clk);
	end
endtask

task nop_dut;
	begin
	reset_dut();
	tb_n_rst = 1'b1;
	tb_clear = 1'b0;
	tb_count_en = 1'b0;
	tb_rollover_val = 4'b0000;
	
	@(posedge tb_clk); //wait 2 clock cycles
	@(posedge tb_clk);
	end
endtask

task clear_check;
	begin
	reset_dut();
	tb_n_rst = 1'b1;
	tb_clear = 1'b1; //clear is on
	tb_rollover_val = 4'b1010; //decimal value of 10
	
	@(posedge tb_clk); //wait 1 clock cycle
	end
endtask

  //Student Updated: 👨‍🎓
  // Task to cleanly and consistently check DUT output values
  task check_output;
    input logic expected_rollover_flag;
    input logic [(NUM_INPUT_BITS-1):0] expected_count_out;
    input string check_tag;
  begin
	tb_expected_rollover_flag = expected_rollover_flag;
	tb_expected_count_out = expected_count_out;

    if(expected_count_out == tb_count_out) begin // Check passed
      $info("Correct Count_out output %s during %s test case", check_tag, tb_test_case);
    end
    else begin // Check failed
      $error("Incorrect Count_out output %s during %s test case", check_tag, tb_test_case);
	    $finish();
    end

    if(expected_rollover_flag == tb_rollover_flag) begin // Check passed
      $info("Correct Rollover_flag output %s during %s test case", check_tag, tb_test_case);
    end
    else begin // Check failed
      $error("Incorrect Rollover_flag output %s during %s test case", check_tag, tb_test_case);
	    $finish();
    end
  end
  endtask

  // Clock generation block
  always
  begin
    // Start with clock low to avoid false rising edge events at t=0
    tb_clk = 1'b0;
    // Wait half of the clock period before toggling clock value (maintain 50% duty cycle)
    #(CLK_PERIOD/2.0);
    tb_clk = 1'b1;
    // Wait half @(negedge tb_clk); of the clock period before toggling clock value via rerunning the block (maintain 50% duty cycle)
    #(CLK_PERIOD/2.0);
  end
  

  //Student Updated: 👨‍🎓
  // DUT Port map
  flex_counter DUT(.clk(tb_clk), .n_rst(tb_n_rst), 
			.clear(tb_clear), 
			.count_enable(tb_count_en), 
			.rollover_val(tb_rollover_val), 
			.count_out(tb_count_out), 
			.rollover_flag(tb_rollover_flag));


  //Student Updated: 👨‍🎓  
  // Test bench main process
  initial
  begin
    // Initialize all of the test inputs
    //Initial Values for DUT Inputs
	tb_clk = 0;	
	tb_n_rst = 0;
	tb_clear = 1;
	tb_rollover_val = 0;
	tb_count_en = 0;
	tb_count_out = 0;
	tb_rollover_flag = 0;
	tb_expected_rollover_flag = 0;
	tb_expected_count_out = 0;

    	tb_test_num = 0;               // Initialize test case counter
    	tb_test_case = "Test bench initializaton";
   	 tb_stream_test_num = 0;
   	 tb_stream_check_tag = "N/A";
    // Wait some time before starting first test case
    #(0.1);
    
     //Student Updated: 👨‍🎓  
    // ************************************************************************
    // Test Case 1: Power-on Reset of the DUT
    // ************************************************************************
    @(negedge tb_clk); //wait for negedge so that inoputs don't violate setup/hold
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Power on Reset";

    reset_dut(); //execute task

    // Check that internal state was correctly keep after reset release
#(CHECK_DELAY);
    check_output( 1'b1, 0, 
                  "after reset was released");
	
	//Student Updated: 👨‍🎓  
    // ************************************************************************
    // Test Case 2: Rollover for a rollover value that is not a power of two
    // ************************************************************************
    @(negedge tb_clk); //wait for negedge so that inoputs don't violate setup/hold
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Rollover Value Not Divisible By 2";

    incorrect_rollover(); //execute task
    check_output( 1'b1, 4'b0111, 
                  "after 7 clock cycles");

	//Student Updated: 👨‍🎓  
    // ************************************************************************
    // Test Case 3: Continuous Counting
    // ************************************************************************
    @(negedge tb_clk); //wait for negedge so that inoputs don't violate setup/hold
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Continuous Counting";

    reset_dut();
    continuous(); //execute task
    check_output( 1'b0, 4'b0001, 
                  "after 16 clock cycles");

	//Student Updated: 👨‍🎓  
    // ************************************************************************
    // Test Case 4: Discontinuous Counting
    // ************************************************************************
    @(negedge tb_clk); //wait for negedge so that inoputs don't violate setup/hold
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Discontinuous Counting";

    discontinuous(); //execute task
	
    //end
    check_output( 1'b0, 4'b0001, 
                  "end of counting");
	//Student Updated: 👨‍🎓  
    // ************************************************************************
    // Test Case 5: Clear v.s. Count Enable
    // ************************************************************************
    @(negedge tb_clk); //wait for negedge so that inoputs don't violate setup/hold
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Clear v.s. Count Enable";

    clearenable(); //execute task
	
    //end
    check_output( 1'b0, 4'b0000, 
                  "end of counting");

/*	//Student Updated: 👨‍🎓  
    // ************************************************************************
    // Test Case 6: Normal operation DUT Output Check task
    // ************************************************************************
    @(negedge tb_clk); //wait for negedge so that inoputs don't violate setup/hold
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Normal Operation DUT Output Check Task";

    nop_dut(); //execute task

    //end
    check_output(1'b1, 4'b0000, 
			"normal operation check inputs");


	#(0.1);
	//Student Updated: 👨‍🎓  
    // ************************************************************************
    // Test Case 7: Normal Clear Task
    // ************************************************************************
    @(negedge tb_clk); //wait for negedge so that inoputs don't violate setup/hold
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Normal Clear Task";

    clear_check(); //execute task

    //end
    check_output(1'b0, 4'b0000, 
			"normal clear inputs");
	$finish();*/
  end
endmodule
