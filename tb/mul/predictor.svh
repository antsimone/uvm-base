class predictor extends uvm_subscriber #(packet_i); 
   `uvm_component_utils(predictor)
   
   uvm_analysis_port #(packet_o) aport; // prediction out
   
   function new(string name = "predictor", uvm_component parent = null);
      super.new(name, parent);
   endfunction // new

   function void build_phase(uvm_phase phase);
      aport = new("aport", this);      
   endfunction // build_phase
   
   virtual protected function void write(packet_i t); 
      packet_o out_tx;
      out_tx = packet_o::type_id::create("out_tx",this);
            
      `uvm_info("Predictor", $sformatf("Got transaction: A=%0h\tB=%0h", t.a, t.b), UVM_MEDIUM)      
      
      out_tx.res = t.a * t.b;		    
      aport.write(out_tx);
      
      `uvm_info("Predictor", $sformatf("Put transaction: RES=%0h", out_tx.res), UVM_MEDIUM); 
      
   endfunction // write

endclass // predictor
