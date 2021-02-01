class monitor extends uvm_monitor;   
   `uvm_component_utils(monitor);

   virtual dut_if#(DATA_WIDTH_I, DATA_WIDTH_O) dut_vi_i;
   packet_i tx;
   
   uvm_analysis_port #(packet_i) aport;
   
   function new(string name = "monitor", uvm_component parent = null);
      super.new(name, parent);
   endfunction // new
  
   function void build_phase(uvm_phase phase);
      aport = new("aport", this);
      if ( !uvm_config_db #(virtual dut_if#(DATA_WIDTH_I, DATA_WIDTH_O))::get(this, "", "dut_if_i", dut_vi_i) )
	`uvm_fatal("NOVIF", "uvm_config_db::get failed")      
   endfunction // build_phase
   
   task run_phase(uvm_phase phase);
      read();
   endtask // run_phase

   virtual protected task read();
      forever begin
	 @(posedge dut_vi_i.clk);
	 if ( (dut_vi_i.valid) && (dut_vi_i.ready) ) begin	    
	    
            tx   = packet_i::type_id::create("tx");            
	    tx.a = dut_vi_i.a;
	    tx.b = dut_vi_i.b;
	    `uvm_info("Monitor", $sformatf("Put transaction A=%0h\tB=%0h\tRDY=%b\tVALID=%b", dut_vi_i.a, dut_vi_i.b, dut_vi_i.ready, dut_vi_i.valid), UVM_LOW)	    

	    aport.write(tx);	    
	 end
      end            
   endtask // read
   
   

endclass // monitor
