`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2019 04:00:29 AM
// Design Name: 
// Module Name: sim_testpat_xgmii
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module sim_testpat_xgmii();

reg clk;
reg reset;

wire [15:0] pktlen = 64;
wire [15:0] gaplen = 12;
wire [63:0] out_rxd;
wire [7:0] out_rxc;

initial begin
    clk = 0;
    forever clk = #1 !clk;
end

initial begin
    reset = 1;
    #10 reset = 0;
end

testpat_xgmii_rx testpat_xgmii_rx_0(.CLK(clk), .RESET(reset), .STARTBTN(1), .PKTLEN(pktlen),
    .GAPLEN(gaplen), .IN_RXD(0), .IN_RXC(0), .OUT_RXD(out_rxd), .OUT_RXC(out_rxc));

endmodule
