class test extends uvm_test;  
   `uvm_component_utils(test);
 
   env env_h;   
   sequence sequence_h;
   
   function new(string name = "test", uvm_component parent = null);
      super.new(name, parent);
   endfunction // new

   function void build_phase(uvm_phase phase);
      env_h = env::type_id::create("env_h", this);      
   endfunction // build_phase
   
   task run_phase(uvm_phase phase);
      sequence_h = sequence::type_id::create("seq_h");
      
      phase.raise_objection(this);            
      assert( sequence_h.randomize() with { n inside {[16:64]}; } );
      // start sequencer
      sequence_h.start(env_h.agent_h.sequencer_h);            
      phase.drop_objection(this);      
   endtask // run_phase
   
endclass // m_test


