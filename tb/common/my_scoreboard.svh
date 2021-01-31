class my_scoreboard extends uvm_scoreboard;
   `uvm_component_utils(my_scoreboard)
   
   uvm_analysis_export #(my_packet_i) axport_i; // monitor-> prd
   uvm_analysis_export #(my_packet_o) axport_o; // prd -> cmp

   my_predictor my_predictor_h; //REFMOD
   my_comparator my_comparator_h; // comp
   
   function new(string name = "my_scoreboard", uvm_component parent = null);
      super.new(name, parent);
   endfunction // new
   function void build_phase(uvm_phase phase);
      axport_i = new("axport_i", this);
      axport_o = new("axport_o", this);
      my_predictor_h = my_predictor::type_id::create("my_predictor_h", this);      
      my_comparator_h = my_comparator::type_id::create("my_comparator_h", this);
   endfunction // build_phase

   function void connect_phase(uvm_phase phase);
      
      axport_i.connect(my_predictor_h.analysis_export); // my_packet_i -> prd 
      axport_o.connect(my_comparator_h.after_export); // my_packet_o -> cmp
      my_predictor_h.aport.connect(my_comparator_h.before_export); // prd -> cmp
      
   endfunction // connect_phase
   
      
endclass // my_scoreboard

      
