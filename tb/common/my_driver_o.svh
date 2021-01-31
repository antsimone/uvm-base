class my_driver_o extends uvm_driver #(my_packet_o);
   `uvm_component_utils(my_driver_o);

   virtual dut_if#(DATA_WIDTH_I, DATA_WIDTH_O) dut_if_o;
   
   function new(string name = "my_driver_o", uvm_component parent = null);
      super.new(name, parent);
   endfunction // new

   function void build_phase(uvm_phase phase);
      if ( !uvm_config_db #(virtual dut_if#(DATA_WIDTH_I, DATA_WIDTH_O))::get(this, "", "dut_if_o", dut_if_o) )
      	`uvm_fatal("NOVIF", "uvm_config_db::get failed")
   endfunction // build_phase         

   task run_phase(uvm_phase phase);
      drive();      
   endtask // run_phase

   virtual protected task drive();
      forever begin
	 if (dut_if_o.rst) begin
	    dut_if_o.ready <= 1'b0;
	    wait(!dut_if_o.rst);	    
	 end
	 else begin
	    @(posedge dut_if_o.clk)
	      dut_if_o.ready <= 1'b1;	    
	      //#110 dut_if_o.ready <= ~dut_if_o.ready;	    	    
	 end	 
      end
   endtask // drive
   
  
endclass // my_driver_o

