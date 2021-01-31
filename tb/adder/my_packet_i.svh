class my_packet_i extends uvm_sequence_item;
   
   rand bit [DATA_WIDTH_I-1:0] a;
   rand bit [DATA_WIDTH_I-1:0] b;
   rand bit valid;
   
   constraint c_data_a { a inside {[100:1000]}; }
   constraint c_data_b { b <= 10; }
   
   `uvm_object_utils_begin(my_packet_i)
      `uvm_field_int(a, UVM_ALL_ON|UVM_HEX)
      `uvm_field_int(b, UVM_ALL_ON|UVM_HEX)
      `uvm_field_int(valid, UVM_ALL_ON|UVM_HEX)
   `uvm_object_utils_end
   
   function new(string name ="my_packet_i"); 
      super.new(name);
   endfunction // new
   
endclass // my_packet_i

   
  
