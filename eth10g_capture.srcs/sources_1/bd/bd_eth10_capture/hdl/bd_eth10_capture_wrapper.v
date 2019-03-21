//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
//Date        : Fri Mar 22 01:48:09 2019
//Host        : habuild running 64-bit Ubuntu 16.04.6 LTS
//Command     : generate_target bd_eth10_capture_wrapper.bd
//Design      : bd_eth10_capture_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module bd_eth10_capture_wrapper
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
  input MGTCLK0_0_clk_n;
  input MGTCLK0_0_clk_p;
  input SFP1_RX_N_0;
  input SFP1_RX_P_0;
  output SFP1_TX_N_0;
  output SFP1_TX_P_0;
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
  input resetn;

  wire I2C_SCL;
  wire I2C_SDA;
  wire MGTCLK0_0_clk_n;
  wire MGTCLK0_0_clk_p;
  wire SFP1_RX_N_0;
  wire SFP1_RX_P_0;
  wire SFP1_TX_N_0;
  wire SFP1_TX_P_0;
  wire ddr4_sdram_c0_act_n;
  wire [16:0]ddr4_sdram_c0_adr;
  wire [1:0]ddr4_sdram_c0_ba;
  wire ddr4_sdram_c0_bg;
  wire ddr4_sdram_c0_ck_c;
  wire ddr4_sdram_c0_ck_t;
  wire ddr4_sdram_c0_cke;
  wire [1:0]ddr4_sdram_c0_cs_n;
  wire [8:0]ddr4_sdram_c0_dm_n;
  wire [71:0]ddr4_sdram_c0_dq;
  wire [8:0]ddr4_sdram_c0_dqs_c;
  wire [8:0]ddr4_sdram_c0_dqs_t;
  wire ddr4_sdram_c0_odt;
  wire ddr4_sdram_c0_reset_n;
  wire default_300mhz_clk0_clk_n;
  wire default_300mhz_clk0_clk_p;
  wire [7:0]led_8bits_tri_o;
  wire [7:0]pci_express_x8_rxn;
  wire [7:0]pci_express_x8_rxp;
  wire [7:0]pci_express_x8_txn;
  wire [7:0]pci_express_x8_txp;
  wire pcie_perstn;
  wire pcie_refclk_clk_n;
  wire pcie_refclk_clk_p;
  wire resetn;

  bd_eth10_capture bd_eth10_capture_i
       (.I2C_SCL(I2C_SCL),
        .I2C_SDA(I2C_SDA),
        .MGTCLK0_0_clk_n(MGTCLK0_0_clk_n),
        .MGTCLK0_0_clk_p(MGTCLK0_0_clk_p),
        .SFP1_RX_N_0(SFP1_RX_N_0),
        .SFP1_RX_P_0(SFP1_RX_P_0),
        .SFP1_TX_N_0(SFP1_TX_N_0),
        .SFP1_TX_P_0(SFP1_TX_P_0),
        .ddr4_sdram_c0_act_n(ddr4_sdram_c0_act_n),
        .ddr4_sdram_c0_adr(ddr4_sdram_c0_adr),
        .ddr4_sdram_c0_ba(ddr4_sdram_c0_ba),
        .ddr4_sdram_c0_bg(ddr4_sdram_c0_bg),
        .ddr4_sdram_c0_ck_c(ddr4_sdram_c0_ck_c),
        .ddr4_sdram_c0_ck_t(ddr4_sdram_c0_ck_t),
        .ddr4_sdram_c0_cke(ddr4_sdram_c0_cke),
        .ddr4_sdram_c0_cs_n(ddr4_sdram_c0_cs_n),
        .ddr4_sdram_c0_dm_n(ddr4_sdram_c0_dm_n),
        .ddr4_sdram_c0_dq(ddr4_sdram_c0_dq),
        .ddr4_sdram_c0_dqs_c(ddr4_sdram_c0_dqs_c),
        .ddr4_sdram_c0_dqs_t(ddr4_sdram_c0_dqs_t),
        .ddr4_sdram_c0_odt(ddr4_sdram_c0_odt),
        .ddr4_sdram_c0_reset_n(ddr4_sdram_c0_reset_n),
        .default_300mhz_clk0_clk_n(default_300mhz_clk0_clk_n),
        .default_300mhz_clk0_clk_p(default_300mhz_clk0_clk_p),
        .led_8bits_tri_o(led_8bits_tri_o),
        .pci_express_x8_rxn(pci_express_x8_rxn),
        .pci_express_x8_rxp(pci_express_x8_rxp),
        .pci_express_x8_txn(pci_express_x8_txn),
        .pci_express_x8_txp(pci_express_x8_txp),
        .pcie_perstn(pcie_perstn),
        .pcie_refclk_clk_n(pcie_refclk_clk_n),
        .pcie_refclk_clk_p(pcie_refclk_clk_p),
        .resetn(resetn));
endmodule
