`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/12/2018 04:22:00 AM
// Design Name: 
// Module Name: sim_test_xgmii_to_axis
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


module sim_test_xgmii_to_axis();
reg clk;
reg reset;
reg [63:0] rxd;
reg [3:0] rxlen;

initial begin
    clk = 0;
    forever clk = #1 !clk;
end

initial begin
    reset = 1;
    #10 reset = 0;
end

initial begin
    rxd = 0; rxlen = 0;
    #30;
    rxd = 1; rxlen = 8;
    #30;
    rxlen = 0;
    #30;
    rxd = 2; rxlen = 8;
    #30;
    rxlen = 0;
    #30;
    rxd = 3; rxlen <= 8;
    #30;
    rxlen <= 0;
    #30
    rxd = 4; rxlen <= 8;
    #30;
    rxlen <= 0;
end

test_xgmii_to_axis i0(.XGMII_CLK(clk), .XGMII_RESETN(!reset), .XGMII_D(rxd), .XGMII_LEN(rxlen), .FCS_EN(1), .FCS_CORRECT(1), .OV_TREADY(1));

endmodule
