//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
//Date        : Fri Oct 12 07:03:30 2018
//Host        : habuild running 64-bit Ubuntu 16.04.5 LTS
//Command     : generate_target test_xgmii_to_axis_wrapper.bd
//Design      : test_xgmii_to_axis_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module test_xgmii_to_axis_wrapper
   (FCS_CORRECT,
    FCS_EN,
    OV_TREADY,
    XGMII_CLK,
    XGMII_D,
    XGMII_LEN,
    XGMII_RESETN);
  input FCS_CORRECT;
  input FCS_EN;
  input OV_TREADY;
  input XGMII_CLK;
  input [63:0]XGMII_D;
  input [3:0]XGMII_LEN;
  input XGMII_RESETN;

  wire FCS_CORRECT;
  wire FCS_EN;
  wire OV_TREADY;
  wire XGMII_CLK;
  wire [63:0]XGMII_D;
  wire [3:0]XGMII_LEN;
  wire XGMII_RESETN;

  test_xgmii_to_axis test_xgmii_to_axis_i
       (.FCS_CORRECT(FCS_CORRECT),
        .FCS_EN(FCS_EN),
        .OV_TREADY(OV_TREADY),
        .XGMII_CLK(XGMII_CLK),
        .XGMII_D(XGMII_D),
        .XGMII_LEN(XGMII_LEN),
        .XGMII_RESETN(XGMII_RESETN));
endmodule
