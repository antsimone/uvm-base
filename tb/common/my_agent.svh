class my_agent extends uvm_agent;
   `uvm_component_utils(my_agent);
   
   uvm_analysis_port #(my_packet_i) aport;   //PORT
   
   my_driver my_driver_h;
   my_monitor my_monitor_h;
   my_sequencer my_sequencer_h;
  
   function new(string name = "my_agent", uvm_component parent = null);
      super.new(name, parent);
   endfunction // new

   function void build_phase(uvm_phase phase);
      aport = new("aport", this);
      
      my_driver_h = my_driver::type_id::create("my_driver_h", this);
      my_monitor_h = my_monitor::type_id::create("my_monitor_h", this);
      my_sequencer_h = my_sequencer::type_id::create("my_sequencer_h", this);
   endfunction // build_phase

   function void connect_phase(uvm_phase phase);
      // crei uscita per monitor PORT
      my_monitor_h.aport.connect(aport);      
      // sequencer --> driver
      my_driver_h.seq_item_port.connect(my_sequencer_h.seq_item_export);      
   endfunction // connect_phase
	
endclass // my_agent


   
