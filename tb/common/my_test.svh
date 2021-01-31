class my_test extends uvm_test;  
   `uvm_component_utils(my_test);
 
   my_env my_env_h;   
   my_sequence my_sequence_h;
   
   function new(string name = "my_test", uvm_component parent = null);
      super.new(name, parent);
   endfunction // new

   function void build_phase(uvm_phase phase);
      my_env_h = my_env::type_id::create("my_env_h", this);      
   endfunction // build_phase
   
   task run_phase(uvm_phase phase);
      my_sequence_h = my_sequence::type_id::create("my_seq_h");
      
      phase.raise_objection(this);            
      assert( my_sequence_h.randomize() with { n inside {[16:64]}; } );
      // start sequencer
      my_sequence_h.start(my_env_h.my_agent_h.my_sequencer_h);            
      phase.drop_objection(this);      
   endtask // run_phase
   
endclass // m_test


