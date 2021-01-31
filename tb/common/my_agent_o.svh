class my_agent_o extends uvm_agent;
   `uvm_component_utils(my_agent_o);
   
   uvm_analysis_port #(my_packet_o) aport;
   
   my_driver_o my_driver_h;
   my_monitor_o my_monitor_h;
  
   function new(string name = "my_agent_o", uvm_component parent = null);
      super.new(name, parent);
   endfunction // new

   function void build_phase(uvm_phase phase);
      aport = new("aport", this);      
      my_driver_h = my_driver_o::type_id::create("my_driver_h", this);
      my_monitor_h = my_monitor_o::type_id::create("my_monitor_h", this);;      
   endfunction // build_phase
   
   function void connect_phase(uvm_phase phase);
      my_monitor_h.aport.connect(aport);      
   endfunction // connect_phase
   
endclass // my_agent


   

