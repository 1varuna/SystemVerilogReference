//-----------------------
//interface file for ethernet switch design
//-----------------------

interface eth_sw_if (
  input clk;
  input resetN;
  input [31:0] inDataA; //Port A input data, start and end of packet pulses
  input inSopA;
  input inEopA;
  input [31:0] inDataB;
  input inSopB;
  input inEopB;
  input [31:0] outDataA; //input Data and Sop and Eop packet pulses
  input outSopA;
  input outEopA;
  input [31:0] outDataB; 
  input outSopB;
  input outEopB;
  input portAStall; //Backpressure or stall signals on portA/B
  input portBStall

);


//-----------------------
// Default clocking block
//-----------------------
default clocking  eth_mon_cb @(posedge clk);
  input clk;
  input resetN;
  input [31:0] inDataA; //Port A input data, start and end of packet pulses
  input inSopA;
  input inEopA;
  input [31:0] inDataB;
  input inSopB;
  input inEopB;
  input [31:0] outDataA; //input Data and Sop and Eop packet pulses
  input outSopA;
  input outEopA;
  input [31:0] outDataB; 
  input outSopB;
  input outEopB;
  input portAStall; //Backpressure or stall signals on portA/B
  input portBStall
endclocking: eth_cb

//-----------------------
//Modport for monitor
//-----------------------
modport monitor_mp (
  clocking eth_mon_cb
);

//-----------------------
// clocking block for output signals used by driver
//-----------------------
clocking  eth_drv_cb @(posedge clk);
  input clk;
  input resetN;
  output [31:0] inDataA; //Port A input data, start and end of packet pulses
  output inSopA;
  output inEopA;
  output [31:0] inDataB;
  output inSopB;
  output inEopB;
endclocking: eth_cb

modport driver_mp {
  clocking eth_drv_cb
);

endinterface
