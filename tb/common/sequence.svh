class sequence extends uvm_sequence #(packet_i);   
   `uvm_object_utils(sequence)

   rand int n; // number of tx
   
   function new(string name = "");
      super.new(name);
   endfunction // new

   task body;
      
      packet_i tx;
      tx = packet_i::type_id::create("tx");
      
      repeat(n) begin	 
	 start_item(tx);	 
	 assert( tx.randomize() with { tx.valid > 0; }); 
	 `uvm_info("Packet_in", $sformatf("START_ITEM A=%0h B=%0d VALID=%h", tx.a, tx.b, tx.valid), UVM_MEDIUM)
	 finish_item(tx);	 
      end
      
      // closing
      tx.valid = 0;      
      start_item(tx);
      `uvm_info("Packet_in", $sformatf("FINISH_SEQUENCE"), UVM_MEDIUM)
      finish_item(tx);      
 
    endtask // body
   
endclass // sequence
