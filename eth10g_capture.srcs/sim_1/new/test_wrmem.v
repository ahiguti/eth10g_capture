
module test_wrmem();

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
    rxd <= 0;
    rxlen <= 8;
    #30 rxlen <= 0;
    #30 rxlen <= 8;
    #30 rxlen <= 0;
    #30 rxlen <= 8;
    #30 rxlen <= 0;
    #30 rxlen <= 8;
end

test_wrmem_bd_wrapper i0(.CLK(clk), .XGMII_RESET(reset), .RXD(rxd), .RXLEN(rxlen));

endmodule
