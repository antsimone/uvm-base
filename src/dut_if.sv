interface dut_if 
   #( 
     parameter int DATA_WIDTH_I = 32,
     parameter int DATA_WIDTH_O = 64
   )  
   (
    input logic clk,
    input logic rst    
    );
   
   logic [DATA_WIDTH_I-1:0] a;
   logic [DATA_WIDTH_I-1:0] b;
   logic [DATA_WIDTH_O-1:0] res;
   
   logic       ready;
   logic       valid;
   
   modport Slave
     (
      
      input  clk, 
      input  rst,
      input  a, 
      input  b,
      
      input  valid,
      
      output ready
      
      );
   
   modport Master     
     (
      
      input  clk, 
      input  rst, 
      
      input  ready,
      
      output res,
      
      output valid
      
      );
   
endinterface // dut_if

   
   
