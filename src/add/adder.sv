module adder 
  (
   
   input logic [31:0]  a_i,
   input logic [31:0]  b_i,
   output logic [31:0] c_o
   
   );
   
   assign c_o = a_i + b_i;
   
endmodule // adder
