`include "uvm_macros.svh"
package my_pkg;
   import uvm_pkg::*;

   parameter DATA_WIDTH_I = 32;
   parameter DATA_WIDTH_O = 32;
   
`include "my_packet_i.svh"    
`include "my_sequence.svh"
`include "my_sequencer.svh"

`include "my_driver.svh"
`include "my_monitor.svh"
`include "my_agent.svh"
   
`include "my_packet_o.svh" 
`include "my_driver_o.svh"  
`include "my_monitor_o.svh"
`include "my_agent_o.svh"

`include "my_predictor.svh"
`include "my_comparator.svh"   
`include "my_scoreboard.svh"
   
`include "my_env.svh"
`include "my_test.svh"
        
endpackage // my_pkg 
   
