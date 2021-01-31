class my_driver extends uvm_driver #(my_packet_i);   
   `uvm_component_utils(my_driver);
   
   virtual dut_if#(DATA_WIDTH_I, DATA_WIDTH_O) dut_vi_i;
   my_packet_i tx; // PACKET_I
   
   function new(string name = "my_driver", uvm_component parent = null);
      super.new(name, parent);
   endfunction // new

   function void build_phase(uvm_phase phase);
       if ( !uvm_config_db #(virtual dut_if#(DATA_WIDTH_I, DATA_WIDTH_O))::get(this, "", "dut_if_i", dut_vi_i) )
	`uvm_fatal("NOVIF", "uvm_config_db::get failed")            
   endfunction // build_phase
   
   task run_phase(uvm_phase phase);
      drive();
   endtask // run_phase

   virtual protected task drive();     
      forever begin
	 seq_item_port.get_next_item(tx);
	 
	 if (dut_vi_i.rst) begin
	    dut_vi_i.a 	    <= 0;
	    dut_vi_i.b 	    <= 0;
	    dut_vi_i.valid  <= 0;
	    wait(!dut_vi_i.rst);	    
	 end
	 else begin
	    @(posedge dut_vi_i.clk);	   	    
	    dut_vi_i.a 	   <= tx.a;
	    dut_vi_i.b 	   <= tx.b;
	    dut_vi_i.valid <= tx.valid;
	 end // else: !if(dut_vi_i.rst)	 
	 @(posedge dut_vi_i.ready); 
	 seq_item_port.item_done();
	 
      end // forever begin      
   endtask // run_phase
   

endclass // my_driver

	
      
