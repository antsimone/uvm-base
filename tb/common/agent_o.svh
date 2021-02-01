class agent_o extends uvm_agent;
    `uvm_component_utils(agent_o);

    uvm_analysis_port #(packet_o) aport;

    driver_o driver_h;
    monitor_o monitor_h;

    function new(string name = "agent_o", uvm_component parent = null);
        super.new(name, parent);
    endfunction // new

    function void build_phase(uvm_phase phase);
        aport     = new("aport", this);
        driver_h  = driver_o::type_id::create("driver_h", this);
        monitor_h = monitor_o::type_id::create("monitor_h", this);;
    endfunction // build_phase

    function void connect_phase(uvm_phase phase);
        monitor_h.aport.connect(aport);      
    endfunction // connect_phase


endclass // agent




