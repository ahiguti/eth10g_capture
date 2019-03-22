//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
//Date        : Sat Mar 23 05:01:24 2019
//Host        : habuild running 64-bit Ubuntu 16.04.6 LTS
//Command     : generate_target bd_eth10_capture.bd
//Design      : bd_eth10_capture
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module axis_wrmem_imp_1DB1J91
   (CAP_CNT,
    CAP_DELIM,
    CAP_WCMD,
    CAP_WDATA,
    CAP_WORDCNT,
    CUR_ADDR,
    CUR_WADDR,
    ERR_DELIM,
    ERR_FATAL,
    ERR_STS,
    M_AXI_S2MM_awaddr,
    M_AXI_S2MM_awburst,
    M_AXI_S2MM_awcache,
    M_AXI_S2MM_awid,
    M_AXI_S2MM_awlen,
    M_AXI_S2MM_awprot,
    M_AXI_S2MM_awready,
    M_AXI_S2MM_awsize,
    M_AXI_S2MM_awuser,
    M_AXI_S2MM_awvalid,
    M_AXI_S2MM_bready,
    M_AXI_S2MM_bresp,
    M_AXI_S2MM_bvalid,
    M_AXI_S2MM_wdata,
    M_AXI_S2MM_wlast,
    M_AXI_S2MM_wready,
    M_AXI_S2MM_wstrb,
    M_AXI_S2MM_wvalid,
    S_AXIS_tdata,
    S_AXIS_tlast,
    S_AXIS_tready,
    S_AXIS_tvalid,
    XGMII_CLK,
    XGMII_RESETN,
    s2mm_err);
  output [3:0]CAP_CNT;
  output [3:0]CAP_DELIM;
  output [3:0]CAP_WCMD;
  output [14:0]CAP_WDATA;
  output [4:0]CAP_WORDCNT;
  output [63:0]CUR_ADDR;
  output [63:0]CUR_WADDR;
  output ERR_DELIM;
  output [1:0]ERR_FATAL;
  output [7:0]ERR_STS;
  output [63:0]M_AXI_S2MM_awaddr;
  output [1:0]M_AXI_S2MM_awburst;
  output [3:0]M_AXI_S2MM_awcache;
  output [3:0]M_AXI_S2MM_awid;
  output [7:0]M_AXI_S2MM_awlen;
  output [2:0]M_AXI_S2MM_awprot;
  input M_AXI_S2MM_awready;
  output [2:0]M_AXI_S2MM_awsize;
  output [3:0]M_AXI_S2MM_awuser;
  output M_AXI_S2MM_awvalid;
  output M_AXI_S2MM_bready;
  input [1:0]M_AXI_S2MM_bresp;
  input M_AXI_S2MM_bvalid;
  output [127:0]M_AXI_S2MM_wdata;
  output M_AXI_S2MM_wlast;
  input M_AXI_S2MM_wready;
  output [15:0]M_AXI_S2MM_wstrb;
  output M_AXI_S2MM_wvalid;
  input [63:0]S_AXIS_tdata;
  input [0:0]S_AXIS_tlast;
  output S_AXIS_tready;
  input S_AXIS_tvalid;
  input XGMII_CLK;
  input XGMII_RESETN;
  output s2mm_err;

  wire [63:0]Conn1_TDATA;
  wire [0:0]Conn1_TLAST;
  wire Conn1_TREADY;
  wire Conn1_TVALID;
  wire [63:0]Conn2_AWADDR;
  wire [1:0]Conn2_AWBURST;
  wire [3:0]Conn2_AWCACHE;
  wire [3:0]Conn2_AWID;
  wire [7:0]Conn2_AWLEN;
  wire [2:0]Conn2_AWPROT;
  wire Conn2_AWREADY;
  wire [2:0]Conn2_AWSIZE;
  wire [3:0]Conn2_AWUSER;
  wire Conn2_AWVALID;
  wire Conn2_BREADY;
  wire [1:0]Conn2_BRESP;
  wire Conn2_BVALID;
  wire [127:0]Conn2_WDATA;
  wire Conn2_WLAST;
  wire Conn2_WREADY;
  wire [15:0]Conn2_WSTRB;
  wire Conn2_WVALID;
  wire XGMII_CLK_1;
  wire XGMII_RESETN_1;
  wire [7:0]axi_datamover_0_M_AXIS_S2MM_STS_TDATA;
  wire axi_datamover_0_M_AXIS_S2MM_STS_TREADY;
  wire axi_datamover_0_M_AXIS_S2MM_STS_TVALID;
  wire axi_datamover_0_s2mm_err;
  wire [127:0]axis_dwidth_converter_0_M_AXIS_TDATA;
  wire axis_dwidth_converter_0_M_AXIS_TLAST;
  wire axis_dwidth_converter_0_M_AXIS_TREADY;
  wire axis_dwidth_converter_0_M_AXIS_TVALID;
  wire [3:0]axis_fifo_wcmd_CAP_PUSH;
  wire [103:0]axis_fifo_wcmd_OV_TDATA;
  wire axis_fifo_wcmd_OV_TREADY;
  wire axis_fifo_wcmd_OV_TVALID;
  wire [3:0]axis_fifo_wcmd_cnt_CAP_PUSH;
  wire [103:0]axis_fifo_wcmd_cnt_OV_TDATA;
  wire axis_fifo_wcmd_cnt_OV_TREADY;
  wire axis_fifo_wcmd_cnt_OV_TVALID;
  wire [3:0]axis_fifo_wcmd_delim_CAP_PUSH;
  wire [103:0]axis_fifo_wcmd_delim_OV_TDATA;
  wire axis_fifo_wcmd_delim_OV_TREADY;
  wire axis_fifo_wcmd_delim_OV_TVALID;
  wire [14:0]axis_fifo_wdata_CAP_PUSH;
  wire [127:0]axis_fifo_wdata_OV_TDATA;
  wire [0:0]axis_fifo_wdata_OV_TLAST;
  wire axis_fifo_wdata_OV_TREADY;
  wire axis_fifo_wdata_OV_TVALID;
  wire [4:0]axis_fifo_wordcnt_CAP_PUSH;
  wire [15:0]axis_fifo_wordcnt_OV_TDATA;
  wire axis_fifo_wordcnt_OV_TREADY;
  wire axis_fifo_wordcnt_OV_TVALID;
  wire [103:0]axis_fork_0_OV0_TDATA;
  wire [0:0]axis_fork_0_OV0_TID;
  wire [0:0]axis_fork_0_OV0_TKEEP;
  wire [0:0]axis_fork_0_OV0_TLAST;
  wire axis_fork_0_OV0_TREADY;
  wire [0:0]axis_fork_0_OV0_TUSER;
  wire axis_fork_0_OV0_TVALID;
  wire [103:0]axis_fork_0_OV1_TDATA;
  wire [0:0]axis_fork_0_OV1_TID;
  wire [0:0]axis_fork_0_OV1_TKEEP;
  wire [0:0]axis_fork_0_OV1_TLAST;
  wire axis_fork_0_OV1_TREADY;
  wire [0:0]axis_fork_0_OV1_TUSER;
  wire axis_fork_0_OV1_TVALID;
  wire [103:0]axis_fork_1_OV0_TDATA;
  wire [0:0]axis_fork_1_OV0_TID;
  wire [0:0]axis_fork_1_OV0_TKEEP;
  wire [0:0]axis_fork_1_OV0_TLAST;
  wire axis_fork_1_OV0_TREADY;
  wire [0:0]axis_fork_1_OV0_TUSER;
  wire axis_fork_1_OV0_TVALID;
  wire [103:0]axis_fork_1_OV1_TDATA;
  wire [0:0]axis_fork_1_OV1_TID;
  wire [0:0]axis_fork_1_OV1_TKEEP;
  wire [0:0]axis_fork_1_OV1_TLAST;
  wire axis_fork_1_OV1_TREADY;
  wire [0:0]axis_fork_1_OV1_TUSER;
  wire axis_fork_1_OV1_TVALID;
  wire [63:0]gen_datamover_wcmd_0_CUR_ADDR;
  wire [1:0]gen_datamover_wcmd_0_ERR_FATAL;
  wire [103:0]gen_datamover_wcmd_0_WCMD_TDATA;
  wire gen_datamover_wcmd_0_WCMD_TREADY;
  wire gen_datamover_wcmd_0_WCMD_TVALID;
  wire [127:0]get_word_count_0_OV_TDATA;
  wire get_word_count_0_OV_TLAST;
  wire get_word_count_0_OV_TREADY;
  wire get_word_count_0_OV_TVALID;
  wire [15:0]get_word_count_0_WORDCNT_TDATA;
  wire get_word_count_0_WORDCNT_TREADY;
  wire get_word_count_0_WORDCNT_TVALID;
  wire [15:0]groupify_wordcnt_0_OV_TDATA;
  wire groupify_wordcnt_0_OV_TREADY;
  wire groupify_wordcnt_0_OV_TVALID;
  wire [63:0]rx_wrmem_status_0_CUR_WADDR;
  wire [7:0]rx_wrmem_status_0_ERR_STS;
  wire update_packet_delim_1_ERR_DELIM;
  wire [127:0]update_packet_delim_1_OWDATA_TDATA;
  wire update_packet_delim_1_OWDATA_TLAST;
  wire update_packet_delim_1_OWDATA_TREADY;
  wire update_packet_delim_1_OWDATA_TVALID;
  wire [15:0]xlconstant_1_dout;

  assign CAP_CNT[3:0] = axis_fifo_wcmd_cnt_CAP_PUSH;
  assign CAP_DELIM[3:0] = axis_fifo_wcmd_delim_CAP_PUSH;
  assign CAP_WCMD[3:0] = axis_fifo_wcmd_CAP_PUSH;
  assign CAP_WDATA[14:0] = axis_fifo_wdata_CAP_PUSH;
  assign CAP_WORDCNT[4:0] = axis_fifo_wordcnt_CAP_PUSH;
  assign CUR_ADDR[63:0] = gen_datamover_wcmd_0_CUR_ADDR;
  assign CUR_WADDR[63:0] = rx_wrmem_status_0_CUR_WADDR;
  assign Conn1_TDATA = S_AXIS_tdata[63:0];
  assign Conn1_TLAST = S_AXIS_tlast[0];
  assign Conn1_TVALID = S_AXIS_tvalid;
  assign Conn2_AWREADY = M_AXI_S2MM_awready;
  assign Conn2_BRESP = M_AXI_S2MM_bresp[1:0];
  assign Conn2_BVALID = M_AXI_S2MM_bvalid;
  assign Conn2_WREADY = M_AXI_S2MM_wready;
  assign ERR_DELIM = update_packet_delim_1_ERR_DELIM;
  assign ERR_FATAL[1:0] = gen_datamover_wcmd_0_ERR_FATAL;
  assign ERR_STS[7:0] = rx_wrmem_status_0_ERR_STS;
  assign M_AXI_S2MM_awaddr[63:0] = Conn2_AWADDR;
  assign M_AXI_S2MM_awburst[1:0] = Conn2_AWBURST;
  assign M_AXI_S2MM_awcache[3:0] = Conn2_AWCACHE;
  assign M_AXI_S2MM_awid[3:0] = Conn2_AWID;
  assign M_AXI_S2MM_awlen[7:0] = Conn2_AWLEN;
  assign M_AXI_S2MM_awprot[2:0] = Conn2_AWPROT;
  assign M_AXI_S2MM_awsize[2:0] = Conn2_AWSIZE;
  assign M_AXI_S2MM_awuser[3:0] = Conn2_AWUSER;
  assign M_AXI_S2MM_awvalid = Conn2_AWVALID;
  assign M_AXI_S2MM_bready = Conn2_BREADY;
  assign M_AXI_S2MM_wdata[127:0] = Conn2_WDATA;
  assign M_AXI_S2MM_wlast = Conn2_WLAST;
  assign M_AXI_S2MM_wstrb[15:0] = Conn2_WSTRB;
  assign M_AXI_S2MM_wvalid = Conn2_WVALID;
  assign S_AXIS_tready = Conn1_TREADY;
  assign XGMII_CLK_1 = XGMII_CLK;
  assign XGMII_RESETN_1 = XGMII_RESETN;
  assign s2mm_err = axi_datamover_0_s2mm_err;
  bd_eth10_capture_axi_datamover_0_0 axi_datamover_0
       (.m_axi_s2mm_aclk(XGMII_CLK_1),
        .m_axi_s2mm_aresetn(XGMII_RESETN_1),
        .m_axi_s2mm_awaddr(Conn2_AWADDR),
        .m_axi_s2mm_awburst(Conn2_AWBURST),
        .m_axi_s2mm_awcache(Conn2_AWCACHE),
        .m_axi_s2mm_awid(Conn2_AWID),
        .m_axi_s2mm_awlen(Conn2_AWLEN),
        .m_axi_s2mm_awprot(Conn2_AWPROT),
        .m_axi_s2mm_awready(Conn2_AWREADY),
        .m_axi_s2mm_awsize(Conn2_AWSIZE),
        .m_axi_s2mm_awuser(Conn2_AWUSER),
        .m_axi_s2mm_awvalid(Conn2_AWVALID),
        .m_axi_s2mm_bready(Conn2_BREADY),
        .m_axi_s2mm_bresp(Conn2_BRESP),
        .m_axi_s2mm_bvalid(Conn2_BVALID),
        .m_axi_s2mm_wdata(Conn2_WDATA),
        .m_axi_s2mm_wlast(Conn2_WLAST),
        .m_axi_s2mm_wready(Conn2_WREADY),
        .m_axi_s2mm_wstrb(Conn2_WSTRB),
        .m_axi_s2mm_wvalid(Conn2_WVALID),
        .m_axis_s2mm_cmdsts_aresetn(XGMII_RESETN_1),
        .m_axis_s2mm_cmdsts_awclk(XGMII_CLK_1),
        .m_axis_s2mm_sts_tdata(axi_datamover_0_M_AXIS_S2MM_STS_TDATA),
        .m_axis_s2mm_sts_tready(axi_datamover_0_M_AXIS_S2MM_STS_TREADY),
        .m_axis_s2mm_sts_tvalid(axi_datamover_0_M_AXIS_S2MM_STS_TVALID),
        .s2mm_err(axi_datamover_0_s2mm_err),
        .s_axis_s2mm_cmd_tdata(axis_fifo_wcmd_OV_TDATA),
        .s_axis_s2mm_cmd_tready(axis_fifo_wcmd_OV_TREADY),
        .s_axis_s2mm_cmd_tvalid(axis_fifo_wcmd_OV_TVALID),
        .s_axis_s2mm_tdata(update_packet_delim_1_OWDATA_TDATA),
        .s_axis_s2mm_tkeep(xlconstant_1_dout),
        .s_axis_s2mm_tlast(update_packet_delim_1_OWDATA_TLAST),
        .s_axis_s2mm_tready(update_packet_delim_1_OWDATA_TREADY),
        .s_axis_s2mm_tvalid(update_packet_delim_1_OWDATA_TVALID));
  bd_eth10_capture_axis_dwidth_converter_0_0 axis_dwidth_converter_0
       (.aclk(XGMII_CLK_1),
        .aresetn(XGMII_RESETN_1),
        .m_axis_tdata(axis_dwidth_converter_0_M_AXIS_TDATA),
        .m_axis_tlast(axis_dwidth_converter_0_M_AXIS_TLAST),
        .m_axis_tready(axis_dwidth_converter_0_M_AXIS_TREADY),
        .m_axis_tvalid(axis_dwidth_converter_0_M_AXIS_TVALID),
        .s_axis_tdata(Conn1_TDATA),
        .s_axis_tlast(Conn1_TLAST),
        .s_axis_tready(Conn1_TREADY),
        .s_axis_tvalid(Conn1_TVALID));
  bd_eth10_capture_axis_fifo_wcmd_0 axis_fifo_wcmd
       (.CAP_PUSH(axis_fifo_wcmd_CAP_PUSH),
        .CLK(XGMII_CLK_1),
        .IV_TDATA(axis_fork_0_OV1_TDATA),
        .IV_TID(axis_fork_0_OV1_TID),
        .IV_TKEEP(axis_fork_0_OV1_TKEEP),
        .IV_TLAST(axis_fork_0_OV1_TLAST),
        .IV_TREADY(axis_fork_0_OV1_TREADY),
        .IV_TUSER(axis_fork_0_OV1_TUSER),
        .IV_TVALID(axis_fork_0_OV1_TVALID),
        .OV_TDATA(axis_fifo_wcmd_OV_TDATA),
        .OV_TREADY(axis_fifo_wcmd_OV_TREADY),
        .OV_TVALID(axis_fifo_wcmd_OV_TVALID),
        .RESETN(XGMII_RESETN_1));
  bd_eth10_capture_axis_fifo_wcmd_cnt_0 axis_fifo_wcmd_cnt
       (.CAP_PUSH(axis_fifo_wcmd_cnt_CAP_PUSH),
        .CLK(XGMII_CLK_1),
        .IV_TDATA(axis_fork_1_OV0_TDATA),
        .IV_TID(axis_fork_1_OV0_TID),
        .IV_TKEEP(axis_fork_1_OV0_TKEEP),
        .IV_TLAST(axis_fork_1_OV0_TLAST),
        .IV_TREADY(axis_fork_1_OV0_TREADY),
        .IV_TUSER(axis_fork_1_OV0_TUSER),
        .IV_TVALID(axis_fork_1_OV0_TVALID),
        .OV_TDATA(axis_fifo_wcmd_cnt_OV_TDATA),
        .OV_TREADY(axis_fifo_wcmd_cnt_OV_TREADY),
        .OV_TVALID(axis_fifo_wcmd_cnt_OV_TVALID),
        .RESETN(XGMII_RESETN_1));
  bd_eth10_capture_axis_fifo_wcmd_delim_0 axis_fifo_wcmd_delim
       (.CAP_PUSH(axis_fifo_wcmd_delim_CAP_PUSH),
        .CLK(XGMII_CLK_1),
        .IV_TDATA(axis_fork_1_OV1_TDATA),
        .IV_TID(axis_fork_1_OV1_TID),
        .IV_TKEEP(axis_fork_1_OV1_TKEEP),
        .IV_TLAST(axis_fork_1_OV1_TLAST),
        .IV_TREADY(axis_fork_1_OV1_TREADY),
        .IV_TUSER(axis_fork_1_OV1_TUSER),
        .IV_TVALID(axis_fork_1_OV1_TVALID),
        .OV_TDATA(axis_fifo_wcmd_delim_OV_TDATA),
        .OV_TREADY(axis_fifo_wcmd_delim_OV_TREADY),
        .OV_TVALID(axis_fifo_wcmd_delim_OV_TVALID),
        .RESETN(XGMII_RESETN_1));
  bd_eth10_capture_axis_fifo_wdata_0 axis_fifo_wdata
       (.CAP_PUSH(axis_fifo_wdata_CAP_PUSH),
        .CLK(XGMII_CLK_1),
        .IV_TDATA(get_word_count_0_OV_TDATA),
        .IV_TID(1'b0),
        .IV_TKEEP(1'b1),
        .IV_TLAST(get_word_count_0_OV_TLAST),
        .IV_TREADY(get_word_count_0_OV_TREADY),
        .IV_TUSER(1'b0),
        .IV_TVALID(get_word_count_0_OV_TVALID),
        .OV_TDATA(axis_fifo_wdata_OV_TDATA),
        .OV_TLAST(axis_fifo_wdata_OV_TLAST),
        .OV_TREADY(axis_fifo_wdata_OV_TREADY),
        .OV_TVALID(axis_fifo_wdata_OV_TVALID),
        .RESETN(XGMII_RESETN_1));
  bd_eth10_capture_axis_fifo_wordcnt_0 axis_fifo_wordcnt
       (.CAP_PUSH(axis_fifo_wordcnt_CAP_PUSH),
        .CLK(XGMII_CLK_1),
        .IV_TDATA(get_word_count_0_WORDCNT_TDATA),
        .IV_TID(1'b0),
        .IV_TKEEP(1'b1),
        .IV_TLAST(1'b0),
        .IV_TREADY(get_word_count_0_WORDCNT_TREADY),
        .IV_TUSER(1'b0),
        .IV_TVALID(get_word_count_0_WORDCNT_TVALID),
        .OV_TDATA(axis_fifo_wordcnt_OV_TDATA),
        .OV_TREADY(axis_fifo_wordcnt_OV_TREADY),
        .OV_TVALID(axis_fifo_wordcnt_OV_TVALID),
        .RESETN(XGMII_RESETN_1));
  bd_eth10_capture_axis_fork_0_0 axis_fork_0
       (.CLK(XGMII_CLK_1),
        .IV_TDATA(gen_datamover_wcmd_0_WCMD_TDATA),
        .IV_TID(1'b0),
        .IV_TKEEP(1'b1),
        .IV_TLAST(1'b0),
        .IV_TREADY(gen_datamover_wcmd_0_WCMD_TREADY),
        .IV_TUSER(1'b0),
        .IV_TVALID(gen_datamover_wcmd_0_WCMD_TVALID),
        .OV0_TDATA(axis_fork_0_OV0_TDATA),
        .OV0_TID(axis_fork_0_OV0_TID),
        .OV0_TKEEP(axis_fork_0_OV0_TKEEP),
        .OV0_TLAST(axis_fork_0_OV0_TLAST),
        .OV0_TREADY(axis_fork_0_OV0_TREADY),
        .OV0_TUSER(axis_fork_0_OV0_TUSER),
        .OV0_TVALID(axis_fork_0_OV0_TVALID),
        .OV1_TDATA(axis_fork_0_OV1_TDATA),
        .OV1_TID(axis_fork_0_OV1_TID),
        .OV1_TKEEP(axis_fork_0_OV1_TKEEP),
        .OV1_TLAST(axis_fork_0_OV1_TLAST),
        .OV1_TREADY(axis_fork_0_OV1_TREADY),
        .OV1_TUSER(axis_fork_0_OV1_TUSER),
        .OV1_TVALID(axis_fork_0_OV1_TVALID),
        .RESETN(XGMII_RESETN_1));
  bd_eth10_capture_axis_fork_1_0 axis_fork_1
       (.CLK(XGMII_CLK_1),
        .IV_TDATA(axis_fork_0_OV0_TDATA),
        .IV_TID(axis_fork_0_OV0_TID),
        .IV_TKEEP(axis_fork_0_OV0_TKEEP),
        .IV_TLAST(axis_fork_0_OV0_TLAST),
        .IV_TREADY(axis_fork_0_OV0_TREADY),
        .IV_TUSER(axis_fork_0_OV0_TUSER),
        .IV_TVALID(axis_fork_0_OV0_TVALID),
        .OV0_TDATA(axis_fork_1_OV0_TDATA),
        .OV0_TID(axis_fork_1_OV0_TID),
        .OV0_TKEEP(axis_fork_1_OV0_TKEEP),
        .OV0_TLAST(axis_fork_1_OV0_TLAST),
        .OV0_TREADY(axis_fork_1_OV0_TREADY),
        .OV0_TUSER(axis_fork_1_OV0_TUSER),
        .OV0_TVALID(axis_fork_1_OV0_TVALID),
        .OV1_TDATA(axis_fork_1_OV1_TDATA),
        .OV1_TID(axis_fork_1_OV1_TID),
        .OV1_TKEEP(axis_fork_1_OV1_TKEEP),
        .OV1_TLAST(axis_fork_1_OV1_TLAST),
        .OV1_TREADY(axis_fork_1_OV1_TREADY),
        .OV1_TUSER(axis_fork_1_OV1_TUSER),
        .OV1_TVALID(axis_fork_1_OV1_TVALID),
        .RESETN(XGMII_RESETN_1));
  bd_eth10_capture_gen_datamover_wcmd_0_0 gen_datamover_wcmd_0
       (.CLK(XGMII_CLK_1),
        .CUR_ADDR(gen_datamover_wcmd_0_CUR_ADDR),
        .ERR_FATAL(gen_datamover_wcmd_0_ERR_FATAL),
        .RESETN(XGMII_RESETN_1),
        .WCMD_TDATA(gen_datamover_wcmd_0_WCMD_TDATA),
        .WCMD_TREADY(gen_datamover_wcmd_0_WCMD_TREADY),
        .WCMD_TVALID(gen_datamover_wcmd_0_WCMD_TVALID),
        .WORDCNT_TDATA(groupify_wordcnt_0_OV_TDATA),
        .WORDCNT_TREADY(groupify_wordcnt_0_OV_TREADY),
        .WORDCNT_TVALID(groupify_wordcnt_0_OV_TVALID));
  bd_eth10_capture_get_word_count_0_0 get_word_count_0
       (.CLK(XGMII_CLK_1),
        .IV_TDATA(axis_dwidth_converter_0_M_AXIS_TDATA),
        .IV_TLAST(axis_dwidth_converter_0_M_AXIS_TLAST),
        .IV_TREADY(axis_dwidth_converter_0_M_AXIS_TREADY),
        .IV_TVALID(axis_dwidth_converter_0_M_AXIS_TVALID),
        .OV_TDATA(get_word_count_0_OV_TDATA),
        .OV_TLAST(get_word_count_0_OV_TLAST),
        .OV_TREADY(get_word_count_0_OV_TREADY),
        .OV_TVALID(get_word_count_0_OV_TVALID),
        .RESETN(XGMII_RESETN_1),
        .WORDCNT_TDATA(get_word_count_0_WORDCNT_TDATA),
        .WORDCNT_TREADY(get_word_count_0_WORDCNT_TREADY),
        .WORDCNT_TVALID(get_word_count_0_WORDCNT_TVALID));
  bd_eth10_capture_groupify_wordcnt_0_0 groupify_wordcnt_0
       (.CLK(XGMII_CLK_1),
        .IV_TDATA(axis_fifo_wordcnt_OV_TDATA),
        .IV_TREADY(axis_fifo_wordcnt_OV_TREADY),
        .IV_TVALID(axis_fifo_wordcnt_OV_TVALID),
        .OV_TDATA(groupify_wordcnt_0_OV_TDATA),
        .OV_TREADY(groupify_wordcnt_0_OV_TREADY),
        .OV_TVALID(groupify_wordcnt_0_OV_TVALID),
        .RESETN(XGMII_RESETN_1));
  bd_eth10_capture_rx_wrmem_status_0_0 rx_wrmem_status_0
       (.CLK(XGMII_CLK_1),
        .CUR_WADDR(rx_wrmem_status_0_CUR_WADDR),
        .ERR_STS(rx_wrmem_status_0_ERR_STS),
        .RESETN(XGMII_RESETN_1),
        .STS_TDATA(axi_datamover_0_M_AXIS_S2MM_STS_TDATA),
        .STS_TREADY(axi_datamover_0_M_AXIS_S2MM_STS_TREADY),
        .STS_TVALID(axi_datamover_0_M_AXIS_S2MM_STS_TVALID),
        .WCMD_TDATA(axis_fifo_wcmd_cnt_OV_TDATA),
        .WCMD_TREADY(axis_fifo_wcmd_cnt_OV_TREADY),
        .WCMD_TVALID(axis_fifo_wcmd_cnt_OV_TVALID));
  bd_eth10_capture_update_packet_delim_1_0 update_packet_delim_1
       (.CLK(XGMII_CLK_1),
        .ERR_DELIM(update_packet_delim_1_ERR_DELIM),
        .IWCMD_TDATA(axis_fifo_wcmd_delim_OV_TDATA),
        .IWCMD_TREADY(axis_fifo_wcmd_delim_OV_TREADY),
        .IWCMD_TVALID(axis_fifo_wcmd_delim_OV_TVALID),
        .IWDATA_TDATA(axis_fifo_wdata_OV_TDATA),
        .IWDATA_TLAST(axis_fifo_wdata_OV_TLAST),
        .IWDATA_TREADY(axis_fifo_wdata_OV_TREADY),
        .IWDATA_TVALID(axis_fifo_wdata_OV_TVALID),
        .OWDATA_TDATA(update_packet_delim_1_OWDATA_TDATA),
        .OWDATA_TLAST(update_packet_delim_1_OWDATA_TLAST),
        .OWDATA_TREADY(update_packet_delim_1_OWDATA_TREADY),
        .OWDATA_TVALID(update_packet_delim_1_OWDATA_TVALID),
        .RESETN(XGMII_RESETN_1));
  bd_eth10_capture_xlconstant_1_0 xlconstant_1
       (.dout(xlconstant_1_dout));
endmodule

(* CORE_GENERATION_INFO = "bd_eth10_capture,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=bd_eth10_capture,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=64,numReposBlks=52,numNonXlnxBlks=0,numHierBlks=12,maxHierDepth=2,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=29,numPkgbdBlks=0,bdsource=USER,da_axi4_cnt=1,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "bd_eth10_capture.hwdef" *) 
module bd_eth10_capture
   (I2C_SCL,
    I2C_SDA,
    MGTCLK0_0_clk_n,
    MGTCLK0_0_clk_p,
    SFP1_RX_N_0,
    SFP1_RX_P_0,
    SFP1_TX_N_0,
    SFP1_TX_P_0,
    ddr4_sdram_c0_act_n,
    ddr4_sdram_c0_adr,
    ddr4_sdram_c0_ba,
    ddr4_sdram_c0_bg,
    ddr4_sdram_c0_ck_c,
    ddr4_sdram_c0_ck_t,
    ddr4_sdram_c0_cke,
    ddr4_sdram_c0_cs_n,
    ddr4_sdram_c0_dm_n,
    ddr4_sdram_c0_dq,
    ddr4_sdram_c0_dqs_c,
    ddr4_sdram_c0_dqs_t,
    ddr4_sdram_c0_odt,
    ddr4_sdram_c0_reset_n,
    default_300mhz_clk0_clk_n,
    default_300mhz_clk0_clk_p,
    led_8bits_tri_o,
    pci_express_x8_rxn,
    pci_express_x8_rxp,
    pci_express_x8_txn,
    pci_express_x8_txp,
    pcie_perstn,
    pcie_refclk_clk_n,
    pcie_refclk_clk_p,
    resetn);
  inout I2C_SCL;
  inout I2C_SDA;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 MGTCLK0_0 CLK_N" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME MGTCLK0_0, CAN_DEBUG false, FREQ_HZ 156250000" *) input MGTCLK0_0_clk_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 MGTCLK0_0 CLK_P" *) input MGTCLK0_0_clk_p;
  input SFP1_RX_N_0;
  input SFP1_RX_P_0;
  output SFP1_TX_N_0;
  output SFP1_TX_P_0;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 ddr4_sdram_c0 ACT_N" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ddr4_sdram_c0, AXI_ARBITRATION_SCHEME RD_PRI_REG, BURST_LENGTH 8, CAN_DEBUG false, CAS_LATENCY 16, CAS_WRITE_LATENCY 12, CS_ENABLED true, CUSTOM_PARTS no_file_loaded, DATA_MASK_ENABLED NO_DM_NO_DBI, DATA_WIDTH 72, MEMORY_PART MT40A512M16HA-083E, MEMORY_TYPE Components, MEM_ADDR_MAP ROW_COLUMN_BANK, SLOT Single, TIMEPERIOD_PS 833" *) output ddr4_sdram_c0_act_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 ddr4_sdram_c0 ADR" *) output [16:0]ddr4_sdram_c0_adr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 ddr4_sdram_c0 BA" *) output [1:0]ddr4_sdram_c0_ba;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 ddr4_sdram_c0 BG" *) output ddr4_sdram_c0_bg;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 ddr4_sdram_c0 CK_C" *) output ddr4_sdram_c0_ck_c;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 ddr4_sdram_c0 CK_T" *) output ddr4_sdram_c0_ck_t;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 ddr4_sdram_c0 CKE" *) output ddr4_sdram_c0_cke;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 ddr4_sdram_c0 CS_N" *) output [1:0]ddr4_sdram_c0_cs_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 ddr4_sdram_c0 DM_N" *) inout [8:0]ddr4_sdram_c0_dm_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 ddr4_sdram_c0 DQ" *) inout [71:0]ddr4_sdram_c0_dq;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 ddr4_sdram_c0 DQS_C" *) inout [8:0]ddr4_sdram_c0_dqs_c;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 ddr4_sdram_c0 DQS_T" *) inout [8:0]ddr4_sdram_c0_dqs_t;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 ddr4_sdram_c0 ODT" *) output ddr4_sdram_c0_odt;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 ddr4_sdram_c0 RESET_N" *) output ddr4_sdram_c0_reset_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 default_300mhz_clk0 CLK_N" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME default_300mhz_clk0, CAN_DEBUG false, FREQ_HZ 300000000" *) input default_300mhz_clk0_clk_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 default_300mhz_clk0 CLK_P" *) input default_300mhz_clk0_clk_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 led_8bits TRI_O" *) output [7:0]led_8bits_tri_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:pcie_7x_mgt:1.0 pci_express_x8 rxn" *) input [7:0]pci_express_x8_rxn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:pcie_7x_mgt:1.0 pci_express_x8 rxp" *) input [7:0]pci_express_x8_rxp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:pcie_7x_mgt:1.0 pci_express_x8 txn" *) output [7:0]pci_express_x8_txn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:pcie_7x_mgt:1.0 pci_express_x8 txp" *) output [7:0]pci_express_x8_txp;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.PCIE_PERSTN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.PCIE_PERSTN, POLARITY ACTIVE_LOW" *) input pcie_perstn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 pcie_refclk CLK_N" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME pcie_refclk, CAN_DEBUG false, FREQ_HZ 100000000" *) input pcie_refclk_clk_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 pcie_refclk CLK_P" *) input pcie_refclk_clk_p;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESETN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESETN, POLARITY ACTIVE_LOW" *) input resetn;

  wire CLEAR_ERR_1;
  wire CLK_1;
  wire [63:0]CLOCK_CNT_1;
  wire [15:0]GAPLEN_1;
  wire KEEP_ERROR_PACKET_1;
  wire MGTCLK0_1_CLK_N;
  wire MGTCLK0_1_CLK_P;
  wire Net;
  wire Net1;
  wire [0:0]RESET_N_1;
  wire SFP1_RX_N_0_1;
  wire SFP1_RX_P_0_1;
  wire STARTBTN_1;
  wire [63:0]S_AXIS_1_TDATA;
  wire [0:0]S_AXIS_1_TLAST;
  wire S_AXIS_1_TREADY;
  wire S_AXIS_1_TVALID;
  wire [63:0]S_AXI_S2MM_1_AWADDR;
  wire [1:0]S_AXI_S2MM_1_AWBURST;
  wire [3:0]S_AXI_S2MM_1_AWCACHE;
  wire [3:0]S_AXI_S2MM_1_AWID;
  wire [7:0]S_AXI_S2MM_1_AWLEN;
  wire [2:0]S_AXI_S2MM_1_AWPROT;
  wire S_AXI_S2MM_1_AWREADY;
  wire [2:0]S_AXI_S2MM_1_AWSIZE;
  wire [3:0]S_AXI_S2MM_1_AWUSER;
  wire S_AXI_S2MM_1_AWVALID;
  wire S_AXI_S2MM_1_BREADY;
  wire [1:0]S_AXI_S2MM_1_BRESP;
  wire S_AXI_S2MM_1_BVALID;
  wire [127:0]S_AXI_S2MM_1_WDATA;
  wire S_AXI_S2MM_1_WLAST;
  wire S_AXI_S2MM_1_WREADY;
  wire [15:0]S_AXI_S2MM_1_WSTRB;
  wire S_AXI_S2MM_1_WVALID;
  wire [3:0]axis_wrmem_CAP_CNT;
  wire [3:0]axis_wrmem_CAP_DELIM;
  wire [3:0]axis_wrmem_CAP_WCMD;
  wire [14:0]axis_wrmem_CAP_WDATA;
  wire [4:0]axis_wrmem_CAP_WORDCNT;
  wire [63:0]axis_wrmem_CUR_ADDR;
  wire [63:0]axis_wrmem_CUR_WADDR;
  wire axis_wrmem_ERR_DELIM;
  wire [1:0]axis_wrmem_ERR_FATAL;
  wire [7:0]axis_wrmem_ERR_STS;
  wire axis_wrmem_s2mm_err;
  wire default_300mhz_clk0_1_CLK_N;
  wire default_300mhz_clk0_1_CLK_P;
  wire [15:0]eth10_capt_ctrl_TEST_PKT_SIZE;
  wire eth_quad0_FCS_CORRECT_0;
  wire eth_quad0_FCS_EN_0;
  wire [63:0]eth_quad0_RXD_0;
  wire [3:0]eth_quad0_RXLEN_0;
  wire eth_quad0_XGMII_CLK;
  wire eth_quad0_XGMII_RESET;
  wire eth_quad_SFP1_TX_N;
  wire eth_quad_SFP1_TX_P;
  wire [7:0]pcie_dram_M_AXI_REGS_ARADDR;
  wire pcie_dram_M_AXI_REGS_ARREADY;
  wire pcie_dram_M_AXI_REGS_ARVALID;
  wire [7:0]pcie_dram_M_AXI_REGS_AWADDR;
  wire pcie_dram_M_AXI_REGS_AWREADY;
  wire pcie_dram_M_AXI_REGS_AWVALID;
  wire pcie_dram_M_AXI_REGS_BREADY;
  wire [1:0]pcie_dram_M_AXI_REGS_BRESP;
  wire pcie_dram_M_AXI_REGS_BVALID;
  wire [31:0]pcie_dram_M_AXI_REGS_RDATA;
  wire pcie_dram_M_AXI_REGS_RREADY;
  wire [1:0]pcie_dram_M_AXI_REGS_RRESP;
  wire pcie_dram_M_AXI_REGS_RVALID;
  wire [31:0]pcie_dram_M_AXI_REGS_WDATA;
  wire pcie_dram_M_AXI_REGS_WREADY;
  wire [3:0]pcie_dram_M_AXI_REGS_WSTRB;
  wire pcie_dram_M_AXI_REGS_WVALID;
  wire pcie_dram_ddr4_sdram_c0_ACT_N;
  wire [16:0]pcie_dram_ddr4_sdram_c0_ADR;
  wire [1:0]pcie_dram_ddr4_sdram_c0_BA;
  wire pcie_dram_ddr4_sdram_c0_BG;
  wire pcie_dram_ddr4_sdram_c0_CKE;
  wire pcie_dram_ddr4_sdram_c0_CK_C;
  wire pcie_dram_ddr4_sdram_c0_CK_T;
  wire [1:0]pcie_dram_ddr4_sdram_c0_CS_N;
  wire [8:0]pcie_dram_ddr4_sdram_c0_DM_N;
  wire [71:0]pcie_dram_ddr4_sdram_c0_DQ;
  wire [8:0]pcie_dram_ddr4_sdram_c0_DQS_C;
  wire [8:0]pcie_dram_ddr4_sdram_c0_DQS_T;
  wire pcie_dram_ddr4_sdram_c0_ODT;
  wire pcie_dram_ddr4_sdram_c0_RESET_N;
  wire [7:0]pcie_dram_led_8bits_TRI_O;
  wire [7:0]pcie_dram_pci_express_x8_rxn;
  wire [7:0]pcie_dram_pci_express_x8_rxp;
  wire [7:0]pcie_dram_pci_express_x8_txn;
  wire [7:0]pcie_dram_pci_express_x8_txp;
  wire pcie_perstn_1;
  wire pcie_refclk_1_CLK_N;
  wire pcie_refclk_1_CLK_P;
  wire [0:0]reset_1;
  wire resetn_1;
  wire [0:0]rst_ten_gig_eth_pcs_pma_0_156M_peripheral_aresetn;
  wire [11:0]xgmii_to_axis_CAP_PUSH;
  wire [7:0]xgmii_to_axis_ERR_FCS;
  wire [7:0]xgmii_to_axis_ERR_FULL;
  wire [7:0]xgmii_to_axis_ERR_LONG;
  wire [0:0]xlconstant_0_dout;

  assign MGTCLK0_1_CLK_N = MGTCLK0_0_clk_n;
  assign MGTCLK0_1_CLK_P = MGTCLK0_0_clk_p;
  assign SFP1_RX_N_0_1 = SFP1_RX_N_0;
  assign SFP1_RX_P_0_1 = SFP1_RX_P_0;
  assign SFP1_TX_N_0 = eth_quad_SFP1_TX_N;
  assign SFP1_TX_P_0 = eth_quad_SFP1_TX_P;
  assign ddr4_sdram_c0_act_n = pcie_dram_ddr4_sdram_c0_ACT_N;
  assign ddr4_sdram_c0_adr[16:0] = pcie_dram_ddr4_sdram_c0_ADR;
  assign ddr4_sdram_c0_ba[1:0] = pcie_dram_ddr4_sdram_c0_BA;
  assign ddr4_sdram_c0_bg = pcie_dram_ddr4_sdram_c0_BG;
  assign ddr4_sdram_c0_ck_c = pcie_dram_ddr4_sdram_c0_CK_C;
  assign ddr4_sdram_c0_ck_t = pcie_dram_ddr4_sdram_c0_CK_T;
  assign ddr4_sdram_c0_cke = pcie_dram_ddr4_sdram_c0_CKE;
  assign ddr4_sdram_c0_cs_n[1:0] = pcie_dram_ddr4_sdram_c0_CS_N;
  assign ddr4_sdram_c0_odt = pcie_dram_ddr4_sdram_c0_ODT;
  assign ddr4_sdram_c0_reset_n = pcie_dram_ddr4_sdram_c0_RESET_N;
  assign default_300mhz_clk0_1_CLK_N = default_300mhz_clk0_clk_n;
  assign default_300mhz_clk0_1_CLK_P = default_300mhz_clk0_clk_p;
  assign led_8bits_tri_o[7:0] = pcie_dram_led_8bits_TRI_O;
  assign pci_express_x8_txn[7:0] = pcie_dram_pci_express_x8_txn;
  assign pci_express_x8_txp[7:0] = pcie_dram_pci_express_x8_txp;
  assign pcie_dram_pci_express_x8_rxn = pci_express_x8_rxn[7:0];
  assign pcie_dram_pci_express_x8_rxp = pci_express_x8_rxp[7:0];
  assign pcie_perstn_1 = pcie_perstn;
  assign pcie_refclk_1_CLK_N = pcie_refclk_clk_n;
  assign pcie_refclk_1_CLK_P = pcie_refclk_clk_p;
  assign resetn_1 = resetn;
  axis_wrmem_imp_1DB1J91 axis_wrmem
       (.CAP_CNT(axis_wrmem_CAP_CNT),
        .CAP_DELIM(axis_wrmem_CAP_DELIM),
        .CAP_WCMD(axis_wrmem_CAP_WCMD),
        .CAP_WDATA(axis_wrmem_CAP_WDATA),
        .CAP_WORDCNT(axis_wrmem_CAP_WORDCNT),
        .CUR_ADDR(axis_wrmem_CUR_ADDR),
        .CUR_WADDR(axis_wrmem_CUR_WADDR),
        .ERR_DELIM(axis_wrmem_ERR_DELIM),
        .ERR_FATAL(axis_wrmem_ERR_FATAL),
        .ERR_STS(axis_wrmem_ERR_STS),
        .M_AXI_S2MM_awaddr(S_AXI_S2MM_1_AWADDR),
        .M_AXI_S2MM_awburst(S_AXI_S2MM_1_AWBURST),
        .M_AXI_S2MM_awcache(S_AXI_S2MM_1_AWCACHE),
        .M_AXI_S2MM_awid(S_AXI_S2MM_1_AWID),
        .M_AXI_S2MM_awlen(S_AXI_S2MM_1_AWLEN),
        .M_AXI_S2MM_awprot(S_AXI_S2MM_1_AWPROT),
        .M_AXI_S2MM_awready(S_AXI_S2MM_1_AWREADY),
        .M_AXI_S2MM_awsize(S_AXI_S2MM_1_AWSIZE),
        .M_AXI_S2MM_awuser(S_AXI_S2MM_1_AWUSER),
        .M_AXI_S2MM_awvalid(S_AXI_S2MM_1_AWVALID),
        .M_AXI_S2MM_bready(S_AXI_S2MM_1_BREADY),
        .M_AXI_S2MM_bresp(S_AXI_S2MM_1_BRESP),
        .M_AXI_S2MM_bvalid(S_AXI_S2MM_1_BVALID),
        .M_AXI_S2MM_wdata(S_AXI_S2MM_1_WDATA),
        .M_AXI_S2MM_wlast(S_AXI_S2MM_1_WLAST),
        .M_AXI_S2MM_wready(S_AXI_S2MM_1_WREADY),
        .M_AXI_S2MM_wstrb(S_AXI_S2MM_1_WSTRB),
        .M_AXI_S2MM_wvalid(S_AXI_S2MM_1_WVALID),
        .S_AXIS_tdata(S_AXIS_1_TDATA),
        .S_AXIS_tlast(S_AXIS_1_TLAST),
        .S_AXIS_tready(S_AXIS_1_TREADY),
        .S_AXIS_tvalid(S_AXIS_1_TVALID),
        .XGMII_CLK(eth_quad0_XGMII_CLK),
        .XGMII_RESETN(rst_ten_gig_eth_pcs_pma_0_156M_peripheral_aresetn),
        .s2mm_err(axis_wrmem_s2mm_err));
  eth10_capt_ctrl_imp_1T6HTOG eth10_capt_ctrl
       (.CAP_CNT(axis_wrmem_CAP_CNT),
        .CAP_DELIM(axis_wrmem_CAP_DELIM),
        .CAP_PKT(xgmii_to_axis_CAP_PUSH),
        .CAP_WCMD(axis_wrmem_CAP_WCMD),
        .CAP_WDATA(axis_wrmem_CAP_WDATA),
        .CAP_WORDCNT(axis_wrmem_CAP_WORDCNT),
        .CLEAR_ERR(CLEAR_ERR_1),
        .CLK(eth_quad0_XGMII_CLK),
        .CLOCK_CNT(CLOCK_CNT_1),
        .ERR_DELIM(axis_wrmem_ERR_DELIM),
        .ERR_FCS(xgmii_to_axis_ERR_FCS),
        .ERR_FULL(xgmii_to_axis_ERR_FULL),
        .ERR_LONG(xgmii_to_axis_ERR_LONG),
        .ERR_S2MM(axis_wrmem_s2mm_err),
        .ERR_STS(axis_wrmem_ERR_STS),
        .ERR_WCMD(axis_wrmem_ERR_FATAL),
        .KEEP_ERROR_PACKET(KEEP_ERROR_PACKET_1),
        .RESETN(rst_ten_gig_eth_pcs_pma_0_156M_peripheral_aresetn),
        .TEST_GAP_SIZE(GAPLEN_1),
        .TEST_PKT(STARTBTN_1),
        .TEST_PKT_SIZE(eth10_capt_ctrl_TEST_PKT_SIZE),
        .WADDR_POST(axis_wrmem_CUR_WADDR),
        .WADDR_PRE(axis_wrmem_CUR_ADDR),
        .s_axi_AXILiteS_araddr(pcie_dram_M_AXI_REGS_ARADDR),
        .s_axi_AXILiteS_arready(pcie_dram_M_AXI_REGS_ARREADY),
        .s_axi_AXILiteS_arvalid(pcie_dram_M_AXI_REGS_ARVALID),
        .s_axi_AXILiteS_awaddr(pcie_dram_M_AXI_REGS_AWADDR),
        .s_axi_AXILiteS_awready(pcie_dram_M_AXI_REGS_AWREADY),
        .s_axi_AXILiteS_awvalid(pcie_dram_M_AXI_REGS_AWVALID),
        .s_axi_AXILiteS_bready(pcie_dram_M_AXI_REGS_BREADY),
        .s_axi_AXILiteS_bresp(pcie_dram_M_AXI_REGS_BRESP),
        .s_axi_AXILiteS_bvalid(pcie_dram_M_AXI_REGS_BVALID),
        .s_axi_AXILiteS_rdata(pcie_dram_M_AXI_REGS_RDATA),
        .s_axi_AXILiteS_rready(pcie_dram_M_AXI_REGS_RREADY),
        .s_axi_AXILiteS_rresp(pcie_dram_M_AXI_REGS_RRESP),
        .s_axi_AXILiteS_rvalid(pcie_dram_M_AXI_REGS_RVALID),
        .s_axi_AXILiteS_wdata(pcie_dram_M_AXI_REGS_WDATA),
        .s_axi_AXILiteS_wready(pcie_dram_M_AXI_REGS_WREADY),
        .s_axi_AXILiteS_wstrb(pcie_dram_M_AXI_REGS_WSTRB),
        .s_axi_AXILiteS_wvalid(pcie_dram_M_AXI_REGS_WVALID));
  eth_quad0_imp_QA9G1G eth_quad0
       (.FCS_CORRECT_0(eth_quad0_FCS_CORRECT_0),
        .FCS_EN_0(eth_quad0_FCS_EN_0),
        .GAPLEN(GAPLEN_1),
        .MGTCLK0_clk_n(MGTCLK0_1_CLK_N),
        .MGTCLK0_clk_p(MGTCLK0_1_CLK_P),
        .PKTLEN(eth10_capt_ctrl_TEST_PKT_SIZE),
        .RXD_0(eth_quad0_RXD_0),
        .RXLEN_0(eth_quad0_RXLEN_0),
        .SFP1_RX_N(SFP1_RX_N_0_1),
        .SFP1_RX_P(SFP1_RX_P_0_1),
        .SFP1_TX_N(eth_quad_SFP1_TX_N),
        .SFP1_TX_P(eth_quad_SFP1_TX_P),
        .STARTBTN(STARTBTN_1),
        .XGMII_CLK(eth_quad0_XGMII_CLK),
        .XGMII_RESET(eth_quad0_XGMII_RESET),
        .dclk(CLK_1),
        .reset(reset_1));
  fanctrl_imp_QT2QZE fanctrl
       (.CLK(CLK_1),
        .I2C_SCL(I2C_SCL),
        .I2C_SDA(I2C_SDA),
        .RESET_N(RESET_N_1));
  pcie_dram_imp_1W99HGN pcie_dram
       (.M_AXI_REGS_araddr(pcie_dram_M_AXI_REGS_ARADDR),
        .M_AXI_REGS_arready(pcie_dram_M_AXI_REGS_ARREADY),
        .M_AXI_REGS_arvalid(pcie_dram_M_AXI_REGS_ARVALID),
        .M_AXI_REGS_awaddr(pcie_dram_M_AXI_REGS_AWADDR),
        .M_AXI_REGS_awready(pcie_dram_M_AXI_REGS_AWREADY),
        .M_AXI_REGS_awvalid(pcie_dram_M_AXI_REGS_AWVALID),
        .M_AXI_REGS_bready(pcie_dram_M_AXI_REGS_BREADY),
        .M_AXI_REGS_bresp(pcie_dram_M_AXI_REGS_BRESP),
        .M_AXI_REGS_bvalid(pcie_dram_M_AXI_REGS_BVALID),
        .M_AXI_REGS_rdata(pcie_dram_M_AXI_REGS_RDATA),
        .M_AXI_REGS_rready(pcie_dram_M_AXI_REGS_RREADY),
        .M_AXI_REGS_rresp(pcie_dram_M_AXI_REGS_RRESP),
        .M_AXI_REGS_rvalid(pcie_dram_M_AXI_REGS_RVALID),
        .M_AXI_REGS_wdata(pcie_dram_M_AXI_REGS_WDATA),
        .M_AXI_REGS_wready(pcie_dram_M_AXI_REGS_WREADY),
        .M_AXI_REGS_wstrb(pcie_dram_M_AXI_REGS_WSTRB),
        .M_AXI_REGS_wvalid(pcie_dram_M_AXI_REGS_WVALID),
        .S_AXI_S2MM_awaddr(S_AXI_S2MM_1_AWADDR),
        .S_AXI_S2MM_awburst(S_AXI_S2MM_1_AWBURST),
        .S_AXI_S2MM_awcache(S_AXI_S2MM_1_AWCACHE),
        .S_AXI_S2MM_awid(S_AXI_S2MM_1_AWID),
        .S_AXI_S2MM_awlen(S_AXI_S2MM_1_AWLEN),
        .S_AXI_S2MM_awprot(S_AXI_S2MM_1_AWPROT),
        .S_AXI_S2MM_awready(S_AXI_S2MM_1_AWREADY),
        .S_AXI_S2MM_awsize(S_AXI_S2MM_1_AWSIZE),
        .S_AXI_S2MM_awuser(S_AXI_S2MM_1_AWUSER),
        .S_AXI_S2MM_awvalid(S_AXI_S2MM_1_AWVALID),
        .S_AXI_S2MM_bready(S_AXI_S2MM_1_BREADY),
        .S_AXI_S2MM_bresp(S_AXI_S2MM_1_BRESP),
        .S_AXI_S2MM_bvalid(S_AXI_S2MM_1_BVALID),
        .S_AXI_S2MM_wdata(S_AXI_S2MM_1_WDATA),
        .S_AXI_S2MM_wlast(S_AXI_S2MM_1_WLAST),
        .S_AXI_S2MM_wready(S_AXI_S2MM_1_WREADY),
        .S_AXI_S2MM_wstrb(S_AXI_S2MM_1_WSTRB),
        .S_AXI_S2MM_wvalid(S_AXI_S2MM_1_WVALID),
        .XGMII_CLK(eth_quad0_XGMII_CLK),
        .XGMII_RESETN(rst_ten_gig_eth_pcs_pma_0_156M_peripheral_aresetn),
        .clk_100(CLK_1),
        .ddr4_sdram_c0_act_n(pcie_dram_ddr4_sdram_c0_ACT_N),
        .ddr4_sdram_c0_adr(pcie_dram_ddr4_sdram_c0_ADR),
        .ddr4_sdram_c0_ba(pcie_dram_ddr4_sdram_c0_BA),
        .ddr4_sdram_c0_bg(pcie_dram_ddr4_sdram_c0_BG),
        .ddr4_sdram_c0_ck_c(pcie_dram_ddr4_sdram_c0_CK_C),
        .ddr4_sdram_c0_ck_t(pcie_dram_ddr4_sdram_c0_CK_T),
        .ddr4_sdram_c0_cke(pcie_dram_ddr4_sdram_c0_CKE),
        .ddr4_sdram_c0_cs_n(pcie_dram_ddr4_sdram_c0_CS_N),
        .ddr4_sdram_c0_dm_n(ddr4_sdram_c0_dm_n[8:0]),
        .ddr4_sdram_c0_dq(ddr4_sdram_c0_dq[71:0]),
        .ddr4_sdram_c0_dqs_c(ddr4_sdram_c0_dqs_c[8:0]),
        .ddr4_sdram_c0_dqs_t(ddr4_sdram_c0_dqs_t[8:0]),
        .ddr4_sdram_c0_odt(pcie_dram_ddr4_sdram_c0_ODT),
        .ddr4_sdram_c0_reset_n(pcie_dram_ddr4_sdram_c0_RESET_N),
        .default_300mhz_clk0_clk_n(default_300mhz_clk0_1_CLK_N),
        .default_300mhz_clk0_clk_p(default_300mhz_clk0_1_CLK_P),
        .led_8bits_tri_o(pcie_dram_led_8bits_TRI_O),
        .pci_express_x8_rxn(pcie_dram_pci_express_x8_rxn),
        .pci_express_x8_rxp(pcie_dram_pci_express_x8_rxp),
        .pci_express_x8_txn(pcie_dram_pci_express_x8_txn),
        .pci_express_x8_txp(pcie_dram_pci_express_x8_txp),
        .pcie_perstn(pcie_perstn_1),
        .pcie_refclk_clk_n(pcie_refclk_1_CLK_N),
        .pcie_refclk_clk_p(pcie_refclk_1_CLK_P),
        .resetn(resetn_1));
  bd_eth10_capture_reset_100M_0 reset_100M
       (.aux_reset_in(1'b1),
        .dcm_locked(1'b1),
        .ext_reset_in(resetn_1),
        .mb_debug_sys_rst(1'b0),
        .peripheral_aresetn(RESET_N_1),
        .peripheral_reset(reset_1),
        .slowest_sync_clk(CLK_1));
  bd_eth10_capture_util_vector_logic_0_0 util_vector_logic_0
       (.Op1(eth_quad0_XGMII_RESET),
        .Res(rst_ten_gig_eth_pcs_pma_0_156M_peripheral_aresetn));
  xgmii_to_axis_imp_GIHUUE xgmii_to_axis
       (.CAP_PUSH(xgmii_to_axis_CAP_PUSH),
        .CLEAR_ERR(CLEAR_ERR_1),
        .CLOCK_CNT(CLOCK_CNT_1),
        .ERR_FCS(xgmii_to_axis_ERR_FCS),
        .ERR_FULL(xgmii_to_axis_ERR_FULL),
        .ERR_LONG(xgmii_to_axis_ERR_LONG),
        .FCS_CORRECT(eth_quad0_FCS_CORRECT_0),
        .FCS_EN(eth_quad0_FCS_EN_0),
        .IN_RXD(eth_quad0_RXD_0),
        .IN_RXLEN(eth_quad0_RXLEN_0),
        .KEEP_ERROR_PACKET(KEEP_ERROR_PACKET_1),
        .OV_tdata(S_AXIS_1_TDATA),
        .OV_tlast(S_AXIS_1_TLAST),
        .OV_tready(S_AXIS_1_TREADY),
        .OV_tvalid(S_AXIS_1_TVALID),
        .TEST_PKT(xlconstant_0_dout),
        .TEST_PKT_SIZE(eth10_capt_ctrl_TEST_PKT_SIZE),
        .XGMII_CLK(eth_quad0_XGMII_CLK),
        .XGMII_RESETN(rst_ten_gig_eth_pcs_pma_0_156M_peripheral_aresetn));
  bd_eth10_capture_xlconstant_0_0 xlconstant_0
       (.dout(xlconstant_0_dout));
endmodule

module bd_eth10_capture_xdma_0_axi_periph_0
   (ACLK,
    ARESETN,
    M00_ACLK,
    M00_ARESETN,
    M00_AXI_araddr,
    M00_AXI_arready,
    M00_AXI_arvalid,
    M00_AXI_awaddr,
    M00_AXI_awready,
    M00_AXI_awvalid,
    M00_AXI_bready,
    M00_AXI_bresp,
    M00_AXI_bvalid,
    M00_AXI_rdata,
    M00_AXI_rready,
    M00_AXI_rresp,
    M00_AXI_rvalid,
    M00_AXI_wdata,
    M00_AXI_wready,
    M00_AXI_wstrb,
    M00_AXI_wvalid,
    M01_ACLK,
    M01_ARESETN,
    M01_AXI_araddr,
    M01_AXI_arready,
    M01_AXI_arvalid,
    M01_AXI_awaddr,
    M01_AXI_awready,
    M01_AXI_awvalid,
    M01_AXI_bready,
    M01_AXI_bresp,
    M01_AXI_bvalid,
    M01_AXI_rdata,
    M01_AXI_rready,
    M01_AXI_rresp,
    M01_AXI_rvalid,
    M01_AXI_wdata,
    M01_AXI_wready,
    M01_AXI_wvalid,
    M02_ACLK,
    M02_ARESETN,
    M02_AXI_araddr,
    M02_AXI_arready,
    M02_AXI_arvalid,
    M02_AXI_awaddr,
    M02_AXI_awready,
    M02_AXI_awvalid,
    M02_AXI_bready,
    M02_AXI_bresp,
    M02_AXI_bvalid,
    M02_AXI_rdata,
    M02_AXI_rready,
    M02_AXI_rresp,
    M02_AXI_rvalid,
    M02_AXI_wdata,
    M02_AXI_wready,
    M02_AXI_wstrb,
    M02_AXI_wvalid,
    S00_ACLK,
    S00_ARESETN,
    S00_AXI_araddr,
    S00_AXI_arprot,
    S00_AXI_arready,
    S00_AXI_arvalid,
    S00_AXI_awaddr,
    S00_AXI_awprot,
    S00_AXI_awready,
    S00_AXI_awvalid,
    S00_AXI_bready,
    S00_AXI_bresp,
    S00_AXI_bvalid,
    S00_AXI_rdata,
    S00_AXI_rready,
    S00_AXI_rresp,
    S00_AXI_rvalid,
    S00_AXI_wdata,
    S00_AXI_wready,
    S00_AXI_wstrb,
    S00_AXI_wvalid);
  input ACLK;
  input ARESETN;
  input M00_ACLK;
  input M00_ARESETN;
  output [31:0]M00_AXI_araddr;
  input [0:0]M00_AXI_arready;
  output [0:0]M00_AXI_arvalid;
  output [31:0]M00_AXI_awaddr;
  input [0:0]M00_AXI_awready;
  output [0:0]M00_AXI_awvalid;
  output [0:0]M00_AXI_bready;
  input [1:0]M00_AXI_bresp;
  input [0:0]M00_AXI_bvalid;
  input [31:0]M00_AXI_rdata;
  output [0:0]M00_AXI_rready;
  input [1:0]M00_AXI_rresp;
  input [0:0]M00_AXI_rvalid;
  output [31:0]M00_AXI_wdata;
  input [0:0]M00_AXI_wready;
  output [3:0]M00_AXI_wstrb;
  output [0:0]M00_AXI_wvalid;
  input M01_ACLK;
  input M01_ARESETN;
  output [31:0]M01_AXI_araddr;
  input M01_AXI_arready;
  output M01_AXI_arvalid;
  output [31:0]M01_AXI_awaddr;
  input M01_AXI_awready;
  output M01_AXI_awvalid;
  output M01_AXI_bready;
  input [1:0]M01_AXI_bresp;
  input M01_AXI_bvalid;
  input [31:0]M01_AXI_rdata;
  output M01_AXI_rready;
  input [1:0]M01_AXI_rresp;
  input M01_AXI_rvalid;
  output [31:0]M01_AXI_wdata;
  input M01_AXI_wready;
  output M01_AXI_wvalid;
  input M02_ACLK;
  input M02_ARESETN;
  output [7:0]M02_AXI_araddr;
  input M02_AXI_arready;
  output M02_AXI_arvalid;
  output [7:0]M02_AXI_awaddr;
  input M02_AXI_awready;
  output M02_AXI_awvalid;
  output M02_AXI_bready;
  input [1:0]M02_AXI_bresp;
  input M02_AXI_bvalid;
  input [31:0]M02_AXI_rdata;
  output M02_AXI_rready;
  input [1:0]M02_AXI_rresp;
  input M02_AXI_rvalid;
  output [31:0]M02_AXI_wdata;
  input M02_AXI_wready;
  output [3:0]M02_AXI_wstrb;
  output M02_AXI_wvalid;
  input S00_ACLK;
  input S00_ARESETN;
  input [31:0]S00_AXI_araddr;
  input [2:0]S00_AXI_arprot;
  output [0:0]S00_AXI_arready;
  input [0:0]S00_AXI_arvalid;
  input [31:0]S00_AXI_awaddr;
  input [2:0]S00_AXI_awprot;
  output [0:0]S00_AXI_awready;
  input [0:0]S00_AXI_awvalid;
  input [0:0]S00_AXI_bready;
  output [1:0]S00_AXI_bresp;
  output [0:0]S00_AXI_bvalid;
  output [31:0]S00_AXI_rdata;
  input [0:0]S00_AXI_rready;
  output [1:0]S00_AXI_rresp;
  output [0:0]S00_AXI_rvalid;
  input [31:0]S00_AXI_wdata;
  output [0:0]S00_AXI_wready;
  input [3:0]S00_AXI_wstrb;
  input [0:0]S00_AXI_wvalid;

  wire M00_ACLK_1;
  wire M00_ARESETN_1;
  wire M01_ACLK_1;
  wire M01_ARESETN_1;
  wire M02_ACLK_1;
  wire M02_ARESETN_1;
  wire S00_ACLK_1;
  wire S00_ARESETN_1;
  wire [31:0]m00_couplers_to_xdma_0_axi_periph_ARADDR;
  wire [0:0]m00_couplers_to_xdma_0_axi_periph_ARREADY;
  wire [0:0]m00_couplers_to_xdma_0_axi_periph_ARVALID;
  wire [31:0]m00_couplers_to_xdma_0_axi_periph_AWADDR;
  wire [0:0]m00_couplers_to_xdma_0_axi_periph_AWREADY;
  wire [0:0]m00_couplers_to_xdma_0_axi_periph_AWVALID;
  wire [0:0]m00_couplers_to_xdma_0_axi_periph_BREADY;
  wire [1:0]m00_couplers_to_xdma_0_axi_periph_BRESP;
  wire [0:0]m00_couplers_to_xdma_0_axi_periph_BVALID;
  wire [31:0]m00_couplers_to_xdma_0_axi_periph_RDATA;
  wire [0:0]m00_couplers_to_xdma_0_axi_periph_RREADY;
  wire [1:0]m00_couplers_to_xdma_0_axi_periph_RRESP;
  wire [0:0]m00_couplers_to_xdma_0_axi_periph_RVALID;
  wire [31:0]m00_couplers_to_xdma_0_axi_periph_WDATA;
  wire [0:0]m00_couplers_to_xdma_0_axi_periph_WREADY;
  wire [3:0]m00_couplers_to_xdma_0_axi_periph_WSTRB;
  wire [0:0]m00_couplers_to_xdma_0_axi_periph_WVALID;
  wire [31:0]m01_couplers_to_xdma_0_axi_periph_ARADDR;
  wire m01_couplers_to_xdma_0_axi_periph_ARREADY;
  wire m01_couplers_to_xdma_0_axi_periph_ARVALID;
  wire [31:0]m01_couplers_to_xdma_0_axi_periph_AWADDR;
  wire m01_couplers_to_xdma_0_axi_periph_AWREADY;
  wire m01_couplers_to_xdma_0_axi_periph_AWVALID;
  wire m01_couplers_to_xdma_0_axi_periph_BREADY;
  wire [1:0]m01_couplers_to_xdma_0_axi_periph_BRESP;
  wire m01_couplers_to_xdma_0_axi_periph_BVALID;
  wire [31:0]m01_couplers_to_xdma_0_axi_periph_RDATA;
  wire m01_couplers_to_xdma_0_axi_periph_RREADY;
  wire [1:0]m01_couplers_to_xdma_0_axi_periph_RRESP;
  wire m01_couplers_to_xdma_0_axi_periph_RVALID;
  wire [31:0]m01_couplers_to_xdma_0_axi_periph_WDATA;
  wire m01_couplers_to_xdma_0_axi_periph_WREADY;
  wire m01_couplers_to_xdma_0_axi_periph_WVALID;
  wire [7:0]m02_couplers_to_xdma_0_axi_periph_ARADDR;
  wire m02_couplers_to_xdma_0_axi_periph_ARREADY;
  wire m02_couplers_to_xdma_0_axi_periph_ARVALID;
  wire [7:0]m02_couplers_to_xdma_0_axi_periph_AWADDR;
  wire m02_couplers_to_xdma_0_axi_periph_AWREADY;
  wire m02_couplers_to_xdma_0_axi_periph_AWVALID;
  wire m02_couplers_to_xdma_0_axi_periph_BREADY;
  wire [1:0]m02_couplers_to_xdma_0_axi_periph_BRESP;
  wire m02_couplers_to_xdma_0_axi_periph_BVALID;
  wire [31:0]m02_couplers_to_xdma_0_axi_periph_RDATA;
  wire m02_couplers_to_xdma_0_axi_periph_RREADY;
  wire [1:0]m02_couplers_to_xdma_0_axi_periph_RRESP;
  wire m02_couplers_to_xdma_0_axi_periph_RVALID;
  wire [31:0]m02_couplers_to_xdma_0_axi_periph_WDATA;
  wire m02_couplers_to_xdma_0_axi_periph_WREADY;
  wire [3:0]m02_couplers_to_xdma_0_axi_periph_WSTRB;
  wire m02_couplers_to_xdma_0_axi_periph_WVALID;
  wire [31:0]s00_couplers_to_xbar_ARADDR;
  wire [2:0]s00_couplers_to_xbar_ARPROT;
  wire [0:0]s00_couplers_to_xbar_ARREADY;
  wire [0:0]s00_couplers_to_xbar_ARVALID;
  wire [31:0]s00_couplers_to_xbar_AWADDR;
  wire [2:0]s00_couplers_to_xbar_AWPROT;
  wire [0:0]s00_couplers_to_xbar_AWREADY;
  wire [0:0]s00_couplers_to_xbar_AWVALID;
  wire [0:0]s00_couplers_to_xbar_BREADY;
  wire [1:0]s00_couplers_to_xbar_BRESP;
  wire [0:0]s00_couplers_to_xbar_BVALID;
  wire [31:0]s00_couplers_to_xbar_RDATA;
  wire [0:0]s00_couplers_to_xbar_RREADY;
  wire [1:0]s00_couplers_to_xbar_RRESP;
  wire [0:0]s00_couplers_to_xbar_RVALID;
  wire [31:0]s00_couplers_to_xbar_WDATA;
  wire [0:0]s00_couplers_to_xbar_WREADY;
  wire [3:0]s00_couplers_to_xbar_WSTRB;
  wire [0:0]s00_couplers_to_xbar_WVALID;
  wire [31:0]xbar_to_m00_couplers_ARADDR;
  wire [0:0]xbar_to_m00_couplers_ARREADY;
  wire [0:0]xbar_to_m00_couplers_ARVALID;
  wire [31:0]xbar_to_m00_couplers_AWADDR;
  wire [0:0]xbar_to_m00_couplers_AWREADY;
  wire [0:0]xbar_to_m00_couplers_AWVALID;
  wire [0:0]xbar_to_m00_couplers_BREADY;
  wire [1:0]xbar_to_m00_couplers_BRESP;
  wire [0:0]xbar_to_m00_couplers_BVALID;
  wire [31:0]xbar_to_m00_couplers_RDATA;
  wire [0:0]xbar_to_m00_couplers_RREADY;
  wire [1:0]xbar_to_m00_couplers_RRESP;
  wire [0:0]xbar_to_m00_couplers_RVALID;
  wire [31:0]xbar_to_m00_couplers_WDATA;
  wire [0:0]xbar_to_m00_couplers_WREADY;
  wire [3:0]xbar_to_m00_couplers_WSTRB;
  wire [0:0]xbar_to_m00_couplers_WVALID;
  wire [63:32]xbar_to_m01_couplers_ARADDR;
  wire [5:3]xbar_to_m01_couplers_ARPROT;
  wire xbar_to_m01_couplers_ARREADY;
  wire [1:1]xbar_to_m01_couplers_ARVALID;
  wire [63:32]xbar_to_m01_couplers_AWADDR;
  wire [5:3]xbar_to_m01_couplers_AWPROT;
  wire xbar_to_m01_couplers_AWREADY;
  wire [1:1]xbar_to_m01_couplers_AWVALID;
  wire [1:1]xbar_to_m01_couplers_BREADY;
  wire [1:0]xbar_to_m01_couplers_BRESP;
  wire xbar_to_m01_couplers_BVALID;
  wire [31:0]xbar_to_m01_couplers_RDATA;
  wire [1:1]xbar_to_m01_couplers_RREADY;
  wire [1:0]xbar_to_m01_couplers_RRESP;
  wire xbar_to_m01_couplers_RVALID;
  wire [63:32]xbar_to_m01_couplers_WDATA;
  wire xbar_to_m01_couplers_WREADY;
  wire [7:4]xbar_to_m01_couplers_WSTRB;
  wire [1:1]xbar_to_m01_couplers_WVALID;
  wire [95:64]xbar_to_m02_couplers_ARADDR;
  wire [8:6]xbar_to_m02_couplers_ARPROT;
  wire xbar_to_m02_couplers_ARREADY;
  wire [2:2]xbar_to_m02_couplers_ARVALID;
  wire [95:64]xbar_to_m02_couplers_AWADDR;
  wire [8:6]xbar_to_m02_couplers_AWPROT;
  wire xbar_to_m02_couplers_AWREADY;
  wire [2:2]xbar_to_m02_couplers_AWVALID;
  wire [2:2]xbar_to_m02_couplers_BREADY;
  wire [1:0]xbar_to_m02_couplers_BRESP;
  wire xbar_to_m02_couplers_BVALID;
  wire [31:0]xbar_to_m02_couplers_RDATA;
  wire [2:2]xbar_to_m02_couplers_RREADY;
  wire [1:0]xbar_to_m02_couplers_RRESP;
  wire xbar_to_m02_couplers_RVALID;
  wire [95:64]xbar_to_m02_couplers_WDATA;
  wire xbar_to_m02_couplers_WREADY;
  wire [11:8]xbar_to_m02_couplers_WSTRB;
  wire [2:2]xbar_to_m02_couplers_WVALID;
  wire xdma_0_axi_periph_ACLK_net;
  wire xdma_0_axi_periph_ARESETN_net;
  wire [31:0]xdma_0_axi_periph_to_s00_couplers_ARADDR;
  wire [2:0]xdma_0_axi_periph_to_s00_couplers_ARPROT;
  wire [0:0]xdma_0_axi_periph_to_s00_couplers_ARREADY;
  wire [0:0]xdma_0_axi_periph_to_s00_couplers_ARVALID;
  wire [31:0]xdma_0_axi_periph_to_s00_couplers_AWADDR;
  wire [2:0]xdma_0_axi_periph_to_s00_couplers_AWPROT;
  wire [0:0]xdma_0_axi_periph_to_s00_couplers_AWREADY;
  wire [0:0]xdma_0_axi_periph_to_s00_couplers_AWVALID;
  wire [0:0]xdma_0_axi_periph_to_s00_couplers_BREADY;
  wire [1:0]xdma_0_axi_periph_to_s00_couplers_BRESP;
  wire [0:0]xdma_0_axi_periph_to_s00_couplers_BVALID;
  wire [31:0]xdma_0_axi_periph_to_s00_couplers_RDATA;
  wire [0:0]xdma_0_axi_periph_to_s00_couplers_RREADY;
  wire [1:0]xdma_0_axi_periph_to_s00_couplers_RRESP;
  wire [0:0]xdma_0_axi_periph_to_s00_couplers_RVALID;
  wire [31:0]xdma_0_axi_periph_to_s00_couplers_WDATA;
  wire [0:0]xdma_0_axi_periph_to_s00_couplers_WREADY;
  wire [3:0]xdma_0_axi_periph_to_s00_couplers_WSTRB;
  wire [0:0]xdma_0_axi_periph_to_s00_couplers_WVALID;
  wire [8:0]NLW_xbar_m_axi_arprot_UNCONNECTED;
  wire [8:0]NLW_xbar_m_axi_awprot_UNCONNECTED;

  assign M00_ACLK_1 = M00_ACLK;
  assign M00_ARESETN_1 = M00_ARESETN;
  assign M00_AXI_araddr[31:0] = m00_couplers_to_xdma_0_axi_periph_ARADDR;
  assign M00_AXI_arvalid[0] = m00_couplers_to_xdma_0_axi_periph_ARVALID;
  assign M00_AXI_awaddr[31:0] = m00_couplers_to_xdma_0_axi_periph_AWADDR;
  assign M00_AXI_awvalid[0] = m00_couplers_to_xdma_0_axi_periph_AWVALID;
  assign M00_AXI_bready[0] = m00_couplers_to_xdma_0_axi_periph_BREADY;
  assign M00_AXI_rready[0] = m00_couplers_to_xdma_0_axi_periph_RREADY;
  assign M00_AXI_wdata[31:0] = m00_couplers_to_xdma_0_axi_periph_WDATA;
  assign M00_AXI_wstrb[3:0] = m00_couplers_to_xdma_0_axi_periph_WSTRB;
  assign M00_AXI_wvalid[0] = m00_couplers_to_xdma_0_axi_periph_WVALID;
  assign M01_ACLK_1 = M01_ACLK;
  assign M01_ARESETN_1 = M01_ARESETN;
  assign M01_AXI_araddr[31:0] = m01_couplers_to_xdma_0_axi_periph_ARADDR;
  assign M01_AXI_arvalid = m01_couplers_to_xdma_0_axi_periph_ARVALID;
  assign M01_AXI_awaddr[31:0] = m01_couplers_to_xdma_0_axi_periph_AWADDR;
  assign M01_AXI_awvalid = m01_couplers_to_xdma_0_axi_periph_AWVALID;
  assign M01_AXI_bready = m01_couplers_to_xdma_0_axi_periph_BREADY;
  assign M01_AXI_rready = m01_couplers_to_xdma_0_axi_periph_RREADY;
  assign M01_AXI_wdata[31:0] = m01_couplers_to_xdma_0_axi_periph_WDATA;
  assign M01_AXI_wvalid = m01_couplers_to_xdma_0_axi_periph_WVALID;
  assign M02_ACLK_1 = M02_ACLK;
  assign M02_ARESETN_1 = M02_ARESETN;
  assign M02_AXI_araddr[7:0] = m02_couplers_to_xdma_0_axi_periph_ARADDR;
  assign M02_AXI_arvalid = m02_couplers_to_xdma_0_axi_periph_ARVALID;
  assign M02_AXI_awaddr[7:0] = m02_couplers_to_xdma_0_axi_periph_AWADDR;
  assign M02_AXI_awvalid = m02_couplers_to_xdma_0_axi_periph_AWVALID;
  assign M02_AXI_bready = m02_couplers_to_xdma_0_axi_periph_BREADY;
  assign M02_AXI_rready = m02_couplers_to_xdma_0_axi_periph_RREADY;
  assign M02_AXI_wdata[31:0] = m02_couplers_to_xdma_0_axi_periph_WDATA;
  assign M02_AXI_wstrb[3:0] = m02_couplers_to_xdma_0_axi_periph_WSTRB;
  assign M02_AXI_wvalid = m02_couplers_to_xdma_0_axi_periph_WVALID;
  assign S00_ACLK_1 = S00_ACLK;
  assign S00_ARESETN_1 = S00_ARESETN;
  assign S00_AXI_arready[0] = xdma_0_axi_periph_to_s00_couplers_ARREADY;
  assign S00_AXI_awready[0] = xdma_0_axi_periph_to_s00_couplers_AWREADY;
  assign S00_AXI_bresp[1:0] = xdma_0_axi_periph_to_s00_couplers_BRESP;
  assign S00_AXI_bvalid[0] = xdma_0_axi_periph_to_s00_couplers_BVALID;
  assign S00_AXI_rdata[31:0] = xdma_0_axi_periph_to_s00_couplers_RDATA;
  assign S00_AXI_rresp[1:0] = xdma_0_axi_periph_to_s00_couplers_RRESP;
  assign S00_AXI_rvalid[0] = xdma_0_axi_periph_to_s00_couplers_RVALID;
  assign S00_AXI_wready[0] = xdma_0_axi_periph_to_s00_couplers_WREADY;
  assign m00_couplers_to_xdma_0_axi_periph_ARREADY = M00_AXI_arready[0];
  assign m00_couplers_to_xdma_0_axi_periph_AWREADY = M00_AXI_awready[0];
  assign m00_couplers_to_xdma_0_axi_periph_BRESP = M00_AXI_bresp[1:0];
  assign m00_couplers_to_xdma_0_axi_periph_BVALID = M00_AXI_bvalid[0];
  assign m00_couplers_to_xdma_0_axi_periph_RDATA = M00_AXI_rdata[31:0];
  assign m00_couplers_to_xdma_0_axi_periph_RRESP = M00_AXI_rresp[1:0];
  assign m00_couplers_to_xdma_0_axi_periph_RVALID = M00_AXI_rvalid[0];
  assign m00_couplers_to_xdma_0_axi_periph_WREADY = M00_AXI_wready[0];
  assign m01_couplers_to_xdma_0_axi_periph_ARREADY = M01_AXI_arready;
  assign m01_couplers_to_xdma_0_axi_periph_AWREADY = M01_AXI_awready;
  assign m01_couplers_to_xdma_0_axi_periph_BRESP = M01_AXI_bresp[1:0];
  assign m01_couplers_to_xdma_0_axi_periph_BVALID = M01_AXI_bvalid;
  assign m01_couplers_to_xdma_0_axi_periph_RDATA = M01_AXI_rdata[31:0];
  assign m01_couplers_to_xdma_0_axi_periph_RRESP = M01_AXI_rresp[1:0];
  assign m01_couplers_to_xdma_0_axi_periph_RVALID = M01_AXI_rvalid;
  assign m01_couplers_to_xdma_0_axi_periph_WREADY = M01_AXI_wready;
  assign m02_couplers_to_xdma_0_axi_periph_ARREADY = M02_AXI_arready;
  assign m02_couplers_to_xdma_0_axi_periph_AWREADY = M02_AXI_awready;
  assign m02_couplers_to_xdma_0_axi_periph_BRESP = M02_AXI_bresp[1:0];
  assign m02_couplers_to_xdma_0_axi_periph_BVALID = M02_AXI_bvalid;
  assign m02_couplers_to_xdma_0_axi_periph_RDATA = M02_AXI_rdata[31:0];
  assign m02_couplers_to_xdma_0_axi_periph_RRESP = M02_AXI_rresp[1:0];
  assign m02_couplers_to_xdma_0_axi_periph_RVALID = M02_AXI_rvalid;
  assign m02_couplers_to_xdma_0_axi_periph_WREADY = M02_AXI_wready;
  assign xdma_0_axi_periph_ACLK_net = ACLK;
  assign xdma_0_axi_periph_ARESETN_net = ARESETN;
  assign xdma_0_axi_periph_to_s00_couplers_ARADDR = S00_AXI_araddr[31:0];
  assign xdma_0_axi_periph_to_s00_couplers_ARPROT = S00_AXI_arprot[2:0];
  assign xdma_0_axi_periph_to_s00_couplers_ARVALID = S00_AXI_arvalid[0];
  assign xdma_0_axi_periph_to_s00_couplers_AWADDR = S00_AXI_awaddr[31:0];
  assign xdma_0_axi_periph_to_s00_couplers_AWPROT = S00_AXI_awprot[2:0];
  assign xdma_0_axi_periph_to_s00_couplers_AWVALID = S00_AXI_awvalid[0];
  assign xdma_0_axi_periph_to_s00_couplers_BREADY = S00_AXI_bready[0];
  assign xdma_0_axi_periph_to_s00_couplers_RREADY = S00_AXI_rready[0];
  assign xdma_0_axi_periph_to_s00_couplers_WDATA = S00_AXI_wdata[31:0];
  assign xdma_0_axi_periph_to_s00_couplers_WSTRB = S00_AXI_wstrb[3:0];
  assign xdma_0_axi_periph_to_s00_couplers_WVALID = S00_AXI_wvalid[0];
  m00_couplers_imp_1AYYKJV m00_couplers
       (.M_ACLK(M00_ACLK_1),
        .M_ARESETN(M00_ARESETN_1),
        .M_AXI_araddr(m00_couplers_to_xdma_0_axi_periph_ARADDR),
        .M_AXI_arready(m00_couplers_to_xdma_0_axi_periph_ARREADY),
        .M_AXI_arvalid(m00_couplers_to_xdma_0_axi_periph_ARVALID),
        .M_AXI_awaddr(m00_couplers_to_xdma_0_axi_periph_AWADDR),
        .M_AXI_awready(m00_couplers_to_xdma_0_axi_periph_AWREADY),
        .M_AXI_awvalid(m00_couplers_to_xdma_0_axi_periph_AWVALID),
        .M_AXI_bready(m00_couplers_to_xdma_0_axi_periph_BREADY),
        .M_AXI_bresp(m00_couplers_to_xdma_0_axi_periph_BRESP),
        .M_AXI_bvalid(m00_couplers_to_xdma_0_axi_periph_BVALID),
        .M_AXI_rdata(m00_couplers_to_xdma_0_axi_periph_RDATA),
        .M_AXI_rready(m00_couplers_to_xdma_0_axi_periph_RREADY),
        .M_AXI_rresp(m00_couplers_to_xdma_0_axi_periph_RRESP),
        .M_AXI_rvalid(m00_couplers_to_xdma_0_axi_periph_RVALID),
        .M_AXI_wdata(m00_couplers_to_xdma_0_axi_periph_WDATA),
        .M_AXI_wready(m00_couplers_to_xdma_0_axi_periph_WREADY),
        .M_AXI_wstrb(m00_couplers_to_xdma_0_axi_periph_WSTRB),
        .M_AXI_wvalid(m00_couplers_to_xdma_0_axi_periph_WVALID),
        .S_ACLK(xdma_0_axi_periph_ACLK_net),
        .S_ARESETN(xdma_0_axi_periph_ARESETN_net),
        .S_AXI_araddr(xbar_to_m00_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m00_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m00_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m00_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m00_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m00_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m00_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m00_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m00_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m00_couplers_RDATA),
        .S_AXI_rready(xbar_to_m00_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m00_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m00_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m00_couplers_WDATA),
        .S_AXI_wready(xbar_to_m00_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m00_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m00_couplers_WVALID));
  m01_couplers_imp_LQFGNW m01_couplers
       (.M_ACLK(M01_ACLK_1),
        .M_ARESETN(M01_ARESETN_1),
        .M_AXI_araddr(m01_couplers_to_xdma_0_axi_periph_ARADDR),
        .M_AXI_arready(m01_couplers_to_xdma_0_axi_periph_ARREADY),
        .M_AXI_arvalid(m01_couplers_to_xdma_0_axi_periph_ARVALID),
        .M_AXI_awaddr(m01_couplers_to_xdma_0_axi_periph_AWADDR),
        .M_AXI_awready(m01_couplers_to_xdma_0_axi_periph_AWREADY),
        .M_AXI_awvalid(m01_couplers_to_xdma_0_axi_periph_AWVALID),
        .M_AXI_bready(m01_couplers_to_xdma_0_axi_periph_BREADY),
        .M_AXI_bresp(m01_couplers_to_xdma_0_axi_periph_BRESP),
        .M_AXI_bvalid(m01_couplers_to_xdma_0_axi_periph_BVALID),
        .M_AXI_rdata(m01_couplers_to_xdma_0_axi_periph_RDATA),
        .M_AXI_rready(m01_couplers_to_xdma_0_axi_periph_RREADY),
        .M_AXI_rresp(m01_couplers_to_xdma_0_axi_periph_RRESP),
        .M_AXI_rvalid(m01_couplers_to_xdma_0_axi_periph_RVALID),
        .M_AXI_wdata(m01_couplers_to_xdma_0_axi_periph_WDATA),
        .M_AXI_wready(m01_couplers_to_xdma_0_axi_periph_WREADY),
        .M_AXI_wvalid(m01_couplers_to_xdma_0_axi_periph_WVALID),
        .S_ACLK(xdma_0_axi_periph_ACLK_net),
        .S_ARESETN(xdma_0_axi_periph_ARESETN_net),
        .S_AXI_araddr(xbar_to_m01_couplers_ARADDR),
        .S_AXI_arprot(xbar_to_m01_couplers_ARPROT),
        .S_AXI_arready(xbar_to_m01_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m01_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m01_couplers_AWADDR),
        .S_AXI_awprot(xbar_to_m01_couplers_AWPROT),
        .S_AXI_awready(xbar_to_m01_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m01_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m01_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m01_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m01_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m01_couplers_RDATA),
        .S_AXI_rready(xbar_to_m01_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m01_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m01_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m01_couplers_WDATA),
        .S_AXI_wready(xbar_to_m01_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m01_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m01_couplers_WVALID));
  m02_couplers_imp_1G607VO m02_couplers
       (.M_ACLK(M02_ACLK_1),
        .M_ARESETN(M02_ARESETN_1),
        .M_AXI_araddr(m02_couplers_to_xdma_0_axi_periph_ARADDR),
        .M_AXI_arready(m02_couplers_to_xdma_0_axi_periph_ARREADY),
        .M_AXI_arvalid(m02_couplers_to_xdma_0_axi_periph_ARVALID),
        .M_AXI_awaddr(m02_couplers_to_xdma_0_axi_periph_AWADDR),
        .M_AXI_awready(m02_couplers_to_xdma_0_axi_periph_AWREADY),
        .M_AXI_awvalid(m02_couplers_to_xdma_0_axi_periph_AWVALID),
        .M_AXI_bready(m02_couplers_to_xdma_0_axi_periph_BREADY),
        .M_AXI_bresp(m02_couplers_to_xdma_0_axi_periph_BRESP),
        .M_AXI_bvalid(m02_couplers_to_xdma_0_axi_periph_BVALID),
        .M_AXI_rdata(m02_couplers_to_xdma_0_axi_periph_RDATA),
        .M_AXI_rready(m02_couplers_to_xdma_0_axi_periph_RREADY),
        .M_AXI_rresp(m02_couplers_to_xdma_0_axi_periph_RRESP),
        .M_AXI_rvalid(m02_couplers_to_xdma_0_axi_periph_RVALID),
        .M_AXI_wdata(m02_couplers_to_xdma_0_axi_periph_WDATA),
        .M_AXI_wready(m02_couplers_to_xdma_0_axi_periph_WREADY),
        .M_AXI_wstrb(m02_couplers_to_xdma_0_axi_periph_WSTRB),
        .M_AXI_wvalid(m02_couplers_to_xdma_0_axi_periph_WVALID),
        .S_ACLK(xdma_0_axi_periph_ACLK_net),
        .S_ARESETN(xdma_0_axi_periph_ARESETN_net),
        .S_AXI_araddr(xbar_to_m02_couplers_ARADDR),
        .S_AXI_arprot(xbar_to_m02_couplers_ARPROT),
        .S_AXI_arready(xbar_to_m02_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m02_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m02_couplers_AWADDR),
        .S_AXI_awprot(xbar_to_m02_couplers_AWPROT),
        .S_AXI_awready(xbar_to_m02_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m02_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m02_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m02_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m02_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m02_couplers_RDATA),
        .S_AXI_rready(xbar_to_m02_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m02_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m02_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m02_couplers_WDATA),
        .S_AXI_wready(xbar_to_m02_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m02_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m02_couplers_WVALID));
  s00_couplers_imp_1FM3V25 s00_couplers
       (.M_ACLK(xdma_0_axi_periph_ACLK_net),
        .M_ARESETN(xdma_0_axi_periph_ARESETN_net),
        .M_AXI_araddr(s00_couplers_to_xbar_ARADDR),
        .M_AXI_arprot(s00_couplers_to_xbar_ARPROT),
        .M_AXI_arready(s00_couplers_to_xbar_ARREADY),
        .M_AXI_arvalid(s00_couplers_to_xbar_ARVALID),
        .M_AXI_awaddr(s00_couplers_to_xbar_AWADDR),
        .M_AXI_awprot(s00_couplers_to_xbar_AWPROT),
        .M_AXI_awready(s00_couplers_to_xbar_AWREADY),
        .M_AXI_awvalid(s00_couplers_to_xbar_AWVALID),
        .M_AXI_bready(s00_couplers_to_xbar_BREADY),
        .M_AXI_bresp(s00_couplers_to_xbar_BRESP),
        .M_AXI_bvalid(s00_couplers_to_xbar_BVALID),
        .M_AXI_rdata(s00_couplers_to_xbar_RDATA),
        .M_AXI_rready(s00_couplers_to_xbar_RREADY),
        .M_AXI_rresp(s00_couplers_to_xbar_RRESP),
        .M_AXI_rvalid(s00_couplers_to_xbar_RVALID),
        .M_AXI_wdata(s00_couplers_to_xbar_WDATA),
        .M_AXI_wready(s00_couplers_to_xbar_WREADY),
        .M_AXI_wstrb(s00_couplers_to_xbar_WSTRB),
        .M_AXI_wvalid(s00_couplers_to_xbar_WVALID),
        .S_ACLK(S00_ACLK_1),
        .S_ARESETN(S00_ARESETN_1),
        .S_AXI_araddr(xdma_0_axi_periph_to_s00_couplers_ARADDR),
        .S_AXI_arprot(xdma_0_axi_periph_to_s00_couplers_ARPROT),
        .S_AXI_arready(xdma_0_axi_periph_to_s00_couplers_ARREADY),
        .S_AXI_arvalid(xdma_0_axi_periph_to_s00_couplers_ARVALID),
        .S_AXI_awaddr(xdma_0_axi_periph_to_s00_couplers_AWADDR),
        .S_AXI_awprot(xdma_0_axi_periph_to_s00_couplers_AWPROT),
        .S_AXI_awready(xdma_0_axi_periph_to_s00_couplers_AWREADY),
        .S_AXI_awvalid(xdma_0_axi_periph_to_s00_couplers_AWVALID),
        .S_AXI_bready(xdma_0_axi_periph_to_s00_couplers_BREADY),
        .S_AXI_bresp(xdma_0_axi_periph_to_s00_couplers_BRESP),
        .S_AXI_bvalid(xdma_0_axi_periph_to_s00_couplers_BVALID),
        .S_AXI_rdata(xdma_0_axi_periph_to_s00_couplers_RDATA),
        .S_AXI_rready(xdma_0_axi_periph_to_s00_couplers_RREADY),
        .S_AXI_rresp(xdma_0_axi_periph_to_s00_couplers_RRESP),
        .S_AXI_rvalid(xdma_0_axi_periph_to_s00_couplers_RVALID),
        .S_AXI_wdata(xdma_0_axi_periph_to_s00_couplers_WDATA),
        .S_AXI_wready(xdma_0_axi_periph_to_s00_couplers_WREADY),
        .S_AXI_wstrb(xdma_0_axi_periph_to_s00_couplers_WSTRB),
        .S_AXI_wvalid(xdma_0_axi_periph_to_s00_couplers_WVALID));
  bd_eth10_capture_xbar_0 xbar
       (.aclk(xdma_0_axi_periph_ACLK_net),
        .aresetn(xdma_0_axi_periph_ARESETN_net),
        .m_axi_araddr({xbar_to_m02_couplers_ARADDR,xbar_to_m01_couplers_ARADDR,xbar_to_m00_couplers_ARADDR}),
        .m_axi_arprot({xbar_to_m02_couplers_ARPROT,xbar_to_m01_couplers_ARPROT,NLW_xbar_m_axi_arprot_UNCONNECTED[2:0]}),
        .m_axi_arready({xbar_to_m02_couplers_ARREADY,xbar_to_m01_couplers_ARREADY,xbar_to_m00_couplers_ARREADY}),
        .m_axi_arvalid({xbar_to_m02_couplers_ARVALID,xbar_to_m01_couplers_ARVALID,xbar_to_m00_couplers_ARVALID}),
        .m_axi_awaddr({xbar_to_m02_couplers_AWADDR,xbar_to_m01_couplers_AWADDR,xbar_to_m00_couplers_AWADDR}),
        .m_axi_awprot({xbar_to_m02_couplers_AWPROT,xbar_to_m01_couplers_AWPROT,NLW_xbar_m_axi_awprot_UNCONNECTED[2:0]}),
        .m_axi_awready({xbar_to_m02_couplers_AWREADY,xbar_to_m01_couplers_AWREADY,xbar_to_m00_couplers_AWREADY}),
        .m_axi_awvalid({xbar_to_m02_couplers_AWVALID,xbar_to_m01_couplers_AWVALID,xbar_to_m00_couplers_AWVALID}),
        .m_axi_bready({xbar_to_m02_couplers_BREADY,xbar_to_m01_couplers_BREADY,xbar_to_m00_couplers_BREADY}),
        .m_axi_bresp({xbar_to_m02_couplers_BRESP,xbar_to_m01_couplers_BRESP,xbar_to_m00_couplers_BRESP}),
        .m_axi_bvalid({xbar_to_m02_couplers_BVALID,xbar_to_m01_couplers_BVALID,xbar_to_m00_couplers_BVALID}),
        .m_axi_rdata({xbar_to_m02_couplers_RDATA,xbar_to_m01_couplers_RDATA,xbar_to_m00_couplers_RDATA}),
        .m_axi_rready({xbar_to_m02_couplers_RREADY,xbar_to_m01_couplers_RREADY,xbar_to_m00_couplers_RREADY}),
        .m_axi_rresp({xbar_to_m02_couplers_RRESP,xbar_to_m01_couplers_RRESP,xbar_to_m00_couplers_RRESP}),
        .m_axi_rvalid({xbar_to_m02_couplers_RVALID,xbar_to_m01_couplers_RVALID,xbar_to_m00_couplers_RVALID}),
        .m_axi_wdata({xbar_to_m02_couplers_WDATA,xbar_to_m01_couplers_WDATA,xbar_to_m00_couplers_WDATA}),
        .m_axi_wready({xbar_to_m02_couplers_WREADY,xbar_to_m01_couplers_WREADY,xbar_to_m00_couplers_WREADY}),
        .m_axi_wstrb({xbar_to_m02_couplers_WSTRB,xbar_to_m01_couplers_WSTRB,xbar_to_m00_couplers_WSTRB}),
        .m_axi_wvalid({xbar_to_m02_couplers_WVALID,xbar_to_m01_couplers_WVALID,xbar_to_m00_couplers_WVALID}),
        .s_axi_araddr(s00_couplers_to_xbar_ARADDR),
        .s_axi_arprot(s00_couplers_to_xbar_ARPROT),
        .s_axi_arready(s00_couplers_to_xbar_ARREADY),
        .s_axi_arvalid(s00_couplers_to_xbar_ARVALID),
        .s_axi_awaddr(s00_couplers_to_xbar_AWADDR),
        .s_axi_awprot(s00_couplers_to_xbar_AWPROT),
        .s_axi_awready(s00_couplers_to_xbar_AWREADY),
        .s_axi_awvalid(s00_couplers_to_xbar_AWVALID),
        .s_axi_bready(s00_couplers_to_xbar_BREADY),
        .s_axi_bresp(s00_couplers_to_xbar_BRESP),
        .s_axi_bvalid(s00_couplers_to_xbar_BVALID),
        .s_axi_rdata(s00_couplers_to_xbar_RDATA),
        .s_axi_rready(s00_couplers_to_xbar_RREADY),
        .s_axi_rresp(s00_couplers_to_xbar_RRESP),
        .s_axi_rvalid(s00_couplers_to_xbar_RVALID),
        .s_axi_wdata(s00_couplers_to_xbar_WDATA),
        .s_axi_wready(s00_couplers_to_xbar_WREADY),
        .s_axi_wstrb(s00_couplers_to_xbar_WSTRB),
        .s_axi_wvalid(s00_couplers_to_xbar_WVALID));
endmodule

module eth10_capt_ctrl_imp_1T6HTOG
   (CAP_CNT,
    CAP_DELIM,
    CAP_PKT,
    CAP_WCMD,
    CAP_WDATA,
    CAP_WORDCNT,
    CLEAR_ERR,
    CLK,
    CLOCK_CNT,
    ERR_DELIM,
    ERR_FCS,
    ERR_FULL,
    ERR_LONG,
    ERR_S2MM,
    ERR_STS,
    ERR_WCMD,
    KEEP_ERROR_PACKET,
    RESETN,
    TEST_GAP_SIZE,
    TEST_PKT,
    TEST_PKT_SIZE,
    WADDR_POST,
    WADDR_PRE,
    s_axi_AXILiteS_araddr,
    s_axi_AXILiteS_arready,
    s_axi_AXILiteS_arvalid,
    s_axi_AXILiteS_awaddr,
    s_axi_AXILiteS_awready,
    s_axi_AXILiteS_awvalid,
    s_axi_AXILiteS_bready,
    s_axi_AXILiteS_bresp,
    s_axi_AXILiteS_bvalid,
    s_axi_AXILiteS_rdata,
    s_axi_AXILiteS_rready,
    s_axi_AXILiteS_rresp,
    s_axi_AXILiteS_rvalid,
    s_axi_AXILiteS_wdata,
    s_axi_AXILiteS_wready,
    s_axi_AXILiteS_wstrb,
    s_axi_AXILiteS_wvalid);
  input [3:0]CAP_CNT;
  input [3:0]CAP_DELIM;
  input [11:0]CAP_PKT;
  input [3:0]CAP_WCMD;
  input [14:0]CAP_WDATA;
  input [4:0]CAP_WORDCNT;
  output CLEAR_ERR;
  input CLK;
  output [63:0]CLOCK_CNT;
  input ERR_DELIM;
  input [7:0]ERR_FCS;
  input [7:0]ERR_FULL;
  input [7:0]ERR_LONG;
  input ERR_S2MM;
  input [7:0]ERR_STS;
  input [1:0]ERR_WCMD;
  output KEEP_ERROR_PACKET;
  input RESETN;
  output [15:0]TEST_GAP_SIZE;
  output TEST_PKT;
  output [15:0]TEST_PKT_SIZE;
  input [63:0]WADDR_POST;
  input [63:0]WADDR_PRE;
  input [7:0]s_axi_AXILiteS_araddr;
  output s_axi_AXILiteS_arready;
  input s_axi_AXILiteS_arvalid;
  input [7:0]s_axi_AXILiteS_awaddr;
  output s_axi_AXILiteS_awready;
  input s_axi_AXILiteS_awvalid;
  input s_axi_AXILiteS_bready;
  output [1:0]s_axi_AXILiteS_bresp;
  output s_axi_AXILiteS_bvalid;
  output [31:0]s_axi_AXILiteS_rdata;
  input s_axi_AXILiteS_rready;
  output [1:0]s_axi_AXILiteS_rresp;
  output s_axi_AXILiteS_rvalid;
  input [31:0]s_axi_AXILiteS_wdata;
  output s_axi_AXILiteS_wready;
  input [3:0]s_axi_AXILiteS_wstrb;
  input s_axi_AXILiteS_wvalid;

  wire [3:0]CAP_CNT_1;
  wire [3:0]CAP_DELIM_1;
  wire [11:0]CAP_PKT_1;
  wire [3:0]CAP_WCMD_1;
  wire [14:0]CAP_WDATA_1;
  wire [4:0]CAP_WORDCNT_1;
  wire CLK_1;
  wire [7:0]Conn1_ARADDR;
  wire Conn1_ARREADY;
  wire Conn1_ARVALID;
  wire [7:0]Conn1_AWADDR;
  wire Conn1_AWREADY;
  wire Conn1_AWVALID;
  wire Conn1_BREADY;
  wire [1:0]Conn1_BRESP;
  wire Conn1_BVALID;
  wire [31:0]Conn1_RDATA;
  wire Conn1_RREADY;
  wire [1:0]Conn1_RRESP;
  wire Conn1_RVALID;
  wire [31:0]Conn1_WDATA;
  wire Conn1_WREADY;
  wire [3:0]Conn1_WSTRB;
  wire Conn1_WVALID;
  wire ERR_DELIM_1;
  wire [7:0]ERR_FCS_1;
  wire [7:0]ERR_FULL_1;
  wire [7:0]ERR_LONG_1;
  wire ERR_S2MM_1;
  wire [7:0]ERR_STS_1;
  wire [1:0]ERR_WCMD_1;
  wire RESETN_1;
  wire [63:0]WADDR_POST_1;
  wire [63:0]WADDR_PRE_1;
  wire [7:0]axilite_regs_0_RD_ADDR;
  wire axilite_regs_0_RD_ADDR_EN;
  wire [7:0]axilite_regs_0_WR_ADDR;
  wire [31:0]axilite_regs_0_WR_DATA;
  wire axilite_regs_0_WR_EN;
  wire rx_wrmem_regs_0_CLEAR_ERR;
  wire [63:0]rx_wrmem_regs_0_CLOCK_CNT;
  wire rx_wrmem_regs_0_KEEP_ERROR_PACKET;
  wire [31:0]rx_wrmem_regs_0_RD_DATA;
  wire rx_wrmem_regs_0_RD_DATA_EN;
  wire [15:0]rx_wrmem_regs_0_TEST_GAP_SIZE;
  wire rx_wrmem_regs_0_TEST_PKT;
  wire [15:0]rx_wrmem_regs_0_TEST_PKT_SIZE;
  wire [0:0]vio_0_probe_out0;
  wire [0:0]vio_0_probe_out1;
  wire [15:0]vio_0_probe_out2;
  wire [15:0]vio_0_probe_out3;
  wire [0:0]vio_0_probe_out4;

  assign CAP_CNT_1 = CAP_CNT[3:0];
  assign CAP_DELIM_1 = CAP_DELIM[3:0];
  assign CAP_PKT_1 = CAP_PKT[11:0];
  assign CAP_WCMD_1 = CAP_WCMD[3:0];
  assign CAP_WDATA_1 = CAP_WDATA[14:0];
  assign CAP_WORDCNT_1 = CAP_WORDCNT[4:0];
  assign CLEAR_ERR = rx_wrmem_regs_0_CLEAR_ERR;
  assign CLK_1 = CLK;
  assign CLOCK_CNT[63:0] = rx_wrmem_regs_0_CLOCK_CNT;
  assign Conn1_ARADDR = s_axi_AXILiteS_araddr[7:0];
  assign Conn1_ARVALID = s_axi_AXILiteS_arvalid;
  assign Conn1_AWADDR = s_axi_AXILiteS_awaddr[7:0];
  assign Conn1_AWVALID = s_axi_AXILiteS_awvalid;
  assign Conn1_BREADY = s_axi_AXILiteS_bready;
  assign Conn1_RREADY = s_axi_AXILiteS_rready;
  assign Conn1_WDATA = s_axi_AXILiteS_wdata[31:0];
  assign Conn1_WSTRB = s_axi_AXILiteS_wstrb[3:0];
  assign Conn1_WVALID = s_axi_AXILiteS_wvalid;
  assign ERR_DELIM_1 = ERR_DELIM;
  assign ERR_FCS_1 = ERR_FCS[7:0];
  assign ERR_FULL_1 = ERR_FULL[7:0];
  assign ERR_LONG_1 = ERR_LONG[7:0];
  assign ERR_S2MM_1 = ERR_S2MM;
  assign ERR_STS_1 = ERR_STS[7:0];
  assign ERR_WCMD_1 = ERR_WCMD[1:0];
  assign KEEP_ERROR_PACKET = rx_wrmem_regs_0_KEEP_ERROR_PACKET;
  assign RESETN_1 = RESETN;
  assign TEST_GAP_SIZE[15:0] = rx_wrmem_regs_0_TEST_GAP_SIZE;
  assign TEST_PKT = rx_wrmem_regs_0_TEST_PKT;
  assign TEST_PKT_SIZE[15:0] = rx_wrmem_regs_0_TEST_PKT_SIZE;
  assign WADDR_POST_1 = WADDR_POST[63:0];
  assign WADDR_PRE_1 = WADDR_PRE[63:0];
  assign s_axi_AXILiteS_arready = Conn1_ARREADY;
  assign s_axi_AXILiteS_awready = Conn1_AWREADY;
  assign s_axi_AXILiteS_bresp[1:0] = Conn1_BRESP;
  assign s_axi_AXILiteS_bvalid = Conn1_BVALID;
  assign s_axi_AXILiteS_rdata[31:0] = Conn1_RDATA;
  assign s_axi_AXILiteS_rresp[1:0] = Conn1_RRESP;
  assign s_axi_AXILiteS_rvalid = Conn1_RVALID;
  assign s_axi_AXILiteS_wready = Conn1_WREADY;
  bd_eth10_capture_axilite_regs_0_0 axilite_regs_0
       (.CLK(CLK_1),
        .RD_ADDR(axilite_regs_0_RD_ADDR),
        .RD_ADDR_EN(axilite_regs_0_RD_ADDR_EN),
        .RD_DATA(rx_wrmem_regs_0_RD_DATA),
        .RD_DATA_EN(rx_wrmem_regs_0_RD_DATA_EN),
        .RESETN(RESETN_1),
        .WR_ADDR(axilite_regs_0_WR_ADDR),
        .WR_DATA(axilite_regs_0_WR_DATA),
        .WR_EN(axilite_regs_0_WR_EN),
        .s_axi_AXILiteS_ARADDR(Conn1_ARADDR),
        .s_axi_AXILiteS_ARREADY(Conn1_ARREADY),
        .s_axi_AXILiteS_ARVALID(Conn1_ARVALID),
        .s_axi_AXILiteS_AWADDR(Conn1_AWADDR),
        .s_axi_AXILiteS_AWREADY(Conn1_AWREADY),
        .s_axi_AXILiteS_AWVALID(Conn1_AWVALID),
        .s_axi_AXILiteS_BREADY(Conn1_BREADY),
        .s_axi_AXILiteS_BRESP(Conn1_BRESP),
        .s_axi_AXILiteS_BVALID(Conn1_BVALID),
        .s_axi_AXILiteS_RDATA(Conn1_RDATA),
        .s_axi_AXILiteS_RREADY(Conn1_RREADY),
        .s_axi_AXILiteS_RRESP(Conn1_RRESP),
        .s_axi_AXILiteS_RVALID(Conn1_RVALID),
        .s_axi_AXILiteS_WDATA(Conn1_WDATA),
        .s_axi_AXILiteS_WREADY(Conn1_WREADY),
        .s_axi_AXILiteS_WSTRB(Conn1_WSTRB),
        .s_axi_AXILiteS_WVALID(Conn1_WVALID));
  bd_eth10_capture_rx_wrmem_regs_0_0 rx_wrmem_regs_0
       (.CAP_CNT(CAP_CNT_1),
        .CAP_DELIM(CAP_DELIM_1),
        .CAP_PKT(CAP_PKT_1),
        .CAP_WCMD(CAP_WCMD_1),
        .CAP_WDATA(CAP_WDATA_1),
        .CAP_WORDCNT(CAP_WORDCNT_1),
        .CLEAR_ERR(rx_wrmem_regs_0_CLEAR_ERR),
        .CLK(CLK_1),
        .CLOCK_CNT(rx_wrmem_regs_0_CLOCK_CNT),
        .ERR_DELIM(ERR_DELIM_1),
        .ERR_FCS(ERR_FCS_1),
        .ERR_FULL(ERR_FULL_1),
        .ERR_LONG(ERR_LONG_1),
        .ERR_S2MM(ERR_S2MM_1),
        .ERR_STS(ERR_STS_1),
        .ERR_WCMD(ERR_WCMD_1[0]),
        .KEEP_ERROR_PACKET(rx_wrmem_regs_0_KEEP_ERROR_PACKET),
        .RD_ADDR(axilite_regs_0_RD_ADDR),
        .RD_ADDR_EN(axilite_regs_0_RD_ADDR_EN),
        .RD_DATA(rx_wrmem_regs_0_RD_DATA),
        .RD_DATA_EN(rx_wrmem_regs_0_RD_DATA_EN),
        .RESETN(RESETN_1),
        .TEST_GAP_SIZE(rx_wrmem_regs_0_TEST_GAP_SIZE),
        .TEST_PKT(rx_wrmem_regs_0_TEST_PKT),
        .TEST_PKT_SIZE(rx_wrmem_regs_0_TEST_PKT_SIZE),
        .VIO_CLEAR(vio_0_probe_out0),
        .VIO_GAP_SIZE(vio_0_probe_out3),
        .VIO_KEEP_ERROR_PACKET(vio_0_probe_out4),
        .VIO_PKT(vio_0_probe_out1),
        .VIO_PKT_SIZE(vio_0_probe_out2),
        .WADDR_POST(WADDR_POST_1),
        .WADDR_PRE(WADDR_PRE_1),
        .WR_ADDR(axilite_regs_0_WR_ADDR),
        .WR_DATA(axilite_regs_0_WR_DATA),
        .WR_EN(axilite_regs_0_WR_EN));
  bd_eth10_capture_vio_0_0 vio_0
       (.clk(CLK_1),
        .probe_out0(vio_0_probe_out0),
        .probe_out1(vio_0_probe_out1),
        .probe_out2(vio_0_probe_out2),
        .probe_out3(vio_0_probe_out3),
        .probe_out4(vio_0_probe_out4));
endmodule

module eth_0_imp_1FPILL0
   (DBG_CLK,
    DEBUG_OUT,
    FCS_CORRECT,
    FCS_EN,
    GAPLEN,
    MGTCLK0_clk_n,
    MGTCLK0_clk_p,
    PKTLEN,
    RXD,
    RXLEN,
    SFP1_RX_N,
    SFP1_RX_P,
    SFP1_TX_N,
    SFP1_TX_P,
    STARTBTN,
    areset_coreclk_out,
    areset_datapathclk_out,
    coreclk_out,
    dclk,
    gtrxreset_out,
    gttxreset_out,
    qpll0lock_out,
    qpll0outclk_out,
    qpll0outrefclk_out,
    reset,
    reset_counter_done_out,
    txuserrdy_out,
    txusrclk2_out,
    txusrclk_out);
  output DBG_CLK;
  output [1:0]DEBUG_OUT;
  output FCS_CORRECT;
  output FCS_EN;
  input [15:0]GAPLEN;
  input MGTCLK0_clk_n;
  input MGTCLK0_clk_p;
  input [15:0]PKTLEN;
  output [63:0]RXD;
  output [3:0]RXLEN;
  input SFP1_RX_N;
  input SFP1_RX_P;
  output SFP1_TX_N;
  output SFP1_TX_P;
  input STARTBTN;
  output areset_coreclk_out;
  output areset_datapathclk_out;
  output coreclk_out;
  input dclk;
  output gtrxreset_out;
  output gttxreset_out;
  output qpll0lock_out;
  output qpll0outclk_out;
  output qpll0outrefclk_out;
  input reset;
  output reset_counter_done_out;
  output txuserrdy_out;
  output txusrclk2_out;
  output txusrclk_out;

  wire CLK_1;
  wire Conn1_CLK_N;
  wire Conn1_CLK_P;
  wire [15:0]GAPLEN_0_1;
  wire [15:0]PKTLEN_0_1;
  wire SFP1_RX_N_1;
  wire SFP1_RX_P_1;
  wire STARTBTN_0_1;
  wire [31:0]address_mac_ip_0_IP_ADDR;
  wire [47:0]address_mac_ip_0_MAC_ADDR;
  wire dclk_1;
  wire eth_ctrl_0_clken;
  wire eth_ctrl_0_mdc;
  wire eth_ctrl_0_mdio_w;
  wire [2:0]eth_ctrl_0_pma_pmd_type;
  wire [4:0]eth_ctrl_0_prtad;
  wire eth_ctrl_0_signal_detect;
  wire eth_ctrl_0_sim_speedup_control;
  wire eth_ctrl_0_tx_fault;
  wire reset_2;
  wire ten_gig_eth_pcs_pma_0_areset_coreclk_out;
  wire ten_gig_eth_pcs_pma_0_areset_datapathclk_out;
  wire [15:0]ten_gig_eth_pcs_pma_0_core_to_gt_drp_DADDR;
  wire ten_gig_eth_pcs_pma_0_core_to_gt_drp_DEN;
  wire [15:0]ten_gig_eth_pcs_pma_0_core_to_gt_drp_DI;
  wire [15:0]ten_gig_eth_pcs_pma_0_core_to_gt_drp_DO;
  wire ten_gig_eth_pcs_pma_0_core_to_gt_drp_DRDY;
  wire ten_gig_eth_pcs_pma_0_core_to_gt_drp_DWE;
  wire ten_gig_eth_pcs_pma_0_coreclk_out;
  wire ten_gig_eth_pcs_pma_0_drp_req;
  wire ten_gig_eth_pcs_pma_0_gtrxreset_out;
  wire ten_gig_eth_pcs_pma_0_gttxreset_out;
  wire ten_gig_eth_pcs_pma_0_qpll0lock_out;
  wire ten_gig_eth_pcs_pma_0_qpll0outclk_out;
  wire ten_gig_eth_pcs_pma_0_qpll0outrefclk_out;
  wire ten_gig_eth_pcs_pma_0_reset_counter_done_out;
  wire ten_gig_eth_pcs_pma_0_rxrecclk_out;
  wire ten_gig_eth_pcs_pma_0_txn;
  wire ten_gig_eth_pcs_pma_0_txp;
  wire ten_gig_eth_pcs_pma_0_txuserrdy_out;
  wire ten_gig_eth_pcs_pma_0_txusrclk_out;
  wire [7:0]ten_gig_eth_pcs_pma_0_xgmii_rxc;
  wire [7:0]ten_gig_eth_pcs_pma_0_xgmii_rxc1;
  wire [63:0]ten_gig_eth_pcs_pma_0_xgmii_rxd;
  wire [63:0]ten_gig_eth_pcs_pma_0_xgmii_rxd1;
  wire [1:0]xgmii_fcs_0_DEBUG_ALIGN;
  wire xgmii_fcs_0_FCS_CORRECT;
  wire xgmii_fcs_0_FCS_EN;
  wire [63:0]xgmii_fcs_0_RXD_OUT;
  wire [3:0]xgmii_fcs_0_RXLEN_OUT;
  wire [7:0]xgmii_fcs_0_XGMII_TXC;
  wire [63:0]xgmii_fcs_0_XGMII_TXD;
  wire [63:0]xgmii_test_server_0_TXD_OUT;
  wire [3:0]xgmii_test_server_0_TXLEN_OUT;
  wire [0:0]xlconstant_0_dout;

  assign Conn1_CLK_N = MGTCLK0_clk_n;
  assign Conn1_CLK_P = MGTCLK0_clk_p;
  assign DBG_CLK = ten_gig_eth_pcs_pma_0_rxrecclk_out;
  assign DEBUG_OUT[1:0] = xgmii_fcs_0_DEBUG_ALIGN;
  assign FCS_CORRECT = xgmii_fcs_0_FCS_CORRECT;
  assign FCS_EN = xgmii_fcs_0_FCS_EN;
  assign GAPLEN_0_1 = GAPLEN[15:0];
  assign PKTLEN_0_1 = PKTLEN[15:0];
  assign RXD[63:0] = xgmii_fcs_0_RXD_OUT;
  assign RXLEN[3:0] = xgmii_fcs_0_RXLEN_OUT;
  assign SFP1_RX_N_1 = SFP1_RX_N;
  assign SFP1_RX_P_1 = SFP1_RX_P;
  assign SFP1_TX_N = ten_gig_eth_pcs_pma_0_txn;
  assign SFP1_TX_P = ten_gig_eth_pcs_pma_0_txp;
  assign STARTBTN_0_1 = STARTBTN;
  assign areset_coreclk_out = ten_gig_eth_pcs_pma_0_areset_coreclk_out;
  assign areset_datapathclk_out = ten_gig_eth_pcs_pma_0_areset_datapathclk_out;
  assign coreclk_out = ten_gig_eth_pcs_pma_0_coreclk_out;
  assign dclk_1 = dclk;
  assign gtrxreset_out = ten_gig_eth_pcs_pma_0_gtrxreset_out;
  assign gttxreset_out = ten_gig_eth_pcs_pma_0_gttxreset_out;
  assign qpll0lock_out = ten_gig_eth_pcs_pma_0_qpll0lock_out;
  assign qpll0outclk_out = ten_gig_eth_pcs_pma_0_qpll0outclk_out;
  assign qpll0outrefclk_out = ten_gig_eth_pcs_pma_0_qpll0outrefclk_out;
  assign reset_2 = reset;
  assign reset_counter_done_out = ten_gig_eth_pcs_pma_0_reset_counter_done_out;
  assign txuserrdy_out = ten_gig_eth_pcs_pma_0_txuserrdy_out;
  assign txusrclk2_out = CLK_1;
  assign txusrclk_out = ten_gig_eth_pcs_pma_0_txusrclk_out;
  bd_eth10_capture_address_mac_ip_0_0 address_mac_ip_0
       (.IP_ADDR(address_mac_ip_0_IP_ADDR),
        .MAC_ADDR(address_mac_ip_0_MAC_ADDR));
  bd_eth10_capture_eth_ctrl_0_0 eth_ctrl_0
       (.clken(eth_ctrl_0_clken),
        .mdc(eth_ctrl_0_mdc),
        .mdio_w(eth_ctrl_0_mdio_w),
        .pma_pmd_type(eth_ctrl_0_pma_pmd_type),
        .prtad(eth_ctrl_0_prtad),
        .rx_loss(xlconstant_0_dout),
        .signal_detect(eth_ctrl_0_signal_detect),
        .sim_speedup_control(eth_ctrl_0_sim_speedup_control),
        .tx_fault(eth_ctrl_0_tx_fault));
  bd_eth10_capture_system_ila_0_0 system_ila_0
       (.clk(CLK_1),
        .probe0(ten_gig_eth_pcs_pma_0_xgmii_rxc),
        .probe1(ten_gig_eth_pcs_pma_0_xgmii_rxd),
        .probe2(xgmii_fcs_0_RXLEN_OUT),
        .probe3(xgmii_fcs_0_RXD_OUT),
        .probe4(xgmii_fcs_0_FCS_EN),
        .probe5(xgmii_fcs_0_FCS_CORRECT));
  bd_eth10_capture_ten_gig_eth_pcs_pma_0_0 ten_gig_eth_pcs_pma_0
       (.areset_coreclk_out(ten_gig_eth_pcs_pma_0_areset_coreclk_out),
        .areset_datapathclk_out(ten_gig_eth_pcs_pma_0_areset_datapathclk_out),
        .core_to_gt_drpaddr(ten_gig_eth_pcs_pma_0_core_to_gt_drp_DADDR),
        .core_to_gt_drpdi(ten_gig_eth_pcs_pma_0_core_to_gt_drp_DI),
        .core_to_gt_drpdo(ten_gig_eth_pcs_pma_0_core_to_gt_drp_DO),
        .core_to_gt_drpen(ten_gig_eth_pcs_pma_0_core_to_gt_drp_DEN),
        .core_to_gt_drprdy(ten_gig_eth_pcs_pma_0_core_to_gt_drp_DRDY),
        .core_to_gt_drpwe(ten_gig_eth_pcs_pma_0_core_to_gt_drp_DWE),
        .coreclk_out(ten_gig_eth_pcs_pma_0_coreclk_out),
        .dclk(dclk_1),
        .drp_gnt(ten_gig_eth_pcs_pma_0_drp_req),
        .drp_req(ten_gig_eth_pcs_pma_0_drp_req),
        .gt_drpaddr(ten_gig_eth_pcs_pma_0_core_to_gt_drp_DADDR),
        .gt_drpdi(ten_gig_eth_pcs_pma_0_core_to_gt_drp_DI),
        .gt_drpdo(ten_gig_eth_pcs_pma_0_core_to_gt_drp_DO),
        .gt_drpen(ten_gig_eth_pcs_pma_0_core_to_gt_drp_DEN),
        .gt_drprdy(ten_gig_eth_pcs_pma_0_core_to_gt_drp_DRDY),
        .gt_drpwe(ten_gig_eth_pcs_pma_0_core_to_gt_drp_DWE),
        .gtrxreset_out(ten_gig_eth_pcs_pma_0_gtrxreset_out),
        .gttxreset_out(ten_gig_eth_pcs_pma_0_gttxreset_out),
        .mdc(eth_ctrl_0_mdc),
        .mdio_in(eth_ctrl_0_mdio_w),
        .pma_pmd_type(eth_ctrl_0_pma_pmd_type),
        .prtad(eth_ctrl_0_prtad),
        .qpll0lock_out(ten_gig_eth_pcs_pma_0_qpll0lock_out),
        .qpll0outclk_out(ten_gig_eth_pcs_pma_0_qpll0outclk_out),
        .qpll0outrefclk_out(ten_gig_eth_pcs_pma_0_qpll0outrefclk_out),
        .refclk_n(Conn1_CLK_N),
        .refclk_p(Conn1_CLK_P),
        .reset(reset_2),
        .reset_counter_done_out(ten_gig_eth_pcs_pma_0_reset_counter_done_out),
        .rxn(SFP1_RX_N_1),
        .rxp(SFP1_RX_P_1),
        .rxrecclk_out(ten_gig_eth_pcs_pma_0_rxrecclk_out),
        .signal_detect(eth_ctrl_0_signal_detect),
        .sim_speedup_control(eth_ctrl_0_sim_speedup_control),
        .tx_fault(eth_ctrl_0_tx_fault),
        .txn(ten_gig_eth_pcs_pma_0_txn),
        .txp(ten_gig_eth_pcs_pma_0_txp),
        .txuserrdy_out(ten_gig_eth_pcs_pma_0_txuserrdy_out),
        .txusrclk2_out(CLK_1),
        .txusrclk_out(ten_gig_eth_pcs_pma_0_txusrclk_out),
        .xgmii_rxc(ten_gig_eth_pcs_pma_0_xgmii_rxc1),
        .xgmii_rxd(ten_gig_eth_pcs_pma_0_xgmii_rxd1),
        .xgmii_txc(xgmii_fcs_0_XGMII_TXC),
        .xgmii_txd(xgmii_fcs_0_XGMII_TXD));
  bd_eth10_capture_testpat_xgmii_rx_0_0 testpat_xgmii_rx_0
       (.CLK(CLK_1),
        .GAPLEN(GAPLEN_0_1),
        .IN_RXC(ten_gig_eth_pcs_pma_0_xgmii_rxc1),
        .IN_RXD(ten_gig_eth_pcs_pma_0_xgmii_rxd1),
        .OUT_RXC(ten_gig_eth_pcs_pma_0_xgmii_rxc),
        .OUT_RXD(ten_gig_eth_pcs_pma_0_xgmii_rxd),
        .PKTLEN(PKTLEN_0_1),
        .RESET(ten_gig_eth_pcs_pma_0_areset_datapathclk_out),
        .STARTBTN(STARTBTN_0_1));
  bd_eth10_capture_xgmii_fcs_0_0 xgmii_fcs_0
       (.CLK(CLK_1),
        .DEBUG_ALIGN(xgmii_fcs_0_DEBUG_ALIGN),
        .FCS_CORRECT(xgmii_fcs_0_FCS_CORRECT),
        .FCS_EN(xgmii_fcs_0_FCS_EN),
        .RESET(ten_gig_eth_pcs_pma_0_areset_datapathclk_out),
        .RXD_OUT(xgmii_fcs_0_RXD_OUT),
        .RXLEN_OUT(xgmii_fcs_0_RXLEN_OUT),
        .TXD_IN(xgmii_test_server_0_TXD_OUT),
        .TXLEN_IN(xgmii_test_server_0_TXLEN_OUT),
        .XGMII_RXC(ten_gig_eth_pcs_pma_0_xgmii_rxc),
        .XGMII_RXD(ten_gig_eth_pcs_pma_0_xgmii_rxd),
        .XGMII_TXC(xgmii_fcs_0_XGMII_TXC),
        .XGMII_TXD(xgmii_fcs_0_XGMII_TXD));
  bd_eth10_capture_xgmii_test_server_0_0 xgmii_test_server_0
       (.CLK(CLK_1),
        .CLOCK_EN(eth_ctrl_0_clken),
        .LOCAL_IP(address_mac_ip_0_IP_ADDR),
        .LOCAL_MAC(address_mac_ip_0_MAC_ADDR),
        .RESET(ten_gig_eth_pcs_pma_0_areset_datapathclk_out),
        .RXD_IN(xgmii_fcs_0_RXD_OUT),
        .RXLEN_IN(xgmii_fcs_0_RXLEN_OUT),
        .TXD_OUT(xgmii_test_server_0_TXD_OUT),
        .TXLEN_OUT(xgmii_test_server_0_TXLEN_OUT));
  bd_eth10_capture_xlconstant_0_3 xlconstant_0
       (.dout(xlconstant_0_dout));
endmodule

module eth_quad0_imp_QA9G1G
   (FCS_CORRECT_0,
    FCS_EN_0,
    GAPLEN,
    MGTCLK0_clk_n,
    MGTCLK0_clk_p,
    PKTLEN,
    RXD_0,
    RXLEN_0,
    SFP1_RX_N,
    SFP1_RX_P,
    SFP1_TX_N,
    SFP1_TX_P,
    STARTBTN,
    XGMII_CLK,
    XGMII_RESET,
    dclk,
    reset);
  output FCS_CORRECT_0;
  output FCS_EN_0;
  input [15:0]GAPLEN;
  input MGTCLK0_clk_n;
  input MGTCLK0_clk_p;
  input [15:0]PKTLEN;
  output [63:0]RXD_0;
  output [3:0]RXLEN_0;
  input SFP1_RX_N;
  input SFP1_RX_P;
  output SFP1_TX_N;
  output SFP1_TX_P;
  input STARTBTN;
  output XGMII_CLK;
  output XGMII_RESET;
  input dclk;
  input reset;

  wire Conn1_CLK_N;
  wire Conn1_CLK_P;
  wire [15:0]GAPLEN_0_1;
  wire [15:0]PKTLEN_0_1;
  wire SFP1_RX_N_1;
  wire SFP1_RX_P_1;
  wire STARTBTN_0_1;
  wire dclk_1;
  wire eth_0_FCS_CORRECT;
  wire eth_0_FCS_EN_0;
  wire [63:0]eth_0_RXD;
  wire [3:0]eth_0_RXLEN;
  wire eth_0_SFP1_TX_N;
  wire eth_0_SFP1_TX_P;
  wire eth_0_areset_datapathclk_out;
  wire eth_0_txusrclk2_out;
  wire reset_1;

  assign Conn1_CLK_N = MGTCLK0_clk_n;
  assign Conn1_CLK_P = MGTCLK0_clk_p;
  assign FCS_CORRECT_0 = eth_0_FCS_CORRECT;
  assign FCS_EN_0 = eth_0_FCS_EN_0;
  assign GAPLEN_0_1 = GAPLEN[15:0];
  assign PKTLEN_0_1 = PKTLEN[15:0];
  assign RXD_0[63:0] = eth_0_RXD;
  assign RXLEN_0[3:0] = eth_0_RXLEN;
  assign SFP1_RX_N_1 = SFP1_RX_N;
  assign SFP1_RX_P_1 = SFP1_RX_P;
  assign SFP1_TX_N = eth_0_SFP1_TX_N;
  assign SFP1_TX_P = eth_0_SFP1_TX_P;
  assign STARTBTN_0_1 = STARTBTN;
  assign XGMII_CLK = eth_0_txusrclk2_out;
  assign XGMII_RESET = eth_0_areset_datapathclk_out;
  assign dclk_1 = dclk;
  assign reset_1 = reset;
  eth_0_imp_1FPILL0 eth_0
       (.FCS_CORRECT(eth_0_FCS_CORRECT),
        .FCS_EN(eth_0_FCS_EN_0),
        .GAPLEN(GAPLEN_0_1),
        .MGTCLK0_clk_n(Conn1_CLK_N),
        .MGTCLK0_clk_p(Conn1_CLK_P),
        .PKTLEN(PKTLEN_0_1),
        .RXD(eth_0_RXD),
        .RXLEN(eth_0_RXLEN),
        .SFP1_RX_N(SFP1_RX_N_1),
        .SFP1_RX_P(SFP1_RX_P_1),
        .SFP1_TX_N(eth_0_SFP1_TX_N),
        .SFP1_TX_P(eth_0_SFP1_TX_P),
        .STARTBTN(STARTBTN_0_1),
        .areset_datapathclk_out(eth_0_areset_datapathclk_out),
        .dclk(dclk_1),
        .reset(reset_1),
        .txusrclk2_out(eth_0_txusrclk2_out));
endmodule

module fanctrl_imp_QT2QZE
   (CLK,
    I2C_SCL,
    I2C_SDA,
    RESET_N);
  input CLK;
  inout I2C_SCL;
  inout I2C_SDA;
  input RESET_N;

  wire CLK_1;
  wire Net;
  wire Net1;
  wire RESET_N_1;
  wire [6:0]fanctrl_init_0_I2CM_DEVADDR;
  wire [2:0]fanctrl_init_0_I2CM_RBYTES;
  wire [7:0]fanctrl_init_0_I2CM_REGADDR;
  wire fanctrl_init_0_I2CM_VALID;
  wire [2:0]fanctrl_init_0_I2CM_WBYTES;
  wire [31:0]fanctrl_init_0_I2CM_WDATA;
  wire [2:0]i2c_master_0_ERROR;
  wire [31:0]i2c_master_0_RDATA;
  wire i2c_master_0_READY;

  assign CLK_1 = CLK;
  assign RESET_N_1 = RESET_N;
  bd_eth10_capture_fanctrl_init_0_0 fanctrl_init_0
       (.CLK(CLK_1),
        .I2CM_DEVADDR(fanctrl_init_0_I2CM_DEVADDR),
        .I2CM_ERR(i2c_master_0_ERROR),
        .I2CM_RBYTES(fanctrl_init_0_I2CM_RBYTES),
        .I2CM_RDATA(i2c_master_0_RDATA),
        .I2CM_READY(i2c_master_0_READY),
        .I2CM_REGADDR(fanctrl_init_0_I2CM_REGADDR),
        .I2CM_VALID(fanctrl_init_0_I2CM_VALID),
        .I2CM_WBYTES(fanctrl_init_0_I2CM_WBYTES),
        .I2CM_WDATA(fanctrl_init_0_I2CM_WDATA),
        .RESET_N(RESET_N_1));
  bd_eth10_capture_i2c_master_0_0 i2c_master_0
       (.CLK(CLK_1),
        .DEVADDR(fanctrl_init_0_I2CM_DEVADDR),
        .ERROR(i2c_master_0_ERROR),
        .I2C_SCL(I2C_SCL),
        .I2C_SDA(I2C_SDA),
        .RBYTES(fanctrl_init_0_I2CM_RBYTES),
        .RDATA(i2c_master_0_RDATA),
        .READY(i2c_master_0_READY),
        .REGADDR(fanctrl_init_0_I2CM_REGADDR),
        .RESET_N(RESET_N_1),
        .VALID(fanctrl_init_0_I2CM_VALID),
        .WBYTES(fanctrl_init_0_I2CM_WBYTES),
        .WDATA(fanctrl_init_0_I2CM_WDATA));
endmodule

module m00_couplers_imp_1AYYKJV
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  input [0:0]M_AXI_arready;
  output [0:0]M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  input [0:0]M_AXI_awready;
  output [0:0]M_AXI_awvalid;
  output [0:0]M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input [0:0]M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output [0:0]M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input [0:0]M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input [0:0]M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output [0:0]M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  output [0:0]S_AXI_arready;
  input [0:0]S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  output [0:0]S_AXI_awready;
  input [0:0]S_AXI_awvalid;
  input [0:0]S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output [0:0]S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input [0:0]S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output [0:0]S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output [0:0]S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input [0:0]S_AXI_wvalid;

  wire [31:0]m00_couplers_to_m00_couplers_ARADDR;
  wire [0:0]m00_couplers_to_m00_couplers_ARREADY;
  wire [0:0]m00_couplers_to_m00_couplers_ARVALID;
  wire [31:0]m00_couplers_to_m00_couplers_AWADDR;
  wire [0:0]m00_couplers_to_m00_couplers_AWREADY;
  wire [0:0]m00_couplers_to_m00_couplers_AWVALID;
  wire [0:0]m00_couplers_to_m00_couplers_BREADY;
  wire [1:0]m00_couplers_to_m00_couplers_BRESP;
  wire [0:0]m00_couplers_to_m00_couplers_BVALID;
  wire [31:0]m00_couplers_to_m00_couplers_RDATA;
  wire [0:0]m00_couplers_to_m00_couplers_RREADY;
  wire [1:0]m00_couplers_to_m00_couplers_RRESP;
  wire [0:0]m00_couplers_to_m00_couplers_RVALID;
  wire [31:0]m00_couplers_to_m00_couplers_WDATA;
  wire [0:0]m00_couplers_to_m00_couplers_WREADY;
  wire [3:0]m00_couplers_to_m00_couplers_WSTRB;
  wire [0:0]m00_couplers_to_m00_couplers_WVALID;

  assign M_AXI_araddr[31:0] = m00_couplers_to_m00_couplers_ARADDR;
  assign M_AXI_arvalid[0] = m00_couplers_to_m00_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = m00_couplers_to_m00_couplers_AWADDR;
  assign M_AXI_awvalid[0] = m00_couplers_to_m00_couplers_AWVALID;
  assign M_AXI_bready[0] = m00_couplers_to_m00_couplers_BREADY;
  assign M_AXI_rready[0] = m00_couplers_to_m00_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m00_couplers_to_m00_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m00_couplers_to_m00_couplers_WSTRB;
  assign M_AXI_wvalid[0] = m00_couplers_to_m00_couplers_WVALID;
  assign S_AXI_arready[0] = m00_couplers_to_m00_couplers_ARREADY;
  assign S_AXI_awready[0] = m00_couplers_to_m00_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m00_couplers_to_m00_couplers_BRESP;
  assign S_AXI_bvalid[0] = m00_couplers_to_m00_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m00_couplers_to_m00_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m00_couplers_to_m00_couplers_RRESP;
  assign S_AXI_rvalid[0] = m00_couplers_to_m00_couplers_RVALID;
  assign S_AXI_wready[0] = m00_couplers_to_m00_couplers_WREADY;
  assign m00_couplers_to_m00_couplers_ARADDR = S_AXI_araddr[31:0];
  assign m00_couplers_to_m00_couplers_ARREADY = M_AXI_arready[0];
  assign m00_couplers_to_m00_couplers_ARVALID = S_AXI_arvalid[0];
  assign m00_couplers_to_m00_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign m00_couplers_to_m00_couplers_AWREADY = M_AXI_awready[0];
  assign m00_couplers_to_m00_couplers_AWVALID = S_AXI_awvalid[0];
  assign m00_couplers_to_m00_couplers_BREADY = S_AXI_bready[0];
  assign m00_couplers_to_m00_couplers_BRESP = M_AXI_bresp[1:0];
  assign m00_couplers_to_m00_couplers_BVALID = M_AXI_bvalid[0];
  assign m00_couplers_to_m00_couplers_RDATA = M_AXI_rdata[31:0];
  assign m00_couplers_to_m00_couplers_RREADY = S_AXI_rready[0];
  assign m00_couplers_to_m00_couplers_RRESP = M_AXI_rresp[1:0];
  assign m00_couplers_to_m00_couplers_RVALID = M_AXI_rvalid[0];
  assign m00_couplers_to_m00_couplers_WDATA = S_AXI_wdata[31:0];
  assign m00_couplers_to_m00_couplers_WREADY = M_AXI_wready[0];
  assign m00_couplers_to_m00_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign m00_couplers_to_m00_couplers_WVALID = S_AXI_wvalid[0];
endmodule

module m01_couplers_imp_LQFGNW
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [2:0]S_AXI_arprot;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [2:0]S_AXI_awprot;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire M_ACLK_1;
  wire M_ARESETN_1;
  wire S_ACLK_1;
  wire S_ARESETN_1;
  wire [31:0]auto_cc_to_m01_couplers_ARADDR;
  wire auto_cc_to_m01_couplers_ARREADY;
  wire auto_cc_to_m01_couplers_ARVALID;
  wire [31:0]auto_cc_to_m01_couplers_AWADDR;
  wire auto_cc_to_m01_couplers_AWREADY;
  wire auto_cc_to_m01_couplers_AWVALID;
  wire auto_cc_to_m01_couplers_BREADY;
  wire [1:0]auto_cc_to_m01_couplers_BRESP;
  wire auto_cc_to_m01_couplers_BVALID;
  wire [31:0]auto_cc_to_m01_couplers_RDATA;
  wire auto_cc_to_m01_couplers_RREADY;
  wire [1:0]auto_cc_to_m01_couplers_RRESP;
  wire auto_cc_to_m01_couplers_RVALID;
  wire [31:0]auto_cc_to_m01_couplers_WDATA;
  wire auto_cc_to_m01_couplers_WREADY;
  wire auto_cc_to_m01_couplers_WVALID;
  wire [31:0]m01_couplers_to_auto_cc_ARADDR;
  wire [2:0]m01_couplers_to_auto_cc_ARPROT;
  wire m01_couplers_to_auto_cc_ARREADY;
  wire m01_couplers_to_auto_cc_ARVALID;
  wire [31:0]m01_couplers_to_auto_cc_AWADDR;
  wire [2:0]m01_couplers_to_auto_cc_AWPROT;
  wire m01_couplers_to_auto_cc_AWREADY;
  wire m01_couplers_to_auto_cc_AWVALID;
  wire m01_couplers_to_auto_cc_BREADY;
  wire [1:0]m01_couplers_to_auto_cc_BRESP;
  wire m01_couplers_to_auto_cc_BVALID;
  wire [31:0]m01_couplers_to_auto_cc_RDATA;
  wire m01_couplers_to_auto_cc_RREADY;
  wire [1:0]m01_couplers_to_auto_cc_RRESP;
  wire m01_couplers_to_auto_cc_RVALID;
  wire [31:0]m01_couplers_to_auto_cc_WDATA;
  wire m01_couplers_to_auto_cc_WREADY;
  wire [3:0]m01_couplers_to_auto_cc_WSTRB;
  wire m01_couplers_to_auto_cc_WVALID;

  assign M_ACLK_1 = M_ACLK;
  assign M_ARESETN_1 = M_ARESETN;
  assign M_AXI_araddr[31:0] = auto_cc_to_m01_couplers_ARADDR;
  assign M_AXI_arvalid = auto_cc_to_m01_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = auto_cc_to_m01_couplers_AWADDR;
  assign M_AXI_awvalid = auto_cc_to_m01_couplers_AWVALID;
  assign M_AXI_bready = auto_cc_to_m01_couplers_BREADY;
  assign M_AXI_rready = auto_cc_to_m01_couplers_RREADY;
  assign M_AXI_wdata[31:0] = auto_cc_to_m01_couplers_WDATA;
  assign M_AXI_wvalid = auto_cc_to_m01_couplers_WVALID;
  assign S_ACLK_1 = S_ACLK;
  assign S_ARESETN_1 = S_ARESETN;
  assign S_AXI_arready = m01_couplers_to_auto_cc_ARREADY;
  assign S_AXI_awready = m01_couplers_to_auto_cc_AWREADY;
  assign S_AXI_bresp[1:0] = m01_couplers_to_auto_cc_BRESP;
  assign S_AXI_bvalid = m01_couplers_to_auto_cc_BVALID;
  assign S_AXI_rdata[31:0] = m01_couplers_to_auto_cc_RDATA;
  assign S_AXI_rresp[1:0] = m01_couplers_to_auto_cc_RRESP;
  assign S_AXI_rvalid = m01_couplers_to_auto_cc_RVALID;
  assign S_AXI_wready = m01_couplers_to_auto_cc_WREADY;
  assign auto_cc_to_m01_couplers_ARREADY = M_AXI_arready;
  assign auto_cc_to_m01_couplers_AWREADY = M_AXI_awready;
  assign auto_cc_to_m01_couplers_BRESP = M_AXI_bresp[1:0];
  assign auto_cc_to_m01_couplers_BVALID = M_AXI_bvalid;
  assign auto_cc_to_m01_couplers_RDATA = M_AXI_rdata[31:0];
  assign auto_cc_to_m01_couplers_RRESP = M_AXI_rresp[1:0];
  assign auto_cc_to_m01_couplers_RVALID = M_AXI_rvalid;
  assign auto_cc_to_m01_couplers_WREADY = M_AXI_wready;
  assign m01_couplers_to_auto_cc_ARADDR = S_AXI_araddr[31:0];
  assign m01_couplers_to_auto_cc_ARPROT = S_AXI_arprot[2:0];
  assign m01_couplers_to_auto_cc_ARVALID = S_AXI_arvalid;
  assign m01_couplers_to_auto_cc_AWADDR = S_AXI_awaddr[31:0];
  assign m01_couplers_to_auto_cc_AWPROT = S_AXI_awprot[2:0];
  assign m01_couplers_to_auto_cc_AWVALID = S_AXI_awvalid;
  assign m01_couplers_to_auto_cc_BREADY = S_AXI_bready;
  assign m01_couplers_to_auto_cc_RREADY = S_AXI_rready;
  assign m01_couplers_to_auto_cc_WDATA = S_AXI_wdata[31:0];
  assign m01_couplers_to_auto_cc_WSTRB = S_AXI_wstrb[3:0];
  assign m01_couplers_to_auto_cc_WVALID = S_AXI_wvalid;
  bd_eth10_capture_auto_cc_0 auto_cc
       (.m_axi_aclk(M_ACLK_1),
        .m_axi_araddr(auto_cc_to_m01_couplers_ARADDR),
        .m_axi_aresetn(M_ARESETN_1),
        .m_axi_arready(auto_cc_to_m01_couplers_ARREADY),
        .m_axi_arvalid(auto_cc_to_m01_couplers_ARVALID),
        .m_axi_awaddr(auto_cc_to_m01_couplers_AWADDR),
        .m_axi_awready(auto_cc_to_m01_couplers_AWREADY),
        .m_axi_awvalid(auto_cc_to_m01_couplers_AWVALID),
        .m_axi_bready(auto_cc_to_m01_couplers_BREADY),
        .m_axi_bresp(auto_cc_to_m01_couplers_BRESP),
        .m_axi_bvalid(auto_cc_to_m01_couplers_BVALID),
        .m_axi_rdata(auto_cc_to_m01_couplers_RDATA),
        .m_axi_rready(auto_cc_to_m01_couplers_RREADY),
        .m_axi_rresp(auto_cc_to_m01_couplers_RRESP),
        .m_axi_rvalid(auto_cc_to_m01_couplers_RVALID),
        .m_axi_wdata(auto_cc_to_m01_couplers_WDATA),
        .m_axi_wready(auto_cc_to_m01_couplers_WREADY),
        .m_axi_wvalid(auto_cc_to_m01_couplers_WVALID),
        .s_axi_aclk(S_ACLK_1),
        .s_axi_araddr(m01_couplers_to_auto_cc_ARADDR),
        .s_axi_aresetn(S_ARESETN_1),
        .s_axi_arprot(m01_couplers_to_auto_cc_ARPROT),
        .s_axi_arready(m01_couplers_to_auto_cc_ARREADY),
        .s_axi_arvalid(m01_couplers_to_auto_cc_ARVALID),
        .s_axi_awaddr(m01_couplers_to_auto_cc_AWADDR),
        .s_axi_awprot(m01_couplers_to_auto_cc_AWPROT),
        .s_axi_awready(m01_couplers_to_auto_cc_AWREADY),
        .s_axi_awvalid(m01_couplers_to_auto_cc_AWVALID),
        .s_axi_bready(m01_couplers_to_auto_cc_BREADY),
        .s_axi_bresp(m01_couplers_to_auto_cc_BRESP),
        .s_axi_bvalid(m01_couplers_to_auto_cc_BVALID),
        .s_axi_rdata(m01_couplers_to_auto_cc_RDATA),
        .s_axi_rready(m01_couplers_to_auto_cc_RREADY),
        .s_axi_rresp(m01_couplers_to_auto_cc_RRESP),
        .s_axi_rvalid(m01_couplers_to_auto_cc_RVALID),
        .s_axi_wdata(m01_couplers_to_auto_cc_WDATA),
        .s_axi_wready(m01_couplers_to_auto_cc_WREADY),
        .s_axi_wstrb(m01_couplers_to_auto_cc_WSTRB),
        .s_axi_wvalid(m01_couplers_to_auto_cc_WVALID));
endmodule

module m02_couplers_imp_1G607VO
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [7:0]M_AXI_araddr;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [7:0]M_AXI_awaddr;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [2:0]S_AXI_arprot;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [2:0]S_AXI_awprot;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire M_ACLK_1;
  wire M_ARESETN_1;
  wire S_ACLK_1;
  wire S_ARESETN_1;
  wire [7:0]auto_cc_to_m02_couplers_ARADDR;
  wire auto_cc_to_m02_couplers_ARREADY;
  wire auto_cc_to_m02_couplers_ARVALID;
  wire [7:0]auto_cc_to_m02_couplers_AWADDR;
  wire auto_cc_to_m02_couplers_AWREADY;
  wire auto_cc_to_m02_couplers_AWVALID;
  wire auto_cc_to_m02_couplers_BREADY;
  wire [1:0]auto_cc_to_m02_couplers_BRESP;
  wire auto_cc_to_m02_couplers_BVALID;
  wire [31:0]auto_cc_to_m02_couplers_RDATA;
  wire auto_cc_to_m02_couplers_RREADY;
  wire [1:0]auto_cc_to_m02_couplers_RRESP;
  wire auto_cc_to_m02_couplers_RVALID;
  wire [31:0]auto_cc_to_m02_couplers_WDATA;
  wire auto_cc_to_m02_couplers_WREADY;
  wire [3:0]auto_cc_to_m02_couplers_WSTRB;
  wire auto_cc_to_m02_couplers_WVALID;
  wire [31:0]m02_couplers_to_auto_cc_ARADDR;
  wire [2:0]m02_couplers_to_auto_cc_ARPROT;
  wire m02_couplers_to_auto_cc_ARREADY;
  wire m02_couplers_to_auto_cc_ARVALID;
  wire [31:0]m02_couplers_to_auto_cc_AWADDR;
  wire [2:0]m02_couplers_to_auto_cc_AWPROT;
  wire m02_couplers_to_auto_cc_AWREADY;
  wire m02_couplers_to_auto_cc_AWVALID;
  wire m02_couplers_to_auto_cc_BREADY;
  wire [1:0]m02_couplers_to_auto_cc_BRESP;
  wire m02_couplers_to_auto_cc_BVALID;
  wire [31:0]m02_couplers_to_auto_cc_RDATA;
  wire m02_couplers_to_auto_cc_RREADY;
  wire [1:0]m02_couplers_to_auto_cc_RRESP;
  wire m02_couplers_to_auto_cc_RVALID;
  wire [31:0]m02_couplers_to_auto_cc_WDATA;
  wire m02_couplers_to_auto_cc_WREADY;
  wire [3:0]m02_couplers_to_auto_cc_WSTRB;
  wire m02_couplers_to_auto_cc_WVALID;

  assign M_ACLK_1 = M_ACLK;
  assign M_ARESETN_1 = M_ARESETN;
  assign M_AXI_araddr[7:0] = auto_cc_to_m02_couplers_ARADDR;
  assign M_AXI_arvalid = auto_cc_to_m02_couplers_ARVALID;
  assign M_AXI_awaddr[7:0] = auto_cc_to_m02_couplers_AWADDR;
  assign M_AXI_awvalid = auto_cc_to_m02_couplers_AWVALID;
  assign M_AXI_bready = auto_cc_to_m02_couplers_BREADY;
  assign M_AXI_rready = auto_cc_to_m02_couplers_RREADY;
  assign M_AXI_wdata[31:0] = auto_cc_to_m02_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = auto_cc_to_m02_couplers_WSTRB;
  assign M_AXI_wvalid = auto_cc_to_m02_couplers_WVALID;
  assign S_ACLK_1 = S_ACLK;
  assign S_ARESETN_1 = S_ARESETN;
  assign S_AXI_arready = m02_couplers_to_auto_cc_ARREADY;
  assign S_AXI_awready = m02_couplers_to_auto_cc_AWREADY;
  assign S_AXI_bresp[1:0] = m02_couplers_to_auto_cc_BRESP;
  assign S_AXI_bvalid = m02_couplers_to_auto_cc_BVALID;
  assign S_AXI_rdata[31:0] = m02_couplers_to_auto_cc_RDATA;
  assign S_AXI_rresp[1:0] = m02_couplers_to_auto_cc_RRESP;
  assign S_AXI_rvalid = m02_couplers_to_auto_cc_RVALID;
  assign S_AXI_wready = m02_couplers_to_auto_cc_WREADY;
  assign auto_cc_to_m02_couplers_ARREADY = M_AXI_arready;
  assign auto_cc_to_m02_couplers_AWREADY = M_AXI_awready;
  assign auto_cc_to_m02_couplers_BRESP = M_AXI_bresp[1:0];
  assign auto_cc_to_m02_couplers_BVALID = M_AXI_bvalid;
  assign auto_cc_to_m02_couplers_RDATA = M_AXI_rdata[31:0];
  assign auto_cc_to_m02_couplers_RRESP = M_AXI_rresp[1:0];
  assign auto_cc_to_m02_couplers_RVALID = M_AXI_rvalid;
  assign auto_cc_to_m02_couplers_WREADY = M_AXI_wready;
  assign m02_couplers_to_auto_cc_ARADDR = S_AXI_araddr[31:0];
  assign m02_couplers_to_auto_cc_ARPROT = S_AXI_arprot[2:0];
  assign m02_couplers_to_auto_cc_ARVALID = S_AXI_arvalid;
  assign m02_couplers_to_auto_cc_AWADDR = S_AXI_awaddr[31:0];
  assign m02_couplers_to_auto_cc_AWPROT = S_AXI_awprot[2:0];
  assign m02_couplers_to_auto_cc_AWVALID = S_AXI_awvalid;
  assign m02_couplers_to_auto_cc_BREADY = S_AXI_bready;
  assign m02_couplers_to_auto_cc_RREADY = S_AXI_rready;
  assign m02_couplers_to_auto_cc_WDATA = S_AXI_wdata[31:0];
  assign m02_couplers_to_auto_cc_WSTRB = S_AXI_wstrb[3:0];
  assign m02_couplers_to_auto_cc_WVALID = S_AXI_wvalid;
  bd_eth10_capture_auto_cc_1 auto_cc
       (.m_axi_aclk(M_ACLK_1),
        .m_axi_araddr(auto_cc_to_m02_couplers_ARADDR),
        .m_axi_aresetn(M_ARESETN_1),
        .m_axi_arready(auto_cc_to_m02_couplers_ARREADY),
        .m_axi_arvalid(auto_cc_to_m02_couplers_ARVALID),
        .m_axi_awaddr(auto_cc_to_m02_couplers_AWADDR),
        .m_axi_awready(auto_cc_to_m02_couplers_AWREADY),
        .m_axi_awvalid(auto_cc_to_m02_couplers_AWVALID),
        .m_axi_bready(auto_cc_to_m02_couplers_BREADY),
        .m_axi_bresp(auto_cc_to_m02_couplers_BRESP),
        .m_axi_bvalid(auto_cc_to_m02_couplers_BVALID),
        .m_axi_rdata(auto_cc_to_m02_couplers_RDATA),
        .m_axi_rready(auto_cc_to_m02_couplers_RREADY),
        .m_axi_rresp(auto_cc_to_m02_couplers_RRESP),
        .m_axi_rvalid(auto_cc_to_m02_couplers_RVALID),
        .m_axi_wdata(auto_cc_to_m02_couplers_WDATA),
        .m_axi_wready(auto_cc_to_m02_couplers_WREADY),
        .m_axi_wstrb(auto_cc_to_m02_couplers_WSTRB),
        .m_axi_wvalid(auto_cc_to_m02_couplers_WVALID),
        .s_axi_aclk(S_ACLK_1),
        .s_axi_araddr(m02_couplers_to_auto_cc_ARADDR[7:0]),
        .s_axi_aresetn(S_ARESETN_1),
        .s_axi_arprot(m02_couplers_to_auto_cc_ARPROT),
        .s_axi_arready(m02_couplers_to_auto_cc_ARREADY),
        .s_axi_arvalid(m02_couplers_to_auto_cc_ARVALID),
        .s_axi_awaddr(m02_couplers_to_auto_cc_AWADDR[7:0]),
        .s_axi_awprot(m02_couplers_to_auto_cc_AWPROT),
        .s_axi_awready(m02_couplers_to_auto_cc_AWREADY),
        .s_axi_awvalid(m02_couplers_to_auto_cc_AWVALID),
        .s_axi_bready(m02_couplers_to_auto_cc_BREADY),
        .s_axi_bresp(m02_couplers_to_auto_cc_BRESP),
        .s_axi_bvalid(m02_couplers_to_auto_cc_BVALID),
        .s_axi_rdata(m02_couplers_to_auto_cc_RDATA),
        .s_axi_rready(m02_couplers_to_auto_cc_RREADY),
        .s_axi_rresp(m02_couplers_to_auto_cc_RRESP),
        .s_axi_rvalid(m02_couplers_to_auto_cc_RVALID),
        .s_axi_wdata(m02_couplers_to_auto_cc_WDATA),
        .s_axi_wready(m02_couplers_to_auto_cc_WREADY),
        .s_axi_wstrb(m02_couplers_to_auto_cc_WSTRB),
        .s_axi_wvalid(m02_couplers_to_auto_cc_WVALID));
endmodule

module pcie_dram_imp_1W99HGN
   (M_AXI_REGS_araddr,
    M_AXI_REGS_arready,
    M_AXI_REGS_arvalid,
    M_AXI_REGS_awaddr,
    M_AXI_REGS_awready,
    M_AXI_REGS_awvalid,
    M_AXI_REGS_bready,
    M_AXI_REGS_bresp,
    M_AXI_REGS_bvalid,
    M_AXI_REGS_rdata,
    M_AXI_REGS_rready,
    M_AXI_REGS_rresp,
    M_AXI_REGS_rvalid,
    M_AXI_REGS_wdata,
    M_AXI_REGS_wready,
    M_AXI_REGS_wstrb,
    M_AXI_REGS_wvalid,
    S_AXI_S2MM_awaddr,
    S_AXI_S2MM_awburst,
    S_AXI_S2MM_awcache,
    S_AXI_S2MM_awid,
    S_AXI_S2MM_awlen,
    S_AXI_S2MM_awprot,
    S_AXI_S2MM_awready,
    S_AXI_S2MM_awsize,
    S_AXI_S2MM_awuser,
    S_AXI_S2MM_awvalid,
    S_AXI_S2MM_bready,
    S_AXI_S2MM_bresp,
    S_AXI_S2MM_bvalid,
    S_AXI_S2MM_wdata,
    S_AXI_S2MM_wlast,
    S_AXI_S2MM_wready,
    S_AXI_S2MM_wstrb,
    S_AXI_S2MM_wvalid,
    XGMII_CLK,
    XGMII_RESETN,
    clk_100,
    ddr4_sdram_c0_act_n,
    ddr4_sdram_c0_adr,
    ddr4_sdram_c0_ba,
    ddr4_sdram_c0_bg,
    ddr4_sdram_c0_ck_c,
    ddr4_sdram_c0_ck_t,
    ddr4_sdram_c0_cke,
    ddr4_sdram_c0_cs_n,
    ddr4_sdram_c0_dm_n,
    ddr4_sdram_c0_dq,
    ddr4_sdram_c0_dqs_c,
    ddr4_sdram_c0_dqs_t,
    ddr4_sdram_c0_odt,
    ddr4_sdram_c0_reset_n,
    default_300mhz_clk0_clk_n,
    default_300mhz_clk0_clk_p,
    led_8bits_tri_o,
    pci_express_x8_rxn,
    pci_express_x8_rxp,
    pci_express_x8_txn,
    pci_express_x8_txp,
    pcie_perstn,
    pcie_refclk_clk_n,
    pcie_refclk_clk_p,
    resetn);
  output [7:0]M_AXI_REGS_araddr;
  input M_AXI_REGS_arready;
  output M_AXI_REGS_arvalid;
  output [7:0]M_AXI_REGS_awaddr;
  input M_AXI_REGS_awready;
  output M_AXI_REGS_awvalid;
  output M_AXI_REGS_bready;
  input [1:0]M_AXI_REGS_bresp;
  input M_AXI_REGS_bvalid;
  input [31:0]M_AXI_REGS_rdata;
  output M_AXI_REGS_rready;
  input [1:0]M_AXI_REGS_rresp;
  input M_AXI_REGS_rvalid;
  output [31:0]M_AXI_REGS_wdata;
  input M_AXI_REGS_wready;
  output [3:0]M_AXI_REGS_wstrb;
  output M_AXI_REGS_wvalid;
  input [63:0]S_AXI_S2MM_awaddr;
  input [1:0]S_AXI_S2MM_awburst;
  input [3:0]S_AXI_S2MM_awcache;
  input [3:0]S_AXI_S2MM_awid;
  input [7:0]S_AXI_S2MM_awlen;
  input [2:0]S_AXI_S2MM_awprot;
  output S_AXI_S2MM_awready;
  input [2:0]S_AXI_S2MM_awsize;
  input [3:0]S_AXI_S2MM_awuser;
  input S_AXI_S2MM_awvalid;
  input S_AXI_S2MM_bready;
  output [1:0]S_AXI_S2MM_bresp;
  output S_AXI_S2MM_bvalid;
  input [127:0]S_AXI_S2MM_wdata;
  input S_AXI_S2MM_wlast;
  output S_AXI_S2MM_wready;
  input [15:0]S_AXI_S2MM_wstrb;
  input S_AXI_S2MM_wvalid;
  input XGMII_CLK;
  input XGMII_RESETN;
  output clk_100;
  output ddr4_sdram_c0_act_n;
  output [16:0]ddr4_sdram_c0_adr;
  output [1:0]ddr4_sdram_c0_ba;
  output ddr4_sdram_c0_bg;
  output ddr4_sdram_c0_ck_c;
  output ddr4_sdram_c0_ck_t;
  output ddr4_sdram_c0_cke;
  output [1:0]ddr4_sdram_c0_cs_n;
  inout [8:0]ddr4_sdram_c0_dm_n;
  inout [71:0]ddr4_sdram_c0_dq;
  inout [8:0]ddr4_sdram_c0_dqs_c;
  inout [8:0]ddr4_sdram_c0_dqs_t;
  output ddr4_sdram_c0_odt;
  output ddr4_sdram_c0_reset_n;
  input default_300mhz_clk0_clk_n;
  input default_300mhz_clk0_clk_p;
  output [7:0]led_8bits_tri_o;
  input [7:0]pci_express_x8_rxn;
  input [7:0]pci_express_x8_rxp;
  output [7:0]pci_express_x8_txn;
  output [7:0]pci_express_x8_txp;
  input pcie_perstn;
  input pcie_refclk_clk_n;
  input pcie_refclk_clk_p;
  input [0:0]resetn;

  wire Conn1_CLK_N;
  wire Conn1_CLK_P;
  wire [7:0]Conn2_TRI_O;
  wire [7:0]Conn3_rxn;
  wire [7:0]Conn3_rxp;
  wire [7:0]Conn3_txn;
  wire [7:0]Conn3_txp;
  wire Conn4_CLK_N;
  wire Conn4_CLK_P;
  wire Conn5_ACT_N;
  wire [16:0]Conn5_ADR;
  wire [1:0]Conn5_BA;
  wire [0:0]Conn5_BG;
  wire [0:0]Conn5_CKE;
  wire [0:0]Conn5_CK_C;
  wire [0:0]Conn5_CK_T;
  wire [1:0]Conn5_CS_N;
  wire [8:0]Conn5_DM_N;
  wire [71:0]Conn5_DQ;
  wire [8:0]Conn5_DQS_C;
  wire [8:0]Conn5_DQS_T;
  wire [0:0]Conn5_ODT;
  wire Conn5_RESET_N;
  wire [63:0]Conn6_AWADDR;
  wire [1:0]Conn6_AWBURST;
  wire [3:0]Conn6_AWCACHE;
  wire [3:0]Conn6_AWID;
  wire [7:0]Conn6_AWLEN;
  wire [2:0]Conn6_AWPROT;
  wire Conn6_AWREADY;
  wire [2:0]Conn6_AWSIZE;
  wire [3:0]Conn6_AWUSER;
  wire Conn6_AWVALID;
  wire Conn6_BREADY;
  wire [1:0]Conn6_BRESP;
  wire Conn6_BVALID;
  wire [127:0]Conn6_WDATA;
  wire Conn6_WLAST;
  wire Conn6_WREADY;
  wire [15:0]Conn6_WSTRB;
  wire Conn6_WVALID;
  wire M02_ARESETN_1;
  wire aclk2_1;
  wire [31:0]axi_smc_M00_AXI_ARADDR;
  wire [1:0]axi_smc_M00_AXI_ARBURST;
  wire [3:0]axi_smc_M00_AXI_ARCACHE;
  wire [7:0]axi_smc_M00_AXI_ARLEN;
  wire [0:0]axi_smc_M00_AXI_ARLOCK;
  wire [2:0]axi_smc_M00_AXI_ARPROT;
  wire [3:0]axi_smc_M00_AXI_ARQOS;
  wire axi_smc_M00_AXI_ARREADY;
  wire [2:0]axi_smc_M00_AXI_ARSIZE;
  wire axi_smc_M00_AXI_ARVALID;
  wire [31:0]axi_smc_M00_AXI_AWADDR;
  wire [1:0]axi_smc_M00_AXI_AWBURST;
  wire [3:0]axi_smc_M00_AXI_AWCACHE;
  wire [7:0]axi_smc_M00_AXI_AWLEN;
  wire [0:0]axi_smc_M00_AXI_AWLOCK;
  wire [2:0]axi_smc_M00_AXI_AWPROT;
  wire [3:0]axi_smc_M00_AXI_AWQOS;
  wire axi_smc_M00_AXI_AWREADY;
  wire [2:0]axi_smc_M00_AXI_AWSIZE;
  wire axi_smc_M00_AXI_AWVALID;
  wire axi_smc_M00_AXI_BREADY;
  wire [1:0]axi_smc_M00_AXI_BRESP;
  wire axi_smc_M00_AXI_BVALID;
  wire [511:0]axi_smc_M00_AXI_RDATA;
  wire axi_smc_M00_AXI_RLAST;
  wire axi_smc_M00_AXI_RREADY;
  wire [1:0]axi_smc_M00_AXI_RRESP;
  wire axi_smc_M00_AXI_RVALID;
  wire [511:0]axi_smc_M00_AXI_WDATA;
  wire axi_smc_M00_AXI_WLAST;
  wire axi_smc_M00_AXI_WREADY;
  wire [63:0]axi_smc_M00_AXI_WSTRB;
  wire axi_smc_M00_AXI_WVALID;
  wire ddr4_0_addn_ui_clkout1;
  wire ddr4_0_c0_ddr4_ui_clk;
  wire ddr4_0_c0_ddr4_ui_clk_sync_rst;
  wire pcie_perstn_1;
  wire [0:0]reset_ddr4_0_300m_peripheral_aresetn;
  wire [0:0]resetn_1;
  wire [0:0]util_ds_buf_IBUF_DS_ODIV2;
  wire [0:0]util_ds_buf_IBUF_OUT;
  wire [0:0]util_vector_logic_0_Res;
  wire [63:0]xdma_0_M_AXI_ARADDR;
  wire [1:0]xdma_0_M_AXI_ARBURST;
  wire [3:0]xdma_0_M_AXI_ARCACHE;
  wire [3:0]xdma_0_M_AXI_ARID;
  wire [7:0]xdma_0_M_AXI_ARLEN;
  wire xdma_0_M_AXI_ARLOCK;
  wire [2:0]xdma_0_M_AXI_ARPROT;
  wire xdma_0_M_AXI_ARREADY;
  wire [2:0]xdma_0_M_AXI_ARSIZE;
  wire xdma_0_M_AXI_ARVALID;
  wire [63:0]xdma_0_M_AXI_AWADDR;
  wire [1:0]xdma_0_M_AXI_AWBURST;
  wire [3:0]xdma_0_M_AXI_AWCACHE;
  wire [3:0]xdma_0_M_AXI_AWID;
  wire [7:0]xdma_0_M_AXI_AWLEN;
  wire xdma_0_M_AXI_AWLOCK;
  wire [2:0]xdma_0_M_AXI_AWPROT;
  wire xdma_0_M_AXI_AWREADY;
  wire [2:0]xdma_0_M_AXI_AWSIZE;
  wire xdma_0_M_AXI_AWVALID;
  wire [3:0]xdma_0_M_AXI_BID;
  wire xdma_0_M_AXI_BREADY;
  wire [1:0]xdma_0_M_AXI_BRESP;
  wire xdma_0_M_AXI_BVALID;
  wire [31:0]xdma_0_M_AXI_LITE_ARADDR;
  wire [2:0]xdma_0_M_AXI_LITE_ARPROT;
  wire [0:0]xdma_0_M_AXI_LITE_ARREADY;
  wire xdma_0_M_AXI_LITE_ARVALID;
  wire [31:0]xdma_0_M_AXI_LITE_AWADDR;
  wire [2:0]xdma_0_M_AXI_LITE_AWPROT;
  wire [0:0]xdma_0_M_AXI_LITE_AWREADY;
  wire xdma_0_M_AXI_LITE_AWVALID;
  wire xdma_0_M_AXI_LITE_BREADY;
  wire [1:0]xdma_0_M_AXI_LITE_BRESP;
  wire [0:0]xdma_0_M_AXI_LITE_BVALID;
  wire [31:0]xdma_0_M_AXI_LITE_RDATA;
  wire xdma_0_M_AXI_LITE_RREADY;
  wire [1:0]xdma_0_M_AXI_LITE_RRESP;
  wire [0:0]xdma_0_M_AXI_LITE_RVALID;
  wire [31:0]xdma_0_M_AXI_LITE_WDATA;
  wire [0:0]xdma_0_M_AXI_LITE_WREADY;
  wire [3:0]xdma_0_M_AXI_LITE_WSTRB;
  wire xdma_0_M_AXI_LITE_WVALID;
  wire [255:0]xdma_0_M_AXI_RDATA;
  wire [3:0]xdma_0_M_AXI_RID;
  wire xdma_0_M_AXI_RLAST;
  wire xdma_0_M_AXI_RREADY;
  wire [1:0]xdma_0_M_AXI_RRESP;
  wire xdma_0_M_AXI_RVALID;
  wire [255:0]xdma_0_M_AXI_WDATA;
  wire xdma_0_M_AXI_WLAST;
  wire xdma_0_M_AXI_WREADY;
  wire [31:0]xdma_0_M_AXI_WSTRB;
  wire xdma_0_M_AXI_WVALID;
  wire xdma_0_axi_aclk;
  wire xdma_0_axi_aresetn;
  wire [31:0]xdma_0_axi_periph_M00_AXI_ARADDR;
  wire xdma_0_axi_periph_M00_AXI_ARREADY;
  wire [0:0]xdma_0_axi_periph_M00_AXI_ARVALID;
  wire [31:0]xdma_0_axi_periph_M00_AXI_AWADDR;
  wire xdma_0_axi_periph_M00_AXI_AWREADY;
  wire [0:0]xdma_0_axi_periph_M00_AXI_AWVALID;
  wire [0:0]xdma_0_axi_periph_M00_AXI_BREADY;
  wire [1:0]xdma_0_axi_periph_M00_AXI_BRESP;
  wire xdma_0_axi_periph_M00_AXI_BVALID;
  wire [31:0]xdma_0_axi_periph_M00_AXI_RDATA;
  wire [0:0]xdma_0_axi_periph_M00_AXI_RREADY;
  wire [1:0]xdma_0_axi_periph_M00_AXI_RRESP;
  wire xdma_0_axi_periph_M00_AXI_RVALID;
  wire [31:0]xdma_0_axi_periph_M00_AXI_WDATA;
  wire xdma_0_axi_periph_M00_AXI_WREADY;
  wire [3:0]xdma_0_axi_periph_M00_AXI_WSTRB;
  wire [0:0]xdma_0_axi_periph_M00_AXI_WVALID;
  wire [31:0]xdma_0_axi_periph_M01_AXI_ARADDR;
  wire xdma_0_axi_periph_M01_AXI_ARREADY;
  wire xdma_0_axi_periph_M01_AXI_ARVALID;
  wire [31:0]xdma_0_axi_periph_M01_AXI_AWADDR;
  wire xdma_0_axi_periph_M01_AXI_AWREADY;
  wire xdma_0_axi_periph_M01_AXI_AWVALID;
  wire xdma_0_axi_periph_M01_AXI_BREADY;
  wire [1:0]xdma_0_axi_periph_M01_AXI_BRESP;
  wire xdma_0_axi_periph_M01_AXI_BVALID;
  wire [31:0]xdma_0_axi_periph_M01_AXI_RDATA;
  wire xdma_0_axi_periph_M01_AXI_RREADY;
  wire [1:0]xdma_0_axi_periph_M01_AXI_RRESP;
  wire xdma_0_axi_periph_M01_AXI_RVALID;
  wire [31:0]xdma_0_axi_periph_M01_AXI_WDATA;
  wire xdma_0_axi_periph_M01_AXI_WREADY;
  wire xdma_0_axi_periph_M01_AXI_WVALID;
  wire [7:0]xdma_0_axi_periph_M02_AXI_ARADDR;
  wire xdma_0_axi_periph_M02_AXI_ARREADY;
  wire xdma_0_axi_periph_M02_AXI_ARVALID;
  wire [7:0]xdma_0_axi_periph_M02_AXI_AWADDR;
  wire xdma_0_axi_periph_M02_AXI_AWREADY;
  wire xdma_0_axi_periph_M02_AXI_AWVALID;
  wire xdma_0_axi_periph_M02_AXI_BREADY;
  wire [1:0]xdma_0_axi_periph_M02_AXI_BRESP;
  wire xdma_0_axi_periph_M02_AXI_BVALID;
  wire [31:0]xdma_0_axi_periph_M02_AXI_RDATA;
  wire xdma_0_axi_periph_M02_AXI_RREADY;
  wire [1:0]xdma_0_axi_periph_M02_AXI_RRESP;
  wire xdma_0_axi_periph_M02_AXI_RVALID;
  wire [31:0]xdma_0_axi_periph_M02_AXI_WDATA;
  wire xdma_0_axi_periph_M02_AXI_WREADY;
  wire [3:0]xdma_0_axi_periph_M02_AXI_WSTRB;
  wire xdma_0_axi_periph_M02_AXI_WVALID;
  wire [0:0]xlconstant_0_dout;

  assign Conn1_CLK_N = default_300mhz_clk0_clk_n;
  assign Conn1_CLK_P = default_300mhz_clk0_clk_p;
  assign Conn3_rxn = pci_express_x8_rxn[7:0];
  assign Conn3_rxp = pci_express_x8_rxp[7:0];
  assign Conn4_CLK_N = pcie_refclk_clk_n;
  assign Conn4_CLK_P = pcie_refclk_clk_p;
  assign Conn6_AWADDR = S_AXI_S2MM_awaddr[63:0];
  assign Conn6_AWBURST = S_AXI_S2MM_awburst[1:0];
  assign Conn6_AWCACHE = S_AXI_S2MM_awcache[3:0];
  assign Conn6_AWID = S_AXI_S2MM_awid[3:0];
  assign Conn6_AWLEN = S_AXI_S2MM_awlen[7:0];
  assign Conn6_AWPROT = S_AXI_S2MM_awprot[2:0];
  assign Conn6_AWSIZE = S_AXI_S2MM_awsize[2:0];
  assign Conn6_AWUSER = S_AXI_S2MM_awuser[3:0];
  assign Conn6_AWVALID = S_AXI_S2MM_awvalid;
  assign Conn6_BREADY = S_AXI_S2MM_bready;
  assign Conn6_WDATA = S_AXI_S2MM_wdata[127:0];
  assign Conn6_WLAST = S_AXI_S2MM_wlast;
  assign Conn6_WSTRB = S_AXI_S2MM_wstrb[15:0];
  assign Conn6_WVALID = S_AXI_S2MM_wvalid;
  assign M02_ARESETN_1 = XGMII_RESETN;
  assign M_AXI_REGS_araddr[7:0] = xdma_0_axi_periph_M02_AXI_ARADDR;
  assign M_AXI_REGS_arvalid = xdma_0_axi_periph_M02_AXI_ARVALID;
  assign M_AXI_REGS_awaddr[7:0] = xdma_0_axi_periph_M02_AXI_AWADDR;
  assign M_AXI_REGS_awvalid = xdma_0_axi_periph_M02_AXI_AWVALID;
  assign M_AXI_REGS_bready = xdma_0_axi_periph_M02_AXI_BREADY;
  assign M_AXI_REGS_rready = xdma_0_axi_periph_M02_AXI_RREADY;
  assign M_AXI_REGS_wdata[31:0] = xdma_0_axi_periph_M02_AXI_WDATA;
  assign M_AXI_REGS_wstrb[3:0] = xdma_0_axi_periph_M02_AXI_WSTRB;
  assign M_AXI_REGS_wvalid = xdma_0_axi_periph_M02_AXI_WVALID;
  assign S_AXI_S2MM_awready = Conn6_AWREADY;
  assign S_AXI_S2MM_bresp[1:0] = Conn6_BRESP;
  assign S_AXI_S2MM_bvalid = Conn6_BVALID;
  assign S_AXI_S2MM_wready = Conn6_WREADY;
  assign aclk2_1 = XGMII_CLK;
  assign clk_100 = ddr4_0_addn_ui_clkout1;
  assign ddr4_sdram_c0_act_n = Conn5_ACT_N;
  assign ddr4_sdram_c0_adr[16:0] = Conn5_ADR;
  assign ddr4_sdram_c0_ba[1:0] = Conn5_BA;
  assign ddr4_sdram_c0_bg = Conn5_BG;
  assign ddr4_sdram_c0_ck_c = Conn5_CK_C;
  assign ddr4_sdram_c0_ck_t = Conn5_CK_T;
  assign ddr4_sdram_c0_cke = Conn5_CKE;
  assign ddr4_sdram_c0_cs_n[1:0] = Conn5_CS_N;
  assign ddr4_sdram_c0_odt = Conn5_ODT;
  assign ddr4_sdram_c0_reset_n = Conn5_RESET_N;
  assign led_8bits_tri_o[7:0] = Conn2_TRI_O;
  assign pci_express_x8_txn[7:0] = Conn3_txn;
  assign pci_express_x8_txp[7:0] = Conn3_txp;
  assign pcie_perstn_1 = pcie_perstn;
  assign resetn_1 = resetn[0];
  assign xdma_0_axi_periph_M02_AXI_ARREADY = M_AXI_REGS_arready;
  assign xdma_0_axi_periph_M02_AXI_AWREADY = M_AXI_REGS_awready;
  assign xdma_0_axi_periph_M02_AXI_BRESP = M_AXI_REGS_bresp[1:0];
  assign xdma_0_axi_periph_M02_AXI_BVALID = M_AXI_REGS_bvalid;
  assign xdma_0_axi_periph_M02_AXI_RDATA = M_AXI_REGS_rdata[31:0];
  assign xdma_0_axi_periph_M02_AXI_RRESP = M_AXI_REGS_rresp[1:0];
  assign xdma_0_axi_periph_M02_AXI_RVALID = M_AXI_REGS_rvalid;
  assign xdma_0_axi_periph_M02_AXI_WREADY = M_AXI_REGS_wready;
  bd_eth10_capture_axi_gpio_0_0 axi_gpio_0
       (.gpio_io_o(Conn2_TRI_O),
        .s_axi_aclk(xdma_0_axi_aclk),
        .s_axi_araddr(xdma_0_axi_periph_M00_AXI_ARADDR[8:0]),
        .s_axi_aresetn(xdma_0_axi_aresetn),
        .s_axi_arready(xdma_0_axi_periph_M00_AXI_ARREADY),
        .s_axi_arvalid(xdma_0_axi_periph_M00_AXI_ARVALID),
        .s_axi_awaddr(xdma_0_axi_periph_M00_AXI_AWADDR[8:0]),
        .s_axi_awready(xdma_0_axi_periph_M00_AXI_AWREADY),
        .s_axi_awvalid(xdma_0_axi_periph_M00_AXI_AWVALID),
        .s_axi_bready(xdma_0_axi_periph_M00_AXI_BREADY),
        .s_axi_bresp(xdma_0_axi_periph_M00_AXI_BRESP),
        .s_axi_bvalid(xdma_0_axi_periph_M00_AXI_BVALID),
        .s_axi_rdata(xdma_0_axi_periph_M00_AXI_RDATA),
        .s_axi_rready(xdma_0_axi_periph_M00_AXI_RREADY),
        .s_axi_rresp(xdma_0_axi_periph_M00_AXI_RRESP),
        .s_axi_rvalid(xdma_0_axi_periph_M00_AXI_RVALID),
        .s_axi_wdata(xdma_0_axi_periph_M00_AXI_WDATA),
        .s_axi_wready(xdma_0_axi_periph_M00_AXI_WREADY),
        .s_axi_wstrb(xdma_0_axi_periph_M00_AXI_WSTRB),
        .s_axi_wvalid(xdma_0_axi_periph_M00_AXI_WVALID));
  bd_eth10_capture_axi_smc_0 axi_smc
       (.M00_AXI_araddr(axi_smc_M00_AXI_ARADDR),
        .M00_AXI_arburst(axi_smc_M00_AXI_ARBURST),
        .M00_AXI_arcache(axi_smc_M00_AXI_ARCACHE),
        .M00_AXI_arlen(axi_smc_M00_AXI_ARLEN),
        .M00_AXI_arlock(axi_smc_M00_AXI_ARLOCK),
        .M00_AXI_arprot(axi_smc_M00_AXI_ARPROT),
        .M00_AXI_arqos(axi_smc_M00_AXI_ARQOS),
        .M00_AXI_arready(axi_smc_M00_AXI_ARREADY),
        .M00_AXI_arsize(axi_smc_M00_AXI_ARSIZE),
        .M00_AXI_arvalid(axi_smc_M00_AXI_ARVALID),
        .M00_AXI_awaddr(axi_smc_M00_AXI_AWADDR),
        .M00_AXI_awburst(axi_smc_M00_AXI_AWBURST),
        .M00_AXI_awcache(axi_smc_M00_AXI_AWCACHE),
        .M00_AXI_awlen(axi_smc_M00_AXI_AWLEN),
        .M00_AXI_awlock(axi_smc_M00_AXI_AWLOCK),
        .M00_AXI_awprot(axi_smc_M00_AXI_AWPROT),
        .M00_AXI_awqos(axi_smc_M00_AXI_AWQOS),
        .M00_AXI_awready(axi_smc_M00_AXI_AWREADY),
        .M00_AXI_awsize(axi_smc_M00_AXI_AWSIZE),
        .M00_AXI_awvalid(axi_smc_M00_AXI_AWVALID),
        .M00_AXI_bready(axi_smc_M00_AXI_BREADY),
        .M00_AXI_bresp(axi_smc_M00_AXI_BRESP),
        .M00_AXI_bvalid(axi_smc_M00_AXI_BVALID),
        .M00_AXI_rdata(axi_smc_M00_AXI_RDATA),
        .M00_AXI_rlast(axi_smc_M00_AXI_RLAST),
        .M00_AXI_rready(axi_smc_M00_AXI_RREADY),
        .M00_AXI_rresp(axi_smc_M00_AXI_RRESP),
        .M00_AXI_rvalid(axi_smc_M00_AXI_RVALID),
        .M00_AXI_wdata(axi_smc_M00_AXI_WDATA),
        .M00_AXI_wlast(axi_smc_M00_AXI_WLAST),
        .M00_AXI_wready(axi_smc_M00_AXI_WREADY),
        .M00_AXI_wstrb(axi_smc_M00_AXI_WSTRB),
        .M00_AXI_wvalid(axi_smc_M00_AXI_WVALID),
        .S00_AXI_araddr(xdma_0_M_AXI_ARADDR),
        .S00_AXI_arburst(xdma_0_M_AXI_ARBURST),
        .S00_AXI_arcache(xdma_0_M_AXI_ARCACHE),
        .S00_AXI_arid(xdma_0_M_AXI_ARID),
        .S00_AXI_arlen(xdma_0_M_AXI_ARLEN),
        .S00_AXI_arlock(xdma_0_M_AXI_ARLOCK),
        .S00_AXI_arprot(xdma_0_M_AXI_ARPROT),
        .S00_AXI_arqos({1'b0,1'b0,1'b0,1'b0}),
        .S00_AXI_arready(xdma_0_M_AXI_ARREADY),
        .S00_AXI_arsize(xdma_0_M_AXI_ARSIZE),
        .S00_AXI_arvalid(xdma_0_M_AXI_ARVALID),
        .S00_AXI_awaddr(xdma_0_M_AXI_AWADDR),
        .S00_AXI_awburst(xdma_0_M_AXI_AWBURST),
        .S00_AXI_awcache(xdma_0_M_AXI_AWCACHE),
        .S00_AXI_awid(xdma_0_M_AXI_AWID),
        .S00_AXI_awlen(xdma_0_M_AXI_AWLEN),
        .S00_AXI_awlock(xdma_0_M_AXI_AWLOCK),
        .S00_AXI_awprot(xdma_0_M_AXI_AWPROT),
        .S00_AXI_awqos({1'b0,1'b0,1'b0,1'b0}),
        .S00_AXI_awready(xdma_0_M_AXI_AWREADY),
        .S00_AXI_awsize(xdma_0_M_AXI_AWSIZE),
        .S00_AXI_awvalid(xdma_0_M_AXI_AWVALID),
        .S00_AXI_bid(xdma_0_M_AXI_BID),
        .S00_AXI_bready(xdma_0_M_AXI_BREADY),
        .S00_AXI_bresp(xdma_0_M_AXI_BRESP),
        .S00_AXI_bvalid(xdma_0_M_AXI_BVALID),
        .S00_AXI_rdata(xdma_0_M_AXI_RDATA),
        .S00_AXI_rid(xdma_0_M_AXI_RID),
        .S00_AXI_rlast(xdma_0_M_AXI_RLAST),
        .S00_AXI_rready(xdma_0_M_AXI_RREADY),
        .S00_AXI_rresp(xdma_0_M_AXI_RRESP),
        .S00_AXI_rvalid(xdma_0_M_AXI_RVALID),
        .S00_AXI_wdata(xdma_0_M_AXI_WDATA),
        .S00_AXI_wlast(xdma_0_M_AXI_WLAST),
        .S00_AXI_wready(xdma_0_M_AXI_WREADY),
        .S00_AXI_wstrb(xdma_0_M_AXI_WSTRB),
        .S00_AXI_wvalid(xdma_0_M_AXI_WVALID),
        .S01_AXI_awaddr(Conn6_AWADDR),
        .S01_AXI_awburst(Conn6_AWBURST),
        .S01_AXI_awcache(Conn6_AWCACHE),
        .S01_AXI_awid(Conn6_AWID),
        .S01_AXI_awlen(Conn6_AWLEN),
        .S01_AXI_awlock(1'b0),
        .S01_AXI_awprot(Conn6_AWPROT),
        .S01_AXI_awqos({1'b0,1'b0,1'b0,1'b0}),
        .S01_AXI_awready(Conn6_AWREADY),
        .S01_AXI_awsize(Conn6_AWSIZE),
        .S01_AXI_awuser(Conn6_AWUSER),
        .S01_AXI_awvalid(Conn6_AWVALID),
        .S01_AXI_bready(Conn6_BREADY),
        .S01_AXI_bresp(Conn6_BRESP),
        .S01_AXI_bvalid(Conn6_BVALID),
        .S01_AXI_wdata(Conn6_WDATA),
        .S01_AXI_wlast(Conn6_WLAST),
        .S01_AXI_wready(Conn6_WREADY),
        .S01_AXI_wstrb(Conn6_WSTRB),
        .S01_AXI_wvalid(Conn6_WVALID),
        .aclk(ddr4_0_c0_ddr4_ui_clk),
        .aclk1(xdma_0_axi_aclk),
        .aclk2(aclk2_1),
        .aresetn(xdma_0_axi_aresetn));
  bd_eth10_capture_ddr4_0_0 ddr4_0
       (.addn_ui_clkout1(ddr4_0_addn_ui_clkout1),
        .c0_ddr4_act_n(Conn5_ACT_N),
        .c0_ddr4_adr(Conn5_ADR),
        .c0_ddr4_aresetn(reset_ddr4_0_300m_peripheral_aresetn),
        .c0_ddr4_ba(Conn5_BA),
        .c0_ddr4_bg(Conn5_BG),
        .c0_ddr4_ck_c(Conn5_CK_C),
        .c0_ddr4_ck_t(Conn5_CK_T),
        .c0_ddr4_cke(Conn5_CKE),
        .c0_ddr4_cs_n(Conn5_CS_N),
        .c0_ddr4_dm_dbi_n(ddr4_sdram_c0_dm_n[8:0]),
        .c0_ddr4_dq(ddr4_sdram_c0_dq[71:0]),
        .c0_ddr4_dqs_c(ddr4_sdram_c0_dqs_c[8:0]),
        .c0_ddr4_dqs_t(ddr4_sdram_c0_dqs_t[8:0]),
        .c0_ddr4_odt(Conn5_ODT),
        .c0_ddr4_reset_n(Conn5_RESET_N),
        .c0_ddr4_s_axi_araddr(axi_smc_M00_AXI_ARADDR),
        .c0_ddr4_s_axi_arburst(axi_smc_M00_AXI_ARBURST),
        .c0_ddr4_s_axi_arcache(axi_smc_M00_AXI_ARCACHE),
        .c0_ddr4_s_axi_arid(1'b0),
        .c0_ddr4_s_axi_arlen(axi_smc_M00_AXI_ARLEN),
        .c0_ddr4_s_axi_arlock(axi_smc_M00_AXI_ARLOCK),
        .c0_ddr4_s_axi_arprot(axi_smc_M00_AXI_ARPROT),
        .c0_ddr4_s_axi_arqos(axi_smc_M00_AXI_ARQOS),
        .c0_ddr4_s_axi_arready(axi_smc_M00_AXI_ARREADY),
        .c0_ddr4_s_axi_arsize(axi_smc_M00_AXI_ARSIZE),
        .c0_ddr4_s_axi_arvalid(axi_smc_M00_AXI_ARVALID),
        .c0_ddr4_s_axi_awaddr(axi_smc_M00_AXI_AWADDR),
        .c0_ddr4_s_axi_awburst(axi_smc_M00_AXI_AWBURST),
        .c0_ddr4_s_axi_awcache(axi_smc_M00_AXI_AWCACHE),
        .c0_ddr4_s_axi_awid(1'b0),
        .c0_ddr4_s_axi_awlen(axi_smc_M00_AXI_AWLEN),
        .c0_ddr4_s_axi_awlock(axi_smc_M00_AXI_AWLOCK),
        .c0_ddr4_s_axi_awprot(axi_smc_M00_AXI_AWPROT),
        .c0_ddr4_s_axi_awqos(axi_smc_M00_AXI_AWQOS),
        .c0_ddr4_s_axi_awready(axi_smc_M00_AXI_AWREADY),
        .c0_ddr4_s_axi_awsize(axi_smc_M00_AXI_AWSIZE),
        .c0_ddr4_s_axi_awvalid(axi_smc_M00_AXI_AWVALID),
        .c0_ddr4_s_axi_bready(axi_smc_M00_AXI_BREADY),
        .c0_ddr4_s_axi_bresp(axi_smc_M00_AXI_BRESP),
        .c0_ddr4_s_axi_bvalid(axi_smc_M00_AXI_BVALID),
        .c0_ddr4_s_axi_ctrl_araddr(xdma_0_axi_periph_M01_AXI_ARADDR),
        .c0_ddr4_s_axi_ctrl_arready(xdma_0_axi_periph_M01_AXI_ARREADY),
        .c0_ddr4_s_axi_ctrl_arvalid(xdma_0_axi_periph_M01_AXI_ARVALID),
        .c0_ddr4_s_axi_ctrl_awaddr(xdma_0_axi_periph_M01_AXI_AWADDR),
        .c0_ddr4_s_axi_ctrl_awready(xdma_0_axi_periph_M01_AXI_AWREADY),
        .c0_ddr4_s_axi_ctrl_awvalid(xdma_0_axi_periph_M01_AXI_AWVALID),
        .c0_ddr4_s_axi_ctrl_bready(xdma_0_axi_periph_M01_AXI_BREADY),
        .c0_ddr4_s_axi_ctrl_bresp(xdma_0_axi_periph_M01_AXI_BRESP),
        .c0_ddr4_s_axi_ctrl_bvalid(xdma_0_axi_periph_M01_AXI_BVALID),
        .c0_ddr4_s_axi_ctrl_rdata(xdma_0_axi_periph_M01_AXI_RDATA),
        .c0_ddr4_s_axi_ctrl_rready(xdma_0_axi_periph_M01_AXI_RREADY),
        .c0_ddr4_s_axi_ctrl_rresp(xdma_0_axi_periph_M01_AXI_RRESP),
        .c0_ddr4_s_axi_ctrl_rvalid(xdma_0_axi_periph_M01_AXI_RVALID),
        .c0_ddr4_s_axi_ctrl_wdata(xdma_0_axi_periph_M01_AXI_WDATA),
        .c0_ddr4_s_axi_ctrl_wready(xdma_0_axi_periph_M01_AXI_WREADY),
        .c0_ddr4_s_axi_ctrl_wvalid(xdma_0_axi_periph_M01_AXI_WVALID),
        .c0_ddr4_s_axi_rdata(axi_smc_M00_AXI_RDATA),
        .c0_ddr4_s_axi_rlast(axi_smc_M00_AXI_RLAST),
        .c0_ddr4_s_axi_rready(axi_smc_M00_AXI_RREADY),
        .c0_ddr4_s_axi_rresp(axi_smc_M00_AXI_RRESP),
        .c0_ddr4_s_axi_rvalid(axi_smc_M00_AXI_RVALID),
        .c0_ddr4_s_axi_wdata(axi_smc_M00_AXI_WDATA),
        .c0_ddr4_s_axi_wlast(axi_smc_M00_AXI_WLAST),
        .c0_ddr4_s_axi_wready(axi_smc_M00_AXI_WREADY),
        .c0_ddr4_s_axi_wstrb(axi_smc_M00_AXI_WSTRB),
        .c0_ddr4_s_axi_wvalid(axi_smc_M00_AXI_WVALID),
        .c0_ddr4_ui_clk(ddr4_0_c0_ddr4_ui_clk),
        .c0_ddr4_ui_clk_sync_rst(ddr4_0_c0_ddr4_ui_clk_sync_rst),
        .c0_sys_clk_n(Conn1_CLK_N),
        .c0_sys_clk_p(Conn1_CLK_P),
        .sys_rst(util_vector_logic_0_Res));
  bd_eth10_capture_reset_ddr4_0_300m_0 reset_ddr4_0_300m
       (.aux_reset_in(1'b1),
        .dcm_locked(1'b1),
        .ext_reset_in(ddr4_0_c0_ddr4_ui_clk_sync_rst),
        .mb_debug_sys_rst(1'b0),
        .peripheral_aresetn(reset_ddr4_0_300m_peripheral_aresetn),
        .slowest_sync_clk(ddr4_0_c0_ddr4_ui_clk));
  bd_eth10_capture_util_ds_buf_0 util_ds_buf
       (.IBUF_DS_N(Conn4_CLK_N),
        .IBUF_DS_ODIV2(util_ds_buf_IBUF_DS_ODIV2),
        .IBUF_DS_P(Conn4_CLK_P),
        .IBUF_OUT(util_ds_buf_IBUF_OUT));
  bd_eth10_capture_util_vector_logic_0_2 util_vector_logic_0
       (.Op1(resetn_1),
        .Res(util_vector_logic_0_Res));
  bd_eth10_capture_xdma_0_0 xdma_0
       (.axi_aclk(xdma_0_axi_aclk),
        .axi_aresetn(xdma_0_axi_aresetn),
        .m_axi_araddr(xdma_0_M_AXI_ARADDR),
        .m_axi_arburst(xdma_0_M_AXI_ARBURST),
        .m_axi_arcache(xdma_0_M_AXI_ARCACHE),
        .m_axi_arid(xdma_0_M_AXI_ARID),
        .m_axi_arlen(xdma_0_M_AXI_ARLEN),
        .m_axi_arlock(xdma_0_M_AXI_ARLOCK),
        .m_axi_arprot(xdma_0_M_AXI_ARPROT),
        .m_axi_arready(xdma_0_M_AXI_ARREADY),
        .m_axi_arsize(xdma_0_M_AXI_ARSIZE),
        .m_axi_arvalid(xdma_0_M_AXI_ARVALID),
        .m_axi_awaddr(xdma_0_M_AXI_AWADDR),
        .m_axi_awburst(xdma_0_M_AXI_AWBURST),
        .m_axi_awcache(xdma_0_M_AXI_AWCACHE),
        .m_axi_awid(xdma_0_M_AXI_AWID),
        .m_axi_awlen(xdma_0_M_AXI_AWLEN),
        .m_axi_awlock(xdma_0_M_AXI_AWLOCK),
        .m_axi_awprot(xdma_0_M_AXI_AWPROT),
        .m_axi_awready(xdma_0_M_AXI_AWREADY),
        .m_axi_awsize(xdma_0_M_AXI_AWSIZE),
        .m_axi_awvalid(xdma_0_M_AXI_AWVALID),
        .m_axi_bid(xdma_0_M_AXI_BID),
        .m_axi_bready(xdma_0_M_AXI_BREADY),
        .m_axi_bresp(xdma_0_M_AXI_BRESP),
        .m_axi_bvalid(xdma_0_M_AXI_BVALID),
        .m_axi_rdata(xdma_0_M_AXI_RDATA),
        .m_axi_rid(xdma_0_M_AXI_RID),
        .m_axi_rlast(xdma_0_M_AXI_RLAST),
        .m_axi_rready(xdma_0_M_AXI_RREADY),
        .m_axi_rresp(xdma_0_M_AXI_RRESP),
        .m_axi_rvalid(xdma_0_M_AXI_RVALID),
        .m_axi_wdata(xdma_0_M_AXI_WDATA),
        .m_axi_wlast(xdma_0_M_AXI_WLAST),
        .m_axi_wready(xdma_0_M_AXI_WREADY),
        .m_axi_wstrb(xdma_0_M_AXI_WSTRB),
        .m_axi_wvalid(xdma_0_M_AXI_WVALID),
        .m_axil_araddr(xdma_0_M_AXI_LITE_ARADDR),
        .m_axil_arprot(xdma_0_M_AXI_LITE_ARPROT),
        .m_axil_arready(xdma_0_M_AXI_LITE_ARREADY),
        .m_axil_arvalid(xdma_0_M_AXI_LITE_ARVALID),
        .m_axil_awaddr(xdma_0_M_AXI_LITE_AWADDR),
        .m_axil_awprot(xdma_0_M_AXI_LITE_AWPROT),
        .m_axil_awready(xdma_0_M_AXI_LITE_AWREADY),
        .m_axil_awvalid(xdma_0_M_AXI_LITE_AWVALID),
        .m_axil_bready(xdma_0_M_AXI_LITE_BREADY),
        .m_axil_bresp(xdma_0_M_AXI_LITE_BRESP),
        .m_axil_bvalid(xdma_0_M_AXI_LITE_BVALID),
        .m_axil_rdata(xdma_0_M_AXI_LITE_RDATA),
        .m_axil_rready(xdma_0_M_AXI_LITE_RREADY),
        .m_axil_rresp(xdma_0_M_AXI_LITE_RRESP),
        .m_axil_rvalid(xdma_0_M_AXI_LITE_RVALID),
        .m_axil_wdata(xdma_0_M_AXI_LITE_WDATA),
        .m_axil_wready(xdma_0_M_AXI_LITE_WREADY),
        .m_axil_wstrb(xdma_0_M_AXI_LITE_WSTRB),
        .m_axil_wvalid(xdma_0_M_AXI_LITE_WVALID),
        .pci_exp_rxn(Conn3_rxn),
        .pci_exp_rxp(Conn3_rxp),
        .pci_exp_txn(Conn3_txn),
        .pci_exp_txp(Conn3_txp),
        .sys_clk(util_ds_buf_IBUF_DS_ODIV2),
        .sys_clk_gt(util_ds_buf_IBUF_OUT),
        .sys_rst_n(pcie_perstn_1),
        .usr_irq_req(xlconstant_0_dout));
  bd_eth10_capture_xdma_0_axi_periph_0 xdma_0_axi_periph
       (.ACLK(xdma_0_axi_aclk),
        .ARESETN(xdma_0_axi_aresetn),
        .M00_ACLK(xdma_0_axi_aclk),
        .M00_ARESETN(xdma_0_axi_aresetn),
        .M00_AXI_araddr(xdma_0_axi_periph_M00_AXI_ARADDR),
        .M00_AXI_arready(xdma_0_axi_periph_M00_AXI_ARREADY),
        .M00_AXI_arvalid(xdma_0_axi_periph_M00_AXI_ARVALID),
        .M00_AXI_awaddr(xdma_0_axi_periph_M00_AXI_AWADDR),
        .M00_AXI_awready(xdma_0_axi_periph_M00_AXI_AWREADY),
        .M00_AXI_awvalid(xdma_0_axi_periph_M00_AXI_AWVALID),
        .M00_AXI_bready(xdma_0_axi_periph_M00_AXI_BREADY),
        .M00_AXI_bresp(xdma_0_axi_periph_M00_AXI_BRESP),
        .M00_AXI_bvalid(xdma_0_axi_periph_M00_AXI_BVALID),
        .M00_AXI_rdata(xdma_0_axi_periph_M00_AXI_RDATA),
        .M00_AXI_rready(xdma_0_axi_periph_M00_AXI_RREADY),
        .M00_AXI_rresp(xdma_0_axi_periph_M00_AXI_RRESP),
        .M00_AXI_rvalid(xdma_0_axi_periph_M00_AXI_RVALID),
        .M00_AXI_wdata(xdma_0_axi_periph_M00_AXI_WDATA),
        .M00_AXI_wready(xdma_0_axi_periph_M00_AXI_WREADY),
        .M00_AXI_wstrb(xdma_0_axi_periph_M00_AXI_WSTRB),
        .M00_AXI_wvalid(xdma_0_axi_periph_M00_AXI_WVALID),
        .M01_ACLK(ddr4_0_c0_ddr4_ui_clk),
        .M01_ARESETN(reset_ddr4_0_300m_peripheral_aresetn),
        .M01_AXI_araddr(xdma_0_axi_periph_M01_AXI_ARADDR),
        .M01_AXI_arready(xdma_0_axi_periph_M01_AXI_ARREADY),
        .M01_AXI_arvalid(xdma_0_axi_periph_M01_AXI_ARVALID),
        .M01_AXI_awaddr(xdma_0_axi_periph_M01_AXI_AWADDR),
        .M01_AXI_awready(xdma_0_axi_periph_M01_AXI_AWREADY),
        .M01_AXI_awvalid(xdma_0_axi_periph_M01_AXI_AWVALID),
        .M01_AXI_bready(xdma_0_axi_periph_M01_AXI_BREADY),
        .M01_AXI_bresp(xdma_0_axi_periph_M01_AXI_BRESP),
        .M01_AXI_bvalid(xdma_0_axi_periph_M01_AXI_BVALID),
        .M01_AXI_rdata(xdma_0_axi_periph_M01_AXI_RDATA),
        .M01_AXI_rready(xdma_0_axi_periph_M01_AXI_RREADY),
        .M01_AXI_rresp(xdma_0_axi_periph_M01_AXI_RRESP),
        .M01_AXI_rvalid(xdma_0_axi_periph_M01_AXI_RVALID),
        .M01_AXI_wdata(xdma_0_axi_periph_M01_AXI_WDATA),
        .M01_AXI_wready(xdma_0_axi_periph_M01_AXI_WREADY),
        .M01_AXI_wvalid(xdma_0_axi_periph_M01_AXI_WVALID),
        .M02_ACLK(aclk2_1),
        .M02_ARESETN(M02_ARESETN_1),
        .M02_AXI_araddr(xdma_0_axi_periph_M02_AXI_ARADDR),
        .M02_AXI_arready(xdma_0_axi_periph_M02_AXI_ARREADY),
        .M02_AXI_arvalid(xdma_0_axi_periph_M02_AXI_ARVALID),
        .M02_AXI_awaddr(xdma_0_axi_periph_M02_AXI_AWADDR),
        .M02_AXI_awready(xdma_0_axi_periph_M02_AXI_AWREADY),
        .M02_AXI_awvalid(xdma_0_axi_periph_M02_AXI_AWVALID),
        .M02_AXI_bready(xdma_0_axi_periph_M02_AXI_BREADY),
        .M02_AXI_bresp(xdma_0_axi_periph_M02_AXI_BRESP),
        .M02_AXI_bvalid(xdma_0_axi_periph_M02_AXI_BVALID),
        .M02_AXI_rdata(xdma_0_axi_periph_M02_AXI_RDATA),
        .M02_AXI_rready(xdma_0_axi_periph_M02_AXI_RREADY),
        .M02_AXI_rresp(xdma_0_axi_periph_M02_AXI_RRESP),
        .M02_AXI_rvalid(xdma_0_axi_periph_M02_AXI_RVALID),
        .M02_AXI_wdata(xdma_0_axi_periph_M02_AXI_WDATA),
        .M02_AXI_wready(xdma_0_axi_periph_M02_AXI_WREADY),
        .M02_AXI_wstrb(xdma_0_axi_periph_M02_AXI_WSTRB),
        .M02_AXI_wvalid(xdma_0_axi_periph_M02_AXI_WVALID),
        .S00_ACLK(xdma_0_axi_aclk),
        .S00_ARESETN(xdma_0_axi_aresetn),
        .S00_AXI_araddr(xdma_0_M_AXI_LITE_ARADDR),
        .S00_AXI_arprot(xdma_0_M_AXI_LITE_ARPROT),
        .S00_AXI_arready(xdma_0_M_AXI_LITE_ARREADY),
        .S00_AXI_arvalid(xdma_0_M_AXI_LITE_ARVALID),
        .S00_AXI_awaddr(xdma_0_M_AXI_LITE_AWADDR),
        .S00_AXI_awprot(xdma_0_M_AXI_LITE_AWPROT),
        .S00_AXI_awready(xdma_0_M_AXI_LITE_AWREADY),
        .S00_AXI_awvalid(xdma_0_M_AXI_LITE_AWVALID),
        .S00_AXI_bready(xdma_0_M_AXI_LITE_BREADY),
        .S00_AXI_bresp(xdma_0_M_AXI_LITE_BRESP),
        .S00_AXI_bvalid(xdma_0_M_AXI_LITE_BVALID),
        .S00_AXI_rdata(xdma_0_M_AXI_LITE_RDATA),
        .S00_AXI_rready(xdma_0_M_AXI_LITE_RREADY),
        .S00_AXI_rresp(xdma_0_M_AXI_LITE_RRESP),
        .S00_AXI_rvalid(xdma_0_M_AXI_LITE_RVALID),
        .S00_AXI_wdata(xdma_0_M_AXI_LITE_WDATA),
        .S00_AXI_wready(xdma_0_M_AXI_LITE_WREADY),
        .S00_AXI_wstrb(xdma_0_M_AXI_LITE_WSTRB),
        .S00_AXI_wvalid(xdma_0_M_AXI_LITE_WVALID));
  bd_eth10_capture_xlconstant_0_2 xlconstant_0
       (.dout(xlconstant_0_dout));
endmodule

module s00_couplers_imp_1FM3V25
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arprot,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awprot,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  output [2:0]M_AXI_arprot;
  input [0:0]M_AXI_arready;
  output [0:0]M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  output [2:0]M_AXI_awprot;
  input [0:0]M_AXI_awready;
  output [0:0]M_AXI_awvalid;
  output [0:0]M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input [0:0]M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output [0:0]M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input [0:0]M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input [0:0]M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output [0:0]M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [2:0]S_AXI_arprot;
  output [0:0]S_AXI_arready;
  input [0:0]S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [2:0]S_AXI_awprot;
  output [0:0]S_AXI_awready;
  input [0:0]S_AXI_awvalid;
  input [0:0]S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output [0:0]S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input [0:0]S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output [0:0]S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output [0:0]S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input [0:0]S_AXI_wvalid;

  wire [31:0]s00_couplers_to_s00_couplers_ARADDR;
  wire [2:0]s00_couplers_to_s00_couplers_ARPROT;
  wire [0:0]s00_couplers_to_s00_couplers_ARREADY;
  wire [0:0]s00_couplers_to_s00_couplers_ARVALID;
  wire [31:0]s00_couplers_to_s00_couplers_AWADDR;
  wire [2:0]s00_couplers_to_s00_couplers_AWPROT;
  wire [0:0]s00_couplers_to_s00_couplers_AWREADY;
  wire [0:0]s00_couplers_to_s00_couplers_AWVALID;
  wire [0:0]s00_couplers_to_s00_couplers_BREADY;
  wire [1:0]s00_couplers_to_s00_couplers_BRESP;
  wire [0:0]s00_couplers_to_s00_couplers_BVALID;
  wire [31:0]s00_couplers_to_s00_couplers_RDATA;
  wire [0:0]s00_couplers_to_s00_couplers_RREADY;
  wire [1:0]s00_couplers_to_s00_couplers_RRESP;
  wire [0:0]s00_couplers_to_s00_couplers_RVALID;
  wire [31:0]s00_couplers_to_s00_couplers_WDATA;
  wire [0:0]s00_couplers_to_s00_couplers_WREADY;
  wire [3:0]s00_couplers_to_s00_couplers_WSTRB;
  wire [0:0]s00_couplers_to_s00_couplers_WVALID;

  assign M_AXI_araddr[31:0] = s00_couplers_to_s00_couplers_ARADDR;
  assign M_AXI_arprot[2:0] = s00_couplers_to_s00_couplers_ARPROT;
  assign M_AXI_arvalid[0] = s00_couplers_to_s00_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = s00_couplers_to_s00_couplers_AWADDR;
  assign M_AXI_awprot[2:0] = s00_couplers_to_s00_couplers_AWPROT;
  assign M_AXI_awvalid[0] = s00_couplers_to_s00_couplers_AWVALID;
  assign M_AXI_bready[0] = s00_couplers_to_s00_couplers_BREADY;
  assign M_AXI_rready[0] = s00_couplers_to_s00_couplers_RREADY;
  assign M_AXI_wdata[31:0] = s00_couplers_to_s00_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = s00_couplers_to_s00_couplers_WSTRB;
  assign M_AXI_wvalid[0] = s00_couplers_to_s00_couplers_WVALID;
  assign S_AXI_arready[0] = s00_couplers_to_s00_couplers_ARREADY;
  assign S_AXI_awready[0] = s00_couplers_to_s00_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = s00_couplers_to_s00_couplers_BRESP;
  assign S_AXI_bvalid[0] = s00_couplers_to_s00_couplers_BVALID;
  assign S_AXI_rdata[31:0] = s00_couplers_to_s00_couplers_RDATA;
  assign S_AXI_rresp[1:0] = s00_couplers_to_s00_couplers_RRESP;
  assign S_AXI_rvalid[0] = s00_couplers_to_s00_couplers_RVALID;
  assign S_AXI_wready[0] = s00_couplers_to_s00_couplers_WREADY;
  assign s00_couplers_to_s00_couplers_ARADDR = S_AXI_araddr[31:0];
  assign s00_couplers_to_s00_couplers_ARPROT = S_AXI_arprot[2:0];
  assign s00_couplers_to_s00_couplers_ARREADY = M_AXI_arready[0];
  assign s00_couplers_to_s00_couplers_ARVALID = S_AXI_arvalid[0];
  assign s00_couplers_to_s00_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign s00_couplers_to_s00_couplers_AWPROT = S_AXI_awprot[2:0];
  assign s00_couplers_to_s00_couplers_AWREADY = M_AXI_awready[0];
  assign s00_couplers_to_s00_couplers_AWVALID = S_AXI_awvalid[0];
  assign s00_couplers_to_s00_couplers_BREADY = S_AXI_bready[0];
  assign s00_couplers_to_s00_couplers_BRESP = M_AXI_bresp[1:0];
  assign s00_couplers_to_s00_couplers_BVALID = M_AXI_bvalid[0];
  assign s00_couplers_to_s00_couplers_RDATA = M_AXI_rdata[31:0];
  assign s00_couplers_to_s00_couplers_RREADY = S_AXI_rready[0];
  assign s00_couplers_to_s00_couplers_RRESP = M_AXI_rresp[1:0];
  assign s00_couplers_to_s00_couplers_RVALID = M_AXI_rvalid[0];
  assign s00_couplers_to_s00_couplers_WDATA = S_AXI_wdata[31:0];
  assign s00_couplers_to_s00_couplers_WREADY = M_AXI_wready[0];
  assign s00_couplers_to_s00_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign s00_couplers_to_s00_couplers_WVALID = S_AXI_wvalid[0];
endmodule

module xgmii_to_axis_imp_GIHUUE
   (CAP_PUSH,
    CLEAR_ERR,
    CLOCK_CNT,
    ERR_FCS,
    ERR_FULL,
    ERR_LONG,
    FCS_CORRECT,
    FCS_EN,
    IN_RXD,
    IN_RXLEN,
    KEEP_ERROR_PACKET,
    OV_tdata,
    OV_tlast,
    OV_tready,
    OV_tvalid,
    TEST_PKT,
    TEST_PKT_SIZE,
    XGMII_CLK,
    XGMII_RESETN);
  output [11:0]CAP_PUSH;
  input CLEAR_ERR;
  input [63:0]CLOCK_CNT;
  output [7:0]ERR_FCS;
  output [7:0]ERR_FULL;
  output [7:0]ERR_LONG;
  input FCS_CORRECT;
  input FCS_EN;
  input [63:0]IN_RXD;
  input [3:0]IN_RXLEN;
  input KEEP_ERROR_PACKET;
  output [63:0]OV_tdata;
  output [0:0]OV_tlast;
  input OV_tready;
  output OV_tvalid;
  input TEST_PKT;
  input [15:0]TEST_PKT_SIZE;
  input XGMII_CLK;
  input XGMII_RESETN;

  wire CLEAR_ERR_1;
  wire [63:0]CLOCK_CNT_0_1;
  wire FCS_CORRECT_1;
  wire FCS_EN_1;
  wire [63:0]IN_RXD_1;
  wire [3:0]IN_RXLEN_1;
  wire KEEP_ERROR_PACKET_0_1;
  wire [15:0]PKTLEN_1;
  wire STARTBTN_1;
  wire XGMII_CLK_1;
  wire XGMII_RESETN_1;
  wire [63:0]add_packet_header_0_PKT_TDATA;
  wire add_packet_header_0_PKT_TLAST;
  wire add_packet_header_0_PKT_TREADY;
  wire add_packet_header_0_PKT_TVALID;
  wire [63:0]axis_fifo_0_OV1_TDATA;
  wire [0:0]axis_fifo_0_OV1_TLAST;
  wire axis_fifo_0_OV1_TREADY;
  wire axis_fifo_0_OV1_TVALID;
  wire [63:0]axis_fifo_0_OV_TDATA;
  wire axis_fifo_0_OV_TREADY;
  wire axis_fifo_0_OV_TVALID;
  wire [11:0]axis_fifo_pdata_CAP_PUSH;
  wire [63:0]axis_fifo_pinfo_OV_TDATA;
  wire axis_fifo_pinfo_OV_TREADY;
  wire axis_fifo_pinfo_OV_TVALID;
  wire [7:0]err_counter_fcs_OVAL;
  wire [7:0]err_counter_full_OVAL;
  wire [63:0]get_packet_info_0_DATA_TDATA;
  wire get_packet_info_0_DATA_TREADY;
  wire get_packet_info_0_DATA_TVALID;
  wire get_packet_info_0_ERR_DROP;
  wire get_packet_info_0_ERR_FCS;
  wire get_packet_info_0_ERR_INCOMPLETE;
  wire [63:0]get_packet_info_0_INFO_TDATA;
  wire get_packet_info_0_INFO_TREADY;
  wire get_packet_info_0_INFO_TVALID;
  wire testpat_rx_0_OUT_FCS_CORRECT;
  wire testpat_rx_0_OUT_FCS_EN;
  wire [63:0]testpat_rx_0_OUT_RXD;
  wire [3:0]testpat_rx_0_OUT_RXLEN;
  wire [0:0]util_vector_logic_0_Res;
  wire [7:0]xlconstant_0_dout;

  assign CAP_PUSH[11:0] = axis_fifo_pdata_CAP_PUSH;
  assign CLEAR_ERR_1 = CLEAR_ERR;
  assign CLOCK_CNT_0_1 = CLOCK_CNT[63:0];
  assign ERR_FCS[7:0] = err_counter_fcs_OVAL;
  assign ERR_FULL[7:0] = err_counter_full_OVAL;
  assign ERR_LONG[7:0] = xlconstant_0_dout;
  assign FCS_CORRECT_1 = FCS_CORRECT;
  assign FCS_EN_1 = FCS_EN;
  assign IN_RXD_1 = IN_RXD[63:0];
  assign IN_RXLEN_1 = IN_RXLEN[3:0];
  assign KEEP_ERROR_PACKET_0_1 = KEEP_ERROR_PACKET;
  assign OV_tdata[63:0] = axis_fifo_0_OV1_TDATA;
  assign OV_tlast[0] = axis_fifo_0_OV1_TLAST;
  assign OV_tvalid = axis_fifo_0_OV1_TVALID;
  assign PKTLEN_1 = TEST_PKT_SIZE[15:0];
  assign STARTBTN_1 = TEST_PKT;
  assign XGMII_CLK_1 = XGMII_CLK;
  assign XGMII_RESETN_1 = XGMII_RESETN;
  assign axis_fifo_0_OV1_TREADY = OV_tready;
  bd_eth10_capture_add_packet_header_0_0 add_packet_header_0
       (.CLK(XGMII_CLK_1),
        .DATA_TDATA(axis_fifo_0_OV_TDATA),
        .DATA_TREADY(axis_fifo_0_OV_TREADY),
        .DATA_TVALID(axis_fifo_0_OV_TVALID),
        .INFO_TDATA(axis_fifo_pinfo_OV_TDATA),
        .INFO_TREADY(axis_fifo_pinfo_OV_TREADY),
        .INFO_TVALID(axis_fifo_pinfo_OV_TVALID),
        .KEEP_ERROR_PACKET(KEEP_ERROR_PACKET_0_1),
        .PKT_TDATA(add_packet_header_0_PKT_TDATA),
        .PKT_TLAST(add_packet_header_0_PKT_TLAST),
        .PKT_TREADY(add_packet_header_0_PKT_TREADY),
        .PKT_TVALID(add_packet_header_0_PKT_TVALID),
        .RESETN(XGMII_RESETN_1));
  bd_eth10_capture_axis_fifo_pdata_0 axis_fifo_pdata
       (.CAP_PUSH(axis_fifo_pdata_CAP_PUSH),
        .CLK(XGMII_CLK_1),
        .IV_TDATA(get_packet_info_0_DATA_TDATA),
        .IV_TID(1'b0),
        .IV_TKEEP(1'b1),
        .IV_TLAST(1'b0),
        .IV_TREADY(get_packet_info_0_DATA_TREADY),
        .IV_TUSER(1'b0),
        .IV_TVALID(get_packet_info_0_DATA_TVALID),
        .OV_TDATA(axis_fifo_0_OV_TDATA),
        .OV_TREADY(axis_fifo_0_OV_TREADY),
        .OV_TVALID(axis_fifo_0_OV_TVALID),
        .RESETN(XGMII_RESETN_1));
  bd_eth10_capture_axis_fifo_pinfo_0 axis_fifo_pinfo
       (.CLK(XGMII_CLK_1),
        .IV_TDATA(get_packet_info_0_INFO_TDATA),
        .IV_TID(1'b0),
        .IV_TKEEP(1'b1),
        .IV_TLAST(1'b0),
        .IV_TREADY(get_packet_info_0_INFO_TREADY),
        .IV_TUSER(1'b0),
        .IV_TVALID(get_packet_info_0_INFO_TVALID),
        .OV_TDATA(axis_fifo_pinfo_OV_TDATA),
        .OV_TREADY(axis_fifo_pinfo_OV_TREADY),
        .OV_TVALID(axis_fifo_pinfo_OV_TVALID),
        .RESETN(XGMII_RESETN_1));
  bd_eth10_capture_axis_fifo_pkt_0 axis_fifo_pkt
       (.CLK(XGMII_CLK_1),
        .IV_TDATA(add_packet_header_0_PKT_TDATA),
        .IV_TID(1'b0),
        .IV_TKEEP(1'b1),
        .IV_TLAST(add_packet_header_0_PKT_TLAST),
        .IV_TREADY(add_packet_header_0_PKT_TREADY),
        .IV_TUSER(1'b0),
        .IV_TVALID(add_packet_header_0_PKT_TVALID),
        .OV_TDATA(axis_fifo_0_OV1_TDATA),
        .OV_TLAST(axis_fifo_0_OV1_TLAST),
        .OV_TREADY(axis_fifo_0_OV1_TREADY),
        .OV_TVALID(axis_fifo_0_OV1_TVALID),
        .RESETN(XGMII_RESETN_1));
  bd_eth10_capture_err_counter_fcs_0 err_counter_fcs
       (.CLEAR_ERR(CLEAR_ERR_1),
        .CLK(XGMII_CLK_1),
        .IVAL(get_packet_info_0_ERR_FCS),
        .OVAL(err_counter_fcs_OVAL),
        .RESETN(XGMII_RESETN_1));
  bd_eth10_capture_err_counter_full_0 err_counter_full
       (.CLEAR_ERR(CLEAR_ERR_1),
        .CLK(XGMII_CLK_1),
        .IVAL(util_vector_logic_0_Res),
        .OVAL(err_counter_full_OVAL),
        .RESETN(XGMII_RESETN_1));
  bd_eth10_capture_get_packet_info_0_0 get_packet_info_0
       (.CLK(XGMII_CLK_1),
        .CLOCK_CNT(CLOCK_CNT_0_1),
        .DATA_TDATA(get_packet_info_0_DATA_TDATA),
        .DATA_TREADY(get_packet_info_0_DATA_TREADY),
        .DATA_TVALID(get_packet_info_0_DATA_TVALID),
        .ERR_DROP(get_packet_info_0_ERR_DROP),
        .ERR_FCS(get_packet_info_0_ERR_FCS),
        .ERR_INCOMPLETE(get_packet_info_0_ERR_INCOMPLETE),
        .FCS_CORRECT(testpat_rx_0_OUT_FCS_CORRECT),
        .FCS_EN(testpat_rx_0_OUT_FCS_EN),
        .INFO_TDATA(get_packet_info_0_INFO_TDATA),
        .INFO_TREADY(get_packet_info_0_INFO_TREADY),
        .INFO_TVALID(get_packet_info_0_INFO_TVALID),
        .RESETN(XGMII_RESETN_1),
        .XGMII_D(testpat_rx_0_OUT_RXD),
        .XGMII_LEN(testpat_rx_0_OUT_RXLEN));
  bd_eth10_capture_testpat_rx_0_0 testpat_rx_0
       (.CLK(XGMII_CLK_1),
        .IN_FCS_CORRECT(FCS_CORRECT_1),
        .IN_FCS_EN(FCS_EN_1),
        .IN_RXD(IN_RXD_1),
        .IN_RXLEN(IN_RXLEN_1),
        .OUT_FCS_CORRECT(testpat_rx_0_OUT_FCS_CORRECT),
        .OUT_FCS_EN(testpat_rx_0_OUT_FCS_EN),
        .OUT_RXD(testpat_rx_0_OUT_RXD),
        .OUT_RXLEN(testpat_rx_0_OUT_RXLEN),
        .PKTLEN(PKTLEN_1),
        .RESETN(XGMII_RESETN_1),
        .STARTBTN(STARTBTN_1));
  bd_eth10_capture_util_vector_logic_0_1 util_vector_logic_0
       (.Op1(get_packet_info_0_ERR_DROP),
        .Op2(get_packet_info_0_ERR_INCOMPLETE),
        .Res(util_vector_logic_0_Res));
  bd_eth10_capture_xlconstant_0_1 xlconstant_0
       (.dout(xlconstant_0_dout));
endmodule
