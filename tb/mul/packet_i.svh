class packet_i extends uvm_sequence_item;
   
   rand bit [DATA_WIDTH_I-1:0] a;
   rand bit [DATA_WIDTH_I-1:0] b;
   rand bit valid;
   
   `uvm_object_utils_begin(packet_i)
      `uvm_field_int(a, UVM_ALL_ON|UVM_HEX)
      `uvm_field_int(b, UVM_ALL_ON|UVM_HEX)
      `uvm_field_int(valid, UVM_ALL_ON|UVM_HEX)
   `uvm_object_utils_end
   
   function new(string name ="packet_i"); 
      super.new(name);
   endfunction // new
   
endclass // packet_i

   
  
