class env extends uvm_env;
   `uvm_component_utils(env);
  
   agent agent_h; // in dut
   agent_o agent_o_h; // out dut
   scoreboard scoreboard_h; // comparatore + refmod
   
   function new(string name = "env", uvm_component parent = null);
      super.new(name, parent);
   endfunction // new

   function void build_phase(uvm_phase phase);      
      agent_h = agent::type_id::create("agent_h", this);
      agent_o_h = agent_o::type_id::create("agent_o_h", this);      
      scoreboard_h = scoreboard::type_id::create("scoreboard_h", this);     
   endfunction // build_phase

   function void connect_phase(uvm_phase phase);
// in dut agent --> scoreboard       
agent_h.aport.connect(scoreboard_h.axport_i);
      
      // out dut agent --> scoreboard
      agent_o_h.aport.connect(scoreboard_h.axport_o);      
   endfunction // connect_phase
   
   
endclass // env

