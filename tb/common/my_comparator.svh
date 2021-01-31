class my_comparator extends uvm_component;
   `uvm_component_utils(my_comparator)

   uvm_analysis_export #(my_packet_o) before_export;
   uvm_analysis_export #(my_packet_o) after_export;
   
   uvm_tlm_analysis_fifo #(my_packet_o) before_fifo;
   uvm_tlm_analysis_fifo #(my_packet_o) after_fifo;
   
   int my_matches;
   int my_mismatches;
   
   function new(string name = "my_comparator", uvm_component parent = null);
      super.new(name, parent);     
      my_matches     = 0;
      my_mismatches  = 0;      
   endfunction // new

   function void build_phase(uvm_phase phase);
      before_export  = new("before_export", this);
      after_export   = new("after_export", this);
      before_fifo    = new("before_fifo", this);
      after_fifo     = new("after_fifo", this);     
   endfunction // build_phase
   
   function void connect_phase(uvm_phase phase);
      before_export.connect(before_fifo.analysis_export);
      after_export.connect(after_fifo.analysis_export);      
   endfunction // connect_phase

   task run_phase(uvm_phase phase);
      my_packet_o before_tx;
      my_packet_o after_tx;
      
      forever begin
	 before_fifo.get(before_tx);	    
	 `uvm_info("FIFO_before", $sformatf("RES=%0h", before_tx.res), UVM_MEDIUM);	 
	 phase.raise_objection(this);

	 after_fifo.get(after_tx);
	 `uvm_info("FIFO_after", $sformatf("RES=%0h", after_tx.res), UVM_MEDIUM);	 
	 
	 if( !after_tx.compare(before_tx) ) begin	    
	    my_mismatches++;
	 end
	 else begin
	    my_matches++;
	 end
	 
	 phase.drop_objection(this);
	 
      end // forever begin
      
   endtask // run_phase
   
   function void report_phase(uvm_phase phase);      
      `uvm_info("", $sformatf("\n"), UVM_MEDIUM)
      `uvm_info("CMP", $sformatf("\n\nMatches:\t%0d\n\n", my_matches), UVM_MEDIUM)   
      `uvm_info("CMP", $sformatf("\n\nMismatches:\t%0d\n\n", my_mismatches), UVM_MEDIUM)
   endfunction // report_phase

endclass // my_comparator
