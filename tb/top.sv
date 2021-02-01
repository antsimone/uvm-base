module top ();
   import uvm_pkg::*;   
   import pkg::*;
   
   logic       clk;
   logic       rst;
   logic [1:0] state;

   dut_if #( DATA_WIDTH_I, DATA_WIDTH_O)
   dut_if_i
      ( 
	.clk(clk), 
	.rst(rst) 	  
	);
   
   dut_if #( DATA_WIDTH_I, DATA_WIDTH_O)
   dut_if_o
      ( 
	.clk(clk), 
	.rst(rst) 	       
	);
   
   dut #( DATA_WIDTH_I, DATA_WIDTH_O) 
   i_dut
      (	     
             .dut_if_i(dut_if_i), 
             .dut_if_o(dut_if_o),
             .state(state)             
             );
   
   initial begin // init & clk gen
      rst = 1'b1;            
      clk = 1'b0;
      $display("%d",DATA_WIDTH_I);      
      #5 rst = ~rst;   
      forever begin
	 #5 clk = ~clk;	 
      end      
   end   
   
   initial begin            
      uvm_config_db #(virtual dut_if#(DATA_WIDTH_I, DATA_WIDTH_O))::set(null, "*", "dut_if_i", dut_if_i);
      
      uvm_config_db #(virtual dut_if#(DATA_WIDTH_I, DATA_WIDTH_O))::set(null, "*", "dut_if_o", dut_if_o);
      
      uvm_top.finish_on_completion = 1;      
      run_test();      
   end

endmodule // top

