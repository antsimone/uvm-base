class scoreboard extends uvm_scoreboard;
   `uvm_component_utils(scoreboard)
   
   uvm_analysis_export #(packet_i) axport_i; // monitor-> prd
   uvm_analysis_export #(packet_o) axport_o; // prd -> cmp

   predictor predictor_h; //REFMOD
   comparator comparator_h; // comp
   
   function new(string name = "scoreboard", uvm_component parent = null);
      super.new(name, parent);
   endfunction // new
   function void build_phase(uvm_phase phase);
      axport_i = new("axport_i", this);
      axport_o = new("axport_o", this);
      predictor_h = predictor::type_id::create("predictor_h", this);      
      comparator_h = comparator::type_id::create("comparator_h", this);
   endfunction // build_phase

   function void connect_phase(uvm_phase phase);
      
      axport_i.connect(predictor_h.analysis_export); // packet_i -> prd 
      axport_o.connect(comparator_h.after_export); // packet_o -> cmp
      predictor_h.aport.connect(comparator_h.before_export); // prd -> cmp
      
   endfunction // connect_phase
   
      
endclass // scoreboard

      
