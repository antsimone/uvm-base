class my_env extends uvm_env;
   `uvm_component_utils(my_env);
  
   my_agent my_agent_h; // in dut
   my_agent_o my_agent_o_h; // out dut
   my_scoreboard my_scoreboard_h; // comparatore + refmod
   
   function new(string name = "my_env", uvm_component parent = null);
      super.new(name, parent);
   endfunction // new

   function void build_phase(uvm_phase phase);      
      my_agent_h = my_agent::type_id::create("my_agent_h", this);
      my_agent_o_h = my_agent_o::type_id::create("my_agent_o_h", this);      
      my_scoreboard_h = my_scoreboard::type_id::create("my_scoreboard_h", this);     
   endfunction // build_phase

   function void connect_phase(uvm_phase phase);
// in dut agent --> scoreboard       
my_agent_h.aport.connect(my_scoreboard_h.axport_i);
      
      // out dut agent --> scoreboard
      my_agent_o_h.aport.connect(my_scoreboard_h.axport_o);      
   endfunction // connect_phase
   
   
endclass // my_env

