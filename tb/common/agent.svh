class agent extends uvm_agent;
    `uvm_component_utils(agent);

    uvm_analysis_port #(packet_i) aport;   //PORT

    driver driver_h;
    monitor monitor_h;
    sequencer sequencer_h;

    function new(string name = "agent", uvm_component parent = null);
        super.new(name, parent);
    endfunction // new

    function void build_phase(uvm_phase phase);
        aport       = new("aport", this);
        driver_h    = driver::type_id::create("driver_h", this);
        monitor_h   = monitor::type_id::create("monitor_h", this);
        sequencer_h = sequencer::type_id::create("sequencer_h", this);
    endfunction // build_phase

    function void connect_phase(uvm_phase phase);
        // crei uscita per monitor PORT
        monitor_h.aport.connect(aport);      
        // sequencer --> driver
        driver_h.seq_item_port.connect(sequencer_h.seq_item_export);      
    endfunction // connect_phase


endclass 



