`include "uvm_macros.svh"
package pkg;
   import uvm_pkg::*;

   parameter DATA_WIDTH_I = 32;
   parameter DATA_WIDTH_O = 32;
   
`include "packet_i.svh"    
`include "sequence.svh"
`include "sequencer.svh"
`include "driver.svh"
`include "monitor.svh"
`include "agent.svh"
`include "packet_o.svh" 
`include "driver_o.svh"  
`include "monitor_o.svh"
`include "agent_o.svh"
`include "predictor.svh"
`include "comparator.svh"   
`include "scoreboard.svh"
`include "env.svh"
`include "test.svh"
        
endpackage // pkg 
   
