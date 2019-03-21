`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/19/2019 02:18:44 PM
// Design Name: 
// Module Name: sim_xgmii_align
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


module sim_xgmii_align();

reg clk;
reg reset;
reg [63:0] rxd;
reg [7:0] rxc;

wire [63:0] algn_rxd;
wire [3:0] algn_rxlen;

initial begin
    clk = 0;
    forever clk = #1 !clk;
end

initial begin
    reset = 1;
    #10 reset = 0;
end

initial begin
    rxc = 8'b11111111;
    rxd = 64'h0707070707070707;
    #20;
    // frame 16byte
    rxc = 8'b00000001;
    rxd = 64'hd5555555555555fb;
    #2;
    rxc = 8'b00000000;
    rxd = 64'hffffffffffffffff;
    #4;
    rxc = 8'b11111111;
    rxd = 64'h07070707070707fd;
    #2;
    // IFG 12byte, frame 20byte
    rxc = 8'b00011111;
    rxd = 64'h555555fb07070707;
    #2;
    rxc = 8'b00000000;
    rxd = 64'hffffffffd5555555;
    #2;
    rxc = 8'b00000000;
    rxd = 64'hffffffffffffffff;
    #4;
    // IFG 4byte, frame 24byge
    rxc = 8'b00011111;
    rxd = 64'h555555fb070707fd;
    #2
    rxc = 8'b00000000;
    rxd = 64'hffffffffd5555555;
    #2;
    rxc = 8'b00000000;
    rxd = 64'hffffffffffffffff;
    #4;
    rxc = 8'b11110000;
    rxd = 64'h070707fdffffffff;
    #2;
    // IFG 4byte, frame 16byte
    rxc = 8'b00000001;
    rxd = 64'hd5555555555555fb;
    #2;
    rxc = 8'b00000000;
    rxd = 64'hffffffffffffffff;
    #4;
    rxc = 8'b11111111;
    rxd = 64'h07070707070707fd;
end

xgmii_rx_align xgmii_rx_align_0(.CLK(clk), .RESET(reset), .XGMII_RXC(rxc), .XGMII_RXD(rxd), .ALGN_RXLEN(algn_rxlen), .ALGN_RXD(algn_rxd));

endmodule
