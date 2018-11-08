//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
//Date        : Fri Oct 12 07:03:30 2018
//Host        : habuild running 64-bit Ubuntu 16.04.5 LTS
//Command     : generate_target test_xgmii_to_axis.bd
//Design      : test_xgmii_to_axis
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "test_xgmii_to_axis,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=test_xgmii_to_axis,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=5,numReposBlks=5,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=5,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "test_xgmii_to_axis.hwdef" *) 
module test_xgmii_to_axis
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
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.XGMII_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.XGMII_CLK, ASSOCIATED_RESET XGMII_RESETN, CLK_DOMAIN test_xgmii_to_axis_XGMII_CLK, FREQ_HZ 156250000, PHASE 0.000" *) input XGMII_CLK;
  input [63:0]XGMII_D;
  input [3:0]XGMII_LEN;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.XGMII_RESETN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.XGMII_RESETN, POLARITY ACTIVE_LOW" *) input XGMII_RESETN;

  wire FCS_CORRECT_0_1;
  wire FCS_EN_0_1;
  wire OV_TREADY_0_1;
  wire XGMII_CLK_1;
  wire [63:0]XGMII_D_0_1;
  wire [3:0]XGMII_LEN_0_1;
  wire XGMII_RESETN_1;
  wire [63:0]add_packet_header_0_PKT_TDATA;
  wire add_packet_header_0_PKT_TLAST;
  wire add_packet_header_0_PKT_TVALID;
  wire axis_fifo_0_IV_TREADY;
  wire [63:0]axis_fifo_0_OV_TDATA;
  wire axis_fifo_0_OV_TREADY;
  wire axis_fifo_0_OV_TVALID;
  wire axis_fifo_pdata_IV_TREADY;
  wire axis_fifo_pinfo_IV_TREADY;
  wire [23:0]axis_fifo_pinfo_OV_TDATA;
  wire axis_fifo_pinfo_OV_TREADY;
  wire axis_fifo_pinfo_OV_TVALID;
  wire [63:0]get_packet_info_0_DATA_TDATA;
  wire get_packet_info_0_DATA_TVALID;
  wire [23:0]get_packet_info_0_INFO_TDATA;
  wire get_packet_info_0_INFO_TVALID;

  assign FCS_CORRECT_0_1 = FCS_CORRECT;
  assign FCS_EN_0_1 = FCS_EN;
  assign OV_TREADY_0_1 = OV_TREADY;
  assign XGMII_CLK_1 = XGMII_CLK;
  assign XGMII_D_0_1 = XGMII_D[63:0];
  assign XGMII_LEN_0_1 = XGMII_LEN[3:0];
  assign XGMII_RESETN_1 = XGMII_RESETN;
  test_xgmii_to_axis_add_packet_header_0_0 add_packet_header_0
       (.CLK(XGMII_CLK_1),
        .DATA_TDATA(axis_fifo_0_OV_TDATA),
        .DATA_TREADY(axis_fifo_0_OV_TREADY),
        .DATA_TVALID(axis_fifo_0_OV_TVALID),
        .INFO_TDATA(axis_fifo_pinfo_OV_TDATA),
        .INFO_TREADY(axis_fifo_pinfo_OV_TREADY),
        .INFO_TVALID(axis_fifo_pinfo_OV_TVALID),
        .PKT_TDATA(add_packet_header_0_PKT_TDATA),
        .PKT_TLAST(add_packet_header_0_PKT_TLAST),
        .PKT_TREADY(axis_fifo_0_IV_TREADY),
        .PKT_TVALID(add_packet_header_0_PKT_TVALID),
        .RESETN(XGMII_RESETN_1));
  test_xgmii_to_axis_axis_fifo_0_0 axis_fifo_0
       (.CLK(XGMII_CLK_1),
        .IV_TDATA(add_packet_header_0_PKT_TDATA),
        .IV_TID(1'b0),
        .IV_TKEEP(1'b1),
        .IV_TLAST(add_packet_header_0_PKT_TLAST),
        .IV_TREADY(axis_fifo_0_IV_TREADY),
        .IV_TUSER(1'b0),
        .IV_TVALID(add_packet_header_0_PKT_TVALID),
        .OV_TREADY(OV_TREADY_0_1),
        .RESETN(XGMII_RESETN_1));
  test_xgmii_to_axis_axis_fifo_pdata_0 axis_fifo_pdata
       (.CLK(XGMII_CLK_1),
        .IV_TDATA(get_packet_info_0_DATA_TDATA),
        .IV_TID(1'b0),
        .IV_TKEEP(1'b1),
        .IV_TLAST(1'b0),
        .IV_TREADY(axis_fifo_pdata_IV_TREADY),
        .IV_TUSER(1'b0),
        .IV_TVALID(get_packet_info_0_DATA_TVALID),
        .OV_TDATA(axis_fifo_0_OV_TDATA),
        .OV_TREADY(axis_fifo_0_OV_TREADY),
        .OV_TVALID(axis_fifo_0_OV_TVALID),
        .RESETN(XGMII_RESETN_1));
  test_xgmii_to_axis_axis_fifo_pinfo_0 axis_fifo_pinfo
       (.CLK(XGMII_CLK_1),
        .IV_TDATA(get_packet_info_0_INFO_TDATA),
        .IV_TID(1'b0),
        .IV_TKEEP(1'b1),
        .IV_TLAST(1'b0),
        .IV_TREADY(axis_fifo_pinfo_IV_TREADY),
        .IV_TUSER(1'b0),
        .IV_TVALID(get_packet_info_0_INFO_TVALID),
        .OV_TDATA(axis_fifo_pinfo_OV_TDATA),
        .OV_TREADY(axis_fifo_pinfo_OV_TREADY),
        .OV_TVALID(axis_fifo_pinfo_OV_TVALID),
        .RESETN(XGMII_RESETN_1));
  test_xgmii_to_axis_get_packet_info_0_0 get_packet_info_0
       (.CLK(XGMII_CLK_1),
        .DATA_TDATA(get_packet_info_0_DATA_TDATA),
        .DATA_TREADY(axis_fifo_pdata_IV_TREADY),
        .DATA_TVALID(get_packet_info_0_DATA_TVALID),
        .FCS_CORRECT(FCS_CORRECT_0_1),
        .FCS_EN(FCS_EN_0_1),
        .INFO_TDATA(get_packet_info_0_INFO_TDATA),
        .INFO_TREADY(axis_fifo_pinfo_IV_TREADY),
        .INFO_TVALID(get_packet_info_0_INFO_TVALID),
        .RESETN(XGMII_RESETN_1),
        .XGMII_D(XGMII_D_0_1),
        .XGMII_LEN(XGMII_LEN_0_1));
endmodule
