
################################################################
# This is a generated script based on design: bd_eth10_capture
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2018.2
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source bd_eth10_capture_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# axis_fifo, axis_fifo, axis_fifo, axis_fifo, axis_fifo, axis_fork, axis_fork, gen_datamover_wcmd, get_word_count, groupify_wordcnt, rx_wrmem_status, update_packet_delim, axilite_regs, rx_wrmem_regs, fanctrl_init, i2c_master, add_packet_header, axis_fifo, axis_fifo, axis_fifo, err_counter, err_counter, get_packet_info, testpat_rx, address_mac_ip, eth_ctrl, testpat_xgmii_rx, xgmii_fcs, xgmii_test_server

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xcku115-flvb2104-2-e
   set_property BOARD_PART xilinx.com:kcu1500:part0:1.1 [current_project]
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name bd_eth10_capture

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################


# Hierarchical cell: eth_0
proc create_hier_cell_eth_0 { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_eth_0() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 MGTCLK0

  # Create pins
  create_bd_pin -dir O -type clk DBG_CLK
  create_bd_pin -dir O -from 1 -to 0 DEBUG_OUT
  create_bd_pin -dir O FCS_CORRECT
  create_bd_pin -dir O FCS_EN
  create_bd_pin -dir I -from 15 -to 0 GAPLEN
  create_bd_pin -dir I -from 15 -to 0 PKTLEN
  create_bd_pin -dir O -from 63 -to 0 RXD
  create_bd_pin -dir O -from 3 -to 0 RXLEN
  create_bd_pin -dir I SFP1_RX_N
  create_bd_pin -dir I SFP1_RX_P
  create_bd_pin -dir O SFP1_TX_N
  create_bd_pin -dir O SFP1_TX_P
  create_bd_pin -dir I STARTBTN
  create_bd_pin -dir O -type rst areset_coreclk_out
  create_bd_pin -dir O -type rst areset_datapathclk_out
  create_bd_pin -dir O -type clk coreclk_out
  create_bd_pin -dir I -type clk dclk
  create_bd_pin -dir O -type rst gtrxreset_out
  create_bd_pin -dir O -type rst gttxreset_out
  create_bd_pin -dir O qpll0lock_out
  create_bd_pin -dir O -type clk qpll0outclk_out
  create_bd_pin -dir O -type clk qpll0outrefclk_out
  create_bd_pin -dir I -type rst reset
  create_bd_pin -dir O reset_counter_done_out
  create_bd_pin -dir O txuserrdy_out
  create_bd_pin -dir O -type clk txusrclk2_out
  create_bd_pin -dir O -type clk txusrclk_out

  # Create instance: address_mac_ip_0, and set properties
  set block_name address_mac_ip
  set block_cell_name address_mac_ip_0
  if { [catch {set address_mac_ip_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $address_mac_ip_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: eth_ctrl_0, and set properties
  set block_name eth_ctrl
  set block_cell_name eth_ctrl_0
  if { [catch {set eth_ctrl_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $eth_ctrl_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: system_ila_0, and set properties
  set system_ila_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:system_ila:1.1 system_ila_0 ]
  set_property -dict [ list \
   CONFIG.C_MON_TYPE {NATIVE} \
   CONFIG.C_NUM_OF_PROBES {6} \
 ] $system_ila_0

  # Create instance: ten_gig_eth_pcs_pma_0, and set properties
  set ten_gig_eth_pcs_pma_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:ten_gig_eth_pcs_pma:6.0 ten_gig_eth_pcs_pma_0 ]
  set_property -dict [ list \
   CONFIG.Locations {X0Y12} \
   CONFIG.RefClk {clk0} \
   CONFIG.SupportLevel {1} \
   CONFIG.base_kr {BASE-R} \
   CONFIG.no_ebuff {false} \
 ] $ten_gig_eth_pcs_pma_0

  # Create instance: testpat_xgmii_rx_0, and set properties
  set block_name testpat_xgmii_rx
  set block_cell_name testpat_xgmii_rx_0
  if { [catch {set testpat_xgmii_rx_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $testpat_xgmii_rx_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: xgmii_fcs_0, and set properties
  set block_name xgmii_fcs
  set block_cell_name xgmii_fcs_0
  if { [catch {set xgmii_fcs_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $xgmii_fcs_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: xgmii_test_server_0, and set properties
  set block_name xgmii_test_server
  set block_cell_name xgmii_test_server_0
  if { [catch {set xgmii_test_server_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $xgmii_test_server_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0} \
 ] $xlconstant_0

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins MGTCLK0] [get_bd_intf_pins ten_gig_eth_pcs_pma_0/refclk_diff_port]
  connect_bd_intf_net -intf_net ten_gig_eth_pcs_pma_0_core_to_gt_drp [get_bd_intf_pins ten_gig_eth_pcs_pma_0/core_to_gt_drp] [get_bd_intf_pins ten_gig_eth_pcs_pma_0/gt_drp]

  # Create port connections
  connect_bd_net -net CLK_1 [get_bd_pins txusrclk2_out] [get_bd_pins system_ila_0/clk] [get_bd_pins ten_gig_eth_pcs_pma_0/txusrclk2_out] [get_bd_pins testpat_xgmii_rx_0/CLK] [get_bd_pins xgmii_fcs_0/CLK] [get_bd_pins xgmii_test_server_0/CLK]
  connect_bd_net -net GAPLEN_0_1 [get_bd_pins GAPLEN] [get_bd_pins testpat_xgmii_rx_0/GAPLEN]
  connect_bd_net -net PKTLEN_0_1 [get_bd_pins PKTLEN] [get_bd_pins testpat_xgmii_rx_0/PKTLEN]
  connect_bd_net -net SFP1_RX_N_1 [get_bd_pins SFP1_RX_N] [get_bd_pins ten_gig_eth_pcs_pma_0/rxn]
  connect_bd_net -net SFP1_RX_P_1 [get_bd_pins SFP1_RX_P] [get_bd_pins ten_gig_eth_pcs_pma_0/rxp]
  connect_bd_net -net STARTBTN_0_1 [get_bd_pins STARTBTN] [get_bd_pins testpat_xgmii_rx_0/STARTBTN]
  connect_bd_net -net address_mac_ip_0_IP_ADDR [get_bd_pins address_mac_ip_0/IP_ADDR] [get_bd_pins xgmii_test_server_0/LOCAL_IP]
  connect_bd_net -net address_mac_ip_0_MAC_ADDR [get_bd_pins address_mac_ip_0/MAC_ADDR] [get_bd_pins xgmii_test_server_0/LOCAL_MAC]
  connect_bd_net -net dclk_1 [get_bd_pins dclk] [get_bd_pins ten_gig_eth_pcs_pma_0/dclk]
  connect_bd_net -net eth_ctrl_0_clken [get_bd_pins eth_ctrl_0/clken] [get_bd_pins xgmii_test_server_0/CLOCK_EN]
  connect_bd_net -net eth_ctrl_0_mdc [get_bd_pins eth_ctrl_0/mdc] [get_bd_pins ten_gig_eth_pcs_pma_0/mdc]
  connect_bd_net -net eth_ctrl_0_mdio_w [get_bd_pins eth_ctrl_0/mdio_w] [get_bd_pins ten_gig_eth_pcs_pma_0/mdio_in]
  connect_bd_net -net eth_ctrl_0_pma_pmd_type [get_bd_pins eth_ctrl_0/pma_pmd_type] [get_bd_pins ten_gig_eth_pcs_pma_0/pma_pmd_type]
  connect_bd_net -net eth_ctrl_0_prtad [get_bd_pins eth_ctrl_0/prtad] [get_bd_pins ten_gig_eth_pcs_pma_0/prtad]
  connect_bd_net -net eth_ctrl_0_signal_detect [get_bd_pins eth_ctrl_0/signal_detect] [get_bd_pins ten_gig_eth_pcs_pma_0/signal_detect]
  connect_bd_net -net eth_ctrl_0_sim_speedup_control [get_bd_pins eth_ctrl_0/sim_speedup_control] [get_bd_pins ten_gig_eth_pcs_pma_0/sim_speedup_control]
  connect_bd_net -net eth_ctrl_0_tx_fault [get_bd_pins eth_ctrl_0/tx_fault] [get_bd_pins ten_gig_eth_pcs_pma_0/tx_fault]
  connect_bd_net -net reset_2 [get_bd_pins reset] [get_bd_pins ten_gig_eth_pcs_pma_0/reset]
  connect_bd_net -net ten_gig_eth_pcs_pma_0_areset_coreclk_out [get_bd_pins areset_coreclk_out] [get_bd_pins ten_gig_eth_pcs_pma_0/areset_coreclk_out]
  connect_bd_net -net ten_gig_eth_pcs_pma_0_areset_datapathclk_out [get_bd_pins areset_datapathclk_out] [get_bd_pins ten_gig_eth_pcs_pma_0/areset_datapathclk_out] [get_bd_pins testpat_xgmii_rx_0/RESET] [get_bd_pins xgmii_fcs_0/RESET] [get_bd_pins xgmii_test_server_0/RESET]
  connect_bd_net -net ten_gig_eth_pcs_pma_0_coreclk_out [get_bd_pins coreclk_out] [get_bd_pins ten_gig_eth_pcs_pma_0/coreclk_out]
  connect_bd_net -net ten_gig_eth_pcs_pma_0_drp_req [get_bd_pins ten_gig_eth_pcs_pma_0/drp_gnt] [get_bd_pins ten_gig_eth_pcs_pma_0/drp_req]
  connect_bd_net -net ten_gig_eth_pcs_pma_0_gtrxreset_out [get_bd_pins gtrxreset_out] [get_bd_pins ten_gig_eth_pcs_pma_0/gtrxreset_out]
  connect_bd_net -net ten_gig_eth_pcs_pma_0_gttxreset_out [get_bd_pins gttxreset_out] [get_bd_pins ten_gig_eth_pcs_pma_0/gttxreset_out]
  connect_bd_net -net ten_gig_eth_pcs_pma_0_qpll0lock_out [get_bd_pins qpll0lock_out] [get_bd_pins ten_gig_eth_pcs_pma_0/qpll0lock_out]
  connect_bd_net -net ten_gig_eth_pcs_pma_0_qpll0outclk_out [get_bd_pins qpll0outclk_out] [get_bd_pins ten_gig_eth_pcs_pma_0/qpll0outclk_out]
  connect_bd_net -net ten_gig_eth_pcs_pma_0_qpll0outrefclk_out [get_bd_pins qpll0outrefclk_out] [get_bd_pins ten_gig_eth_pcs_pma_0/qpll0outrefclk_out]
  connect_bd_net -net ten_gig_eth_pcs_pma_0_reset_counter_done_out [get_bd_pins reset_counter_done_out] [get_bd_pins ten_gig_eth_pcs_pma_0/reset_counter_done_out]
  connect_bd_net -net ten_gig_eth_pcs_pma_0_rxrecclk_out [get_bd_pins DBG_CLK] [get_bd_pins ten_gig_eth_pcs_pma_0/rxrecclk_out]
  connect_bd_net -net ten_gig_eth_pcs_pma_0_txn [get_bd_pins SFP1_TX_N] [get_bd_pins ten_gig_eth_pcs_pma_0/txn]
  connect_bd_net -net ten_gig_eth_pcs_pma_0_txp [get_bd_pins SFP1_TX_P] [get_bd_pins ten_gig_eth_pcs_pma_0/txp]
  connect_bd_net -net ten_gig_eth_pcs_pma_0_txuserrdy_out [get_bd_pins txuserrdy_out] [get_bd_pins ten_gig_eth_pcs_pma_0/txuserrdy_out]
  connect_bd_net -net ten_gig_eth_pcs_pma_0_txusrclk_out [get_bd_pins txusrclk_out] [get_bd_pins ten_gig_eth_pcs_pma_0/txusrclk_out]
  connect_bd_net -net ten_gig_eth_pcs_pma_0_xgmii_rxc [get_bd_pins system_ila_0/probe0] [get_bd_pins testpat_xgmii_rx_0/OUT_RXC] [get_bd_pins xgmii_fcs_0/XGMII_RXC]
  connect_bd_net -net ten_gig_eth_pcs_pma_0_xgmii_rxc1 [get_bd_pins ten_gig_eth_pcs_pma_0/xgmii_rxc] [get_bd_pins testpat_xgmii_rx_0/IN_RXC]
  connect_bd_net -net ten_gig_eth_pcs_pma_0_xgmii_rxd [get_bd_pins system_ila_0/probe1] [get_bd_pins testpat_xgmii_rx_0/OUT_RXD] [get_bd_pins xgmii_fcs_0/XGMII_RXD]
  connect_bd_net -net ten_gig_eth_pcs_pma_0_xgmii_rxd1 [get_bd_pins ten_gig_eth_pcs_pma_0/xgmii_rxd] [get_bd_pins testpat_xgmii_rx_0/IN_RXD]
  connect_bd_net -net xgmii_fcs_0_DEBUG_ALIGN [get_bd_pins DEBUG_OUT] [get_bd_pins xgmii_fcs_0/DEBUG_ALIGN]
  connect_bd_net -net xgmii_fcs_0_FCS_CORRECT [get_bd_pins FCS_CORRECT] [get_bd_pins system_ila_0/probe5] [get_bd_pins xgmii_fcs_0/FCS_CORRECT]
  connect_bd_net -net xgmii_fcs_0_FCS_EN [get_bd_pins FCS_EN] [get_bd_pins system_ila_0/probe4] [get_bd_pins xgmii_fcs_0/FCS_EN]
  connect_bd_net -net xgmii_fcs_0_RXD_OUT [get_bd_pins RXD] [get_bd_pins system_ila_0/probe3] [get_bd_pins xgmii_fcs_0/RXD_OUT] [get_bd_pins xgmii_test_server_0/RXD_IN]
  connect_bd_net -net xgmii_fcs_0_RXLEN_OUT [get_bd_pins RXLEN] [get_bd_pins system_ila_0/probe2] [get_bd_pins xgmii_fcs_0/RXLEN_OUT] [get_bd_pins xgmii_test_server_0/RXLEN_IN]
  connect_bd_net -net xgmii_fcs_0_XGMII_TXC [get_bd_pins ten_gig_eth_pcs_pma_0/xgmii_txc] [get_bd_pins xgmii_fcs_0/XGMII_TXC]
  connect_bd_net -net xgmii_fcs_0_XGMII_TXD [get_bd_pins ten_gig_eth_pcs_pma_0/xgmii_txd] [get_bd_pins xgmii_fcs_0/XGMII_TXD]
  connect_bd_net -net xgmii_test_server_0_TXD_OUT [get_bd_pins xgmii_fcs_0/TXD_IN] [get_bd_pins xgmii_test_server_0/TXD_OUT]
  connect_bd_net -net xgmii_test_server_0_TXLEN_OUT [get_bd_pins xgmii_fcs_0/TXLEN_IN] [get_bd_pins xgmii_test_server_0/TXLEN_OUT]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins eth_ctrl_0/rx_loss] [get_bd_pins xlconstant_0/dout]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: xgmii_to_axis
proc create_hier_cell_xgmii_to_axis { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_xgmii_to_axis() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 OV

  # Create pins
  create_bd_pin -dir O -from 11 -to 0 CAP_PUSH
  create_bd_pin -dir I CLEAR_ERR
  create_bd_pin -dir I -from 63 -to 0 CLOCK_CNT
  create_bd_pin -dir O -from 7 -to 0 ERR_FCS
  create_bd_pin -dir O -from 7 -to 0 ERR_FULL
  create_bd_pin -dir O -from 7 -to 0 ERR_LONG
  create_bd_pin -dir I FCS_CORRECT
  create_bd_pin -dir I FCS_EN
  create_bd_pin -dir I -from 63 -to 0 IN_RXD
  create_bd_pin -dir I -from 3 -to 0 IN_RXLEN
  create_bd_pin -dir I KEEP_ERROR_PACKET
  create_bd_pin -dir I TEST_PKT
  create_bd_pin -dir I -from 15 -to 0 TEST_PKT_SIZE
  create_bd_pin -dir I -type clk XGMII_CLK
  create_bd_pin -dir I -type rst XGMII_RESETN

  # Create instance: add_packet_header_0, and set properties
  set block_name add_packet_header
  set block_cell_name add_packet_header_0
  if { [catch {set add_packet_header_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $add_packet_header_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: axis_fifo_pdata, and set properties
  set block_name axis_fifo
  set block_cell_name axis_fifo_pdata
  if { [catch {set axis_fifo_pdata [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $axis_fifo_pdata eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.FIFO_SIZE_L2 {11} \
   CONFIG.WIDTH_LAST {0} \
 ] $axis_fifo_pdata

  # Create instance: axis_fifo_pinfo, and set properties
  set block_name axis_fifo
  set block_cell_name axis_fifo_pinfo
  if { [catch {set axis_fifo_pinfo [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $axis_fifo_pinfo eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.FIFO_SIZE_L2 {10} \
   CONFIG.WIDTH_DATA {64} \
   CONFIG.WIDTH_LAST {0} \
 ] $axis_fifo_pinfo

  # Create instance: axis_fifo_pkt, and set properties
  set block_name axis_fifo
  set block_cell_name axis_fifo_pkt
  if { [catch {set axis_fifo_pkt [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $axis_fifo_pkt eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.FIFO_SIZE_L2 {0} \
 ] $axis_fifo_pkt

  # Create instance: err_counter_fcs, and set properties
  set block_name err_counter
  set block_cell_name err_counter_fcs
  if { [catch {set err_counter_fcs [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $err_counter_fcs eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: err_counter_full, and set properties
  set block_name err_counter
  set block_cell_name err_counter_full
  if { [catch {set err_counter_full [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $err_counter_full eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: get_packet_info_0, and set properties
  set block_name get_packet_info
  set block_cell_name get_packet_info_0
  if { [catch {set get_packet_info_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $get_packet_info_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: testpat_rx_0, and set properties
  set block_name testpat_rx
  set block_cell_name testpat_rx_0
  if { [catch {set testpat_rx_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $testpat_rx_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: util_vector_logic_0, and set properties
  set util_vector_logic_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_0 ]
  set_property -dict [ list \
   CONFIG.C_OPERATION {or} \
   CONFIG.C_SIZE {1} \
 ] $util_vector_logic_0

  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0} \
   CONFIG.CONST_WIDTH {8} \
 ] $xlconstant_0

  # Create interface connections
  connect_bd_intf_net -intf_net add_packet_header_0_PKT [get_bd_intf_pins add_packet_header_0/PKT] [get_bd_intf_pins axis_fifo_pkt/IV]
  connect_bd_intf_net -intf_net axis_fifo_0_OV [get_bd_intf_pins add_packet_header_0/DATA] [get_bd_intf_pins axis_fifo_pdata/OV]
  connect_bd_intf_net -intf_net axis_fifo_0_OV1 [get_bd_intf_pins OV] [get_bd_intf_pins axis_fifo_pkt/OV]
  connect_bd_intf_net -intf_net axis_fifo_pinfo_OV [get_bd_intf_pins add_packet_header_0/INFO] [get_bd_intf_pins axis_fifo_pinfo/OV]
  connect_bd_intf_net -intf_net get_packet_info_0_DATA [get_bd_intf_pins axis_fifo_pdata/IV] [get_bd_intf_pins get_packet_info_0/DATA]
  connect_bd_intf_net -intf_net get_packet_info_0_INFO [get_bd_intf_pins axis_fifo_pinfo/IV] [get_bd_intf_pins get_packet_info_0/INFO]

  # Create port connections
  connect_bd_net -net CLEAR_ERR_1 [get_bd_pins CLEAR_ERR] [get_bd_pins err_counter_fcs/CLEAR_ERR] [get_bd_pins err_counter_full/CLEAR_ERR]
  connect_bd_net -net CLOCK_CNT_0_1 [get_bd_pins CLOCK_CNT] [get_bd_pins get_packet_info_0/CLOCK_CNT]
  connect_bd_net -net FCS_CORRECT_1 [get_bd_pins FCS_CORRECT] [get_bd_pins testpat_rx_0/IN_FCS_CORRECT]
  connect_bd_net -net FCS_EN_1 [get_bd_pins FCS_EN] [get_bd_pins testpat_rx_0/IN_FCS_EN]
  connect_bd_net -net IN_RXD_1 [get_bd_pins IN_RXD] [get_bd_pins testpat_rx_0/IN_RXD]
  connect_bd_net -net IN_RXLEN_1 [get_bd_pins IN_RXLEN] [get_bd_pins testpat_rx_0/IN_RXLEN]
  connect_bd_net -net KEEP_ERROR_PACKET_0_1 [get_bd_pins KEEP_ERROR_PACKET] [get_bd_pins add_packet_header_0/KEEP_ERROR_PACKET]
  connect_bd_net -net PKTLEN_1 [get_bd_pins TEST_PKT_SIZE] [get_bd_pins testpat_rx_0/PKTLEN]
  connect_bd_net -net STARTBTN_1 [get_bd_pins TEST_PKT] [get_bd_pins testpat_rx_0/STARTBTN]
  connect_bd_net -net XGMII_CLK_1 [get_bd_pins XGMII_CLK] [get_bd_pins add_packet_header_0/CLK] [get_bd_pins axis_fifo_pdata/CLK] [get_bd_pins axis_fifo_pinfo/CLK] [get_bd_pins axis_fifo_pkt/CLK] [get_bd_pins err_counter_fcs/CLK] [get_bd_pins err_counter_full/CLK] [get_bd_pins get_packet_info_0/CLK] [get_bd_pins testpat_rx_0/CLK]
  connect_bd_net -net XGMII_RESETN_1 [get_bd_pins XGMII_RESETN] [get_bd_pins add_packet_header_0/RESETN] [get_bd_pins axis_fifo_pdata/RESETN] [get_bd_pins axis_fifo_pinfo/RESETN] [get_bd_pins axis_fifo_pkt/RESETN] [get_bd_pins err_counter_fcs/RESETN] [get_bd_pins err_counter_full/RESETN] [get_bd_pins get_packet_info_0/RESETN] [get_bd_pins testpat_rx_0/RESETN]
  connect_bd_net -net axis_fifo_pdata_CAP_PUSH [get_bd_pins CAP_PUSH] [get_bd_pins axis_fifo_pdata/CAP_PUSH]
  connect_bd_net -net err_counter_fcs_OVAL [get_bd_pins ERR_FCS] [get_bd_pins err_counter_fcs/OVAL]
  connect_bd_net -net err_counter_full_OVAL [get_bd_pins ERR_FULL] [get_bd_pins err_counter_full/OVAL]
  connect_bd_net -net get_packet_info_0_ERR_DROP [get_bd_pins get_packet_info_0/ERR_DROP] [get_bd_pins util_vector_logic_0/Op1]
  connect_bd_net -net get_packet_info_0_ERR_FCS [get_bd_pins err_counter_fcs/IVAL] [get_bd_pins get_packet_info_0/ERR_FCS]
  connect_bd_net -net get_packet_info_0_ERR_INCOMPLETE [get_bd_pins get_packet_info_0/ERR_INCOMPLETE] [get_bd_pins util_vector_logic_0/Op2]
  connect_bd_net -net testpat_rx_0_OUT_FCS_CORRECT [get_bd_pins get_packet_info_0/FCS_CORRECT] [get_bd_pins testpat_rx_0/OUT_FCS_CORRECT]
  connect_bd_net -net testpat_rx_0_OUT_FCS_EN [get_bd_pins get_packet_info_0/FCS_EN] [get_bd_pins testpat_rx_0/OUT_FCS_EN]
  connect_bd_net -net testpat_rx_0_OUT_RXD [get_bd_pins get_packet_info_0/XGMII_D] [get_bd_pins testpat_rx_0/OUT_RXD]
  connect_bd_net -net testpat_rx_0_OUT_RXLEN [get_bd_pins get_packet_info_0/XGMII_LEN] [get_bd_pins testpat_rx_0/OUT_RXLEN]
  connect_bd_net -net util_vector_logic_0_Res [get_bd_pins err_counter_full/IVAL] [get_bd_pins util_vector_logic_0/Res]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins ERR_LONG] [get_bd_pins xlconstant_0/dout]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: pcie_dram
proc create_hier_cell_pcie_dram { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_pcie_dram() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M_AXI_REGS
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI_S2MM
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:ddr4_rtl:1.0 ddr4_sdram_c0
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 default_300mhz_clk0
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 led_8bits
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:pcie_7x_mgt_rtl:1.0 pci_express_x8
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 pcie_refclk

  # Create pins
  create_bd_pin -dir I -type clk XGMII_CLK
  create_bd_pin -dir I -type rst XGMII_RESETN
  create_bd_pin -dir O -type clk clk_100
  create_bd_pin -dir I -type rst pcie_perstn
  create_bd_pin -dir I -from 0 -to 0 resetn

  # Create instance: axi_gpio_0, and set properties
  set axi_gpio_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_0 ]
  set_property -dict [ list \
   CONFIG.GPIO_BOARD_INTERFACE {led_8bits} \
   CONFIG.USE_BOARD_FLOW {true} \
 ] $axi_gpio_0

  # Create instance: axi_smc, and set properties
  set axi_smc [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 axi_smc ]
  set_property -dict [ list \
   CONFIG.NUM_CLKS {3} \
   CONFIG.NUM_SI {2} \
 ] $axi_smc

  # Create instance: ddr4_0, and set properties
  set ddr4_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:ddr4:2.2 ddr4_0 ]
  set_property -dict [ list \
   CONFIG.C0_CLOCK_BOARD_INTERFACE {default_300mhz_clk0} \
   CONFIG.C0_DDR4_BOARD_INTERFACE {ddr4_sdram_c0} \
 ] $ddr4_0

  # Create instance: reset_ddr4_0_300m, and set properties
  set reset_ddr4_0_300m [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 reset_ddr4_0_300m ]

  # Create instance: util_ds_buf, and set properties
  set util_ds_buf [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf:2.1 util_ds_buf ]
  set_property -dict [ list \
   CONFIG.DIFF_CLK_IN_BOARD_INTERFACE {pcie_refclk} \
   CONFIG.USE_BOARD_FLOW {true} \
 ] $util_ds_buf

  # Create instance: util_vector_logic_0, and set properties
  set util_vector_logic_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_0 ]
  set_property -dict [ list \
   CONFIG.C_OPERATION {not} \
   CONFIG.C_SIZE {1} \
 ] $util_vector_logic_0

  # Create instance: xdma_0, and set properties
  set xdma_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xdma:4.1 xdma_0 ]
  set_property -dict [ list \
   CONFIG.PCIE_BOARD_INTERFACE {pci_express_x8} \
   CONFIG.PF0_DEVICE_ID_mqdma {9038} \
   CONFIG.PF2_DEVICE_ID_mqdma {9038} \
   CONFIG.PF3_DEVICE_ID_mqdma {9038} \
   CONFIG.SYS_RST_N_BOARD_INTERFACE {pcie_perstn} \
   CONFIG.axi_data_width {256_bit} \
   CONFIG.axilite_master_en {true} \
   CONFIG.axilite_master_scale {Kilobytes} \
   CONFIG.axilite_master_size {512} \
   CONFIG.axisten_freq {250} \
   CONFIG.cfg_mgmt_if {false} \
   CONFIG.dedicate_perst {true} \
   CONFIG.dma_reset_source_sel {Phy_Ready} \
   CONFIG.en_ext_ch_gt_drp {FALSE} \
   CONFIG.mcap_enablement {None} \
   CONFIG.mode_selection {Advanced} \
   CONFIG.pcie_id_if {false} \
   CONFIG.pf0_device_id {8038} \
   CONFIG.pf0_revision_id {a5} \
   CONFIG.pf1_bar0_scale {Kilobytes} \
   CONFIG.pf1_bar0_size {128} \
   CONFIG.pf1_bar1_enabled {false} \
   CONFIG.pl_link_cap_max_link_speed {8.0_GT/s} \
   CONFIG.plltype {QPLL1} \
   CONFIG.xdma_axi_intf_mm {AXI_Memory_Mapped} \
   CONFIG.xdma_pcie_64bit_en {true} \
   CONFIG.xdma_pcie_prefetchable {true} \
   CONFIG.xdma_rnum_chnl {1} \
   CONFIG.xdma_sts_ports {false} \
   CONFIG.xdma_wnum_chnl {1} \
 ] $xdma_0

  # Create instance: xdma_0_axi_periph, and set properties
  set xdma_0_axi_periph [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 xdma_0_axi_periph ]
  set_property -dict [ list \
   CONFIG.NUM_MI {3} \
 ] $xdma_0_axi_periph

  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0} \
 ] $xlconstant_0

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins default_300mhz_clk0] [get_bd_intf_pins ddr4_0/C0_SYS_CLK]
  connect_bd_intf_net -intf_net Conn2 [get_bd_intf_pins led_8bits] [get_bd_intf_pins axi_gpio_0/GPIO]
  connect_bd_intf_net -intf_net Conn3 [get_bd_intf_pins pci_express_x8] [get_bd_intf_pins xdma_0/pcie_mgt]
  connect_bd_intf_net -intf_net Conn4 [get_bd_intf_pins pcie_refclk] [get_bd_intf_pins util_ds_buf/CLK_IN_D]
  connect_bd_intf_net -intf_net Conn5 [get_bd_intf_pins ddr4_sdram_c0] [get_bd_intf_pins ddr4_0/C0_DDR4]
  connect_bd_intf_net -intf_net Conn6 [get_bd_intf_pins S_AXI_S2MM] [get_bd_intf_pins axi_smc/S01_AXI]
  connect_bd_intf_net -intf_net axi_smc_M00_AXI [get_bd_intf_pins axi_smc/M00_AXI] [get_bd_intf_pins ddr4_0/C0_DDR4_S_AXI]
  connect_bd_intf_net -intf_net xdma_0_M_AXI [get_bd_intf_pins axi_smc/S00_AXI] [get_bd_intf_pins xdma_0/M_AXI]
  connect_bd_intf_net -intf_net xdma_0_M_AXI_LITE [get_bd_intf_pins xdma_0/M_AXI_LITE] [get_bd_intf_pins xdma_0_axi_periph/S00_AXI]
  connect_bd_intf_net -intf_net xdma_0_axi_periph_M00_AXI [get_bd_intf_pins axi_gpio_0/S_AXI] [get_bd_intf_pins xdma_0_axi_periph/M00_AXI]
  connect_bd_intf_net -intf_net xdma_0_axi_periph_M01_AXI [get_bd_intf_pins ddr4_0/C0_DDR4_S_AXI_CTRL] [get_bd_intf_pins xdma_0_axi_periph/M01_AXI]
  connect_bd_intf_net -intf_net xdma_0_axi_periph_M02_AXI [get_bd_intf_pins M_AXI_REGS] [get_bd_intf_pins xdma_0_axi_periph/M02_AXI]

  # Create port connections
  connect_bd_net -net M02_ARESETN_1 [get_bd_pins XGMII_RESETN] [get_bd_pins xdma_0_axi_periph/M02_ARESETN]
  connect_bd_net -net aclk2_1 [get_bd_pins XGMII_CLK] [get_bd_pins axi_smc/aclk2] [get_bd_pins xdma_0_axi_periph/M02_ACLK]
  connect_bd_net -net ddr4_0_addn_ui_clkout1 [get_bd_pins clk_100] [get_bd_pins ddr4_0/addn_ui_clkout1]
  connect_bd_net -net ddr4_0_c0_ddr4_ui_clk [get_bd_pins axi_smc/aclk] [get_bd_pins ddr4_0/c0_ddr4_ui_clk] [get_bd_pins reset_ddr4_0_300m/slowest_sync_clk] [get_bd_pins xdma_0_axi_periph/M01_ACLK]
  connect_bd_net -net ddr4_0_c0_ddr4_ui_clk_sync_rst [get_bd_pins ddr4_0/c0_ddr4_ui_clk_sync_rst] [get_bd_pins reset_ddr4_0_300m/ext_reset_in]
  connect_bd_net -net pcie_perstn_1 [get_bd_pins pcie_perstn] [get_bd_pins xdma_0/sys_rst_n]
  connect_bd_net -net reset_ddr4_0_300m_peripheral_aresetn [get_bd_pins ddr4_0/c0_ddr4_aresetn] [get_bd_pins reset_ddr4_0_300m/peripheral_aresetn] [get_bd_pins xdma_0_axi_periph/M01_ARESETN]
  connect_bd_net -net resetn_1 [get_bd_pins resetn] [get_bd_pins util_vector_logic_0/Op1]
  connect_bd_net -net util_ds_buf_IBUF_DS_ODIV2 [get_bd_pins util_ds_buf/IBUF_DS_ODIV2] [get_bd_pins xdma_0/sys_clk]
  connect_bd_net -net util_ds_buf_IBUF_OUT [get_bd_pins util_ds_buf/IBUF_OUT] [get_bd_pins xdma_0/sys_clk_gt]
  connect_bd_net -net util_vector_logic_0_Res [get_bd_pins ddr4_0/sys_rst] [get_bd_pins util_vector_logic_0/Res]
  connect_bd_net -net xdma_0_axi_aclk [get_bd_pins axi_gpio_0/s_axi_aclk] [get_bd_pins axi_smc/aclk1] [get_bd_pins xdma_0/axi_aclk] [get_bd_pins xdma_0_axi_periph/ACLK] [get_bd_pins xdma_0_axi_periph/M00_ACLK] [get_bd_pins xdma_0_axi_periph/S00_ACLK]
  connect_bd_net -net xdma_0_axi_aresetn [get_bd_pins axi_gpio_0/s_axi_aresetn] [get_bd_pins axi_smc/aresetn] [get_bd_pins xdma_0/axi_aresetn] [get_bd_pins xdma_0_axi_periph/ARESETN] [get_bd_pins xdma_0_axi_periph/M00_ARESETN] [get_bd_pins xdma_0_axi_periph/S00_ARESETN]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins xdma_0/usr_irq_req] [get_bd_pins xlconstant_0/dout]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: fanctrl
proc create_hier_cell_fanctrl { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_fanctrl() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -type clk CLK
  create_bd_pin -dir IO I2C_SCL
  create_bd_pin -dir IO I2C_SDA
  create_bd_pin -dir I -type rst RESET_N

  # Create instance: fanctrl_init_0, and set properties
  set block_name fanctrl_init
  set block_cell_name fanctrl_init_0
  if { [catch {set fanctrl_init_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $fanctrl_init_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: i2c_master_0, and set properties
  set block_name i2c_master
  set block_cell_name i2c_master_0
  if { [catch {set i2c_master_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $i2c_master_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.CLOCK_DIV {250} \
 ] $i2c_master_0

  # Create port connections
  connect_bd_net -net CLK_1 [get_bd_pins CLK] [get_bd_pins fanctrl_init_0/CLK] [get_bd_pins i2c_master_0/CLK]
  connect_bd_net -net Net [get_bd_pins I2C_SDA] [get_bd_pins i2c_master_0/I2C_SDA]
  connect_bd_net -net Net1 [get_bd_pins I2C_SCL] [get_bd_pins i2c_master_0/I2C_SCL]
  connect_bd_net -net RESET_N_1 [get_bd_pins RESET_N] [get_bd_pins fanctrl_init_0/RESET_N] [get_bd_pins i2c_master_0/RESET_N]
  connect_bd_net -net fanctrl_init_0_I2CM_DEVADDR [get_bd_pins fanctrl_init_0/I2CM_DEVADDR] [get_bd_pins i2c_master_0/DEVADDR]
  connect_bd_net -net fanctrl_init_0_I2CM_RBYTES [get_bd_pins fanctrl_init_0/I2CM_RBYTES] [get_bd_pins i2c_master_0/RBYTES]
  connect_bd_net -net fanctrl_init_0_I2CM_REGADDR [get_bd_pins fanctrl_init_0/I2CM_REGADDR] [get_bd_pins i2c_master_0/REGADDR]
  connect_bd_net -net fanctrl_init_0_I2CM_VALID [get_bd_pins fanctrl_init_0/I2CM_VALID] [get_bd_pins i2c_master_0/VALID]
  connect_bd_net -net fanctrl_init_0_I2CM_WBYTES [get_bd_pins fanctrl_init_0/I2CM_WBYTES] [get_bd_pins i2c_master_0/WBYTES]
  connect_bd_net -net fanctrl_init_0_I2CM_WDATA [get_bd_pins fanctrl_init_0/I2CM_WDATA] [get_bd_pins i2c_master_0/WDATA]
  connect_bd_net -net i2c_master_0_ERROR [get_bd_pins fanctrl_init_0/I2CM_ERR] [get_bd_pins i2c_master_0/ERROR]
  connect_bd_net -net i2c_master_0_RDATA [get_bd_pins fanctrl_init_0/I2CM_RDATA] [get_bd_pins i2c_master_0/RDATA]
  connect_bd_net -net i2c_master_0_READY [get_bd_pins fanctrl_init_0/I2CM_READY] [get_bd_pins i2c_master_0/READY]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: eth_quad0
proc create_hier_cell_eth_quad0 { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_eth_quad0() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 MGTCLK0

  # Create pins
  create_bd_pin -dir O FCS_CORRECT_0
  create_bd_pin -dir O FCS_EN_0
  create_bd_pin -dir I -from 15 -to 0 GAPLEN
  create_bd_pin -dir I -from 15 -to 0 PKTLEN
  create_bd_pin -dir O -from 63 -to 0 RXD_0
  create_bd_pin -dir O -from 3 -to 0 RXLEN_0
  create_bd_pin -dir I SFP1_RX_N
  create_bd_pin -dir I SFP1_RX_P
  create_bd_pin -dir O SFP1_TX_N
  create_bd_pin -dir O SFP1_TX_P
  create_bd_pin -dir I STARTBTN
  create_bd_pin -dir O -type clk XGMII_CLK
  create_bd_pin -dir O -type rst XGMII_RESET
  create_bd_pin -dir I -type clk dclk
  create_bd_pin -dir I -type rst reset

  # Create instance: eth_0
  create_hier_cell_eth_0 $hier_obj eth_0

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins MGTCLK0] [get_bd_intf_pins eth_0/MGTCLK0]

  # Create port connections
  connect_bd_net -net GAPLEN_0_1 [get_bd_pins GAPLEN] [get_bd_pins eth_0/GAPLEN]
  connect_bd_net -net PKTLEN_0_1 [get_bd_pins PKTLEN] [get_bd_pins eth_0/PKTLEN]
  connect_bd_net -net SFP1_RX_N_1 [get_bd_pins SFP1_RX_N] [get_bd_pins eth_0/SFP1_RX_N]
  connect_bd_net -net SFP1_RX_P_1 [get_bd_pins SFP1_RX_P] [get_bd_pins eth_0/SFP1_RX_P]
  connect_bd_net -net STARTBTN_0_1 [get_bd_pins STARTBTN] [get_bd_pins eth_0/STARTBTN]
  connect_bd_net -net dclk_1 [get_bd_pins dclk] [get_bd_pins eth_0/dclk]
  connect_bd_net -net eth_0_FCS_CORRECT [get_bd_pins FCS_CORRECT_0] [get_bd_pins eth_0/FCS_CORRECT]
  connect_bd_net -net eth_0_FCS_EN_0 [get_bd_pins FCS_EN_0] [get_bd_pins eth_0/FCS_EN]
  connect_bd_net -net eth_0_RXD [get_bd_pins RXD_0] [get_bd_pins eth_0/RXD]
  connect_bd_net -net eth_0_RXLEN [get_bd_pins RXLEN_0] [get_bd_pins eth_0/RXLEN]
  connect_bd_net -net eth_0_SFP1_TX_N [get_bd_pins SFP1_TX_N] [get_bd_pins eth_0/SFP1_TX_N]
  connect_bd_net -net eth_0_SFP1_TX_P [get_bd_pins SFP1_TX_P] [get_bd_pins eth_0/SFP1_TX_P]
  connect_bd_net -net eth_0_areset_datapathclk_out [get_bd_pins XGMII_RESET] [get_bd_pins eth_0/areset_datapathclk_out]
  connect_bd_net -net eth_0_txusrclk2_out [get_bd_pins XGMII_CLK] [get_bd_pins eth_0/txusrclk2_out]
  connect_bd_net -net reset_1 [get_bd_pins reset] [get_bd_pins eth_0/reset]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: eth10_capt_ctrl
proc create_hier_cell_eth10_capt_ctrl { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_eth10_capt_ctrl() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 s_axi_AXILiteS

  # Create pins
  create_bd_pin -dir I -from 3 -to 0 CAP_CNT
  create_bd_pin -dir I -from 3 -to 0 CAP_DELIM
  create_bd_pin -dir I -from 11 -to 0 CAP_PKT
  create_bd_pin -dir I -from 3 -to 0 CAP_WCMD
  create_bd_pin -dir I -from 14 -to 0 CAP_WDATA
  create_bd_pin -dir I -from 4 -to 0 CAP_WORDCNT
  create_bd_pin -dir O CLEAR_ERR
  create_bd_pin -dir I -type clk CLK
  create_bd_pin -dir O -from 63 -to 0 CLOCK_CNT
  create_bd_pin -dir I ERR_DELIM
  create_bd_pin -dir I -from 7 -to 0 ERR_FCS
  create_bd_pin -dir I -from 7 -to 0 ERR_FULL
  create_bd_pin -dir I -from 7 -to 0 ERR_LONG
  create_bd_pin -dir I ERR_S2MM
  create_bd_pin -dir I -from 7 -to 0 ERR_STS
  create_bd_pin -dir I -from 1 -to 0 ERR_WCMD
  create_bd_pin -dir O KEEP_ERROR_PACKET
  create_bd_pin -dir I -type rst RESETN
  create_bd_pin -dir O -from 15 -to 0 TEST_GAP_SIZE
  create_bd_pin -dir O TEST_PKT
  create_bd_pin -dir O -from 15 -to 0 TEST_PKT_SIZE
  create_bd_pin -dir I -from 63 -to 0 WADDR_POST
  create_bd_pin -dir I -from 63 -to 0 WADDR_PRE

  # Create instance: axilite_regs_0, and set properties
  set block_name axilite_regs
  set block_cell_name axilite_regs_0
  if { [catch {set axilite_regs_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $axilite_regs_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: rx_wrmem_regs_0, and set properties
  set block_name rx_wrmem_regs
  set block_cell_name rx_wrmem_regs_0
  if { [catch {set rx_wrmem_regs_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $rx_wrmem_regs_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: vio_0, and set properties
  set vio_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:vio:3.0 vio_0 ]
  set_property -dict [ list \
   CONFIG.C_NUM_PROBE_IN {0} \
   CONFIG.C_NUM_PROBE_OUT {5} \
   CONFIG.C_PROBE_OUT1_INIT_VAL {0x0} \
   CONFIG.C_PROBE_OUT1_WIDTH {1} \
   CONFIG.C_PROBE_OUT2_INIT_VAL {0x0040} \
   CONFIG.C_PROBE_OUT2_WIDTH {16} \
   CONFIG.C_PROBE_OUT3_INIT_VAL {0x000c} \
   CONFIG.C_PROBE_OUT3_WIDTH {16} \
 ] $vio_0

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins s_axi_AXILiteS] [get_bd_intf_pins axilite_regs_0/s_axi_AXILiteS]

  # Create port connections
  connect_bd_net -net CAP_CNT_1 [get_bd_pins CAP_CNT] [get_bd_pins rx_wrmem_regs_0/CAP_CNT]
  connect_bd_net -net CAP_DELIM_1 [get_bd_pins CAP_DELIM] [get_bd_pins rx_wrmem_regs_0/CAP_DELIM]
  connect_bd_net -net CAP_PKT_1 [get_bd_pins CAP_PKT] [get_bd_pins rx_wrmem_regs_0/CAP_PKT]
  connect_bd_net -net CAP_WCMD_1 [get_bd_pins CAP_WCMD] [get_bd_pins rx_wrmem_regs_0/CAP_WCMD]
  connect_bd_net -net CAP_WDATA_1 [get_bd_pins CAP_WDATA] [get_bd_pins rx_wrmem_regs_0/CAP_WDATA]
  connect_bd_net -net CAP_WORDCNT_1 [get_bd_pins CAP_WORDCNT] [get_bd_pins rx_wrmem_regs_0/CAP_WORDCNT]
  connect_bd_net -net CLK_1 [get_bd_pins CLK] [get_bd_pins axilite_regs_0/CLK] [get_bd_pins rx_wrmem_regs_0/CLK] [get_bd_pins vio_0/clk]
  connect_bd_net -net ERR_DELIM_1 [get_bd_pins ERR_DELIM] [get_bd_pins rx_wrmem_regs_0/ERR_DELIM]
  connect_bd_net -net ERR_FCS_1 [get_bd_pins ERR_FCS] [get_bd_pins rx_wrmem_regs_0/ERR_FCS]
  connect_bd_net -net ERR_FULL_1 [get_bd_pins ERR_FULL] [get_bd_pins rx_wrmem_regs_0/ERR_FULL]
  connect_bd_net -net ERR_LONG_1 [get_bd_pins ERR_LONG] [get_bd_pins rx_wrmem_regs_0/ERR_LONG]
  connect_bd_net -net ERR_S2MM_1 [get_bd_pins ERR_S2MM] [get_bd_pins rx_wrmem_regs_0/ERR_S2MM]
  connect_bd_net -net ERR_STS_1 [get_bd_pins ERR_STS] [get_bd_pins rx_wrmem_regs_0/ERR_STS]
  connect_bd_net -net ERR_WCMD_1 [get_bd_pins ERR_WCMD] [get_bd_pins rx_wrmem_regs_0/ERR_WCMD]
  connect_bd_net -net RESETN_1 [get_bd_pins RESETN] [get_bd_pins axilite_regs_0/RESETN] [get_bd_pins rx_wrmem_regs_0/RESETN]
  connect_bd_net -net WADDR_POST_1 [get_bd_pins WADDR_POST] [get_bd_pins rx_wrmem_regs_0/WADDR_POST]
  connect_bd_net -net WADDR_PRE_1 [get_bd_pins WADDR_PRE] [get_bd_pins rx_wrmem_regs_0/WADDR_PRE]
  connect_bd_net -net axilite_regs_0_RD_ADDR [get_bd_pins axilite_regs_0/RD_ADDR] [get_bd_pins rx_wrmem_regs_0/RD_ADDR]
  connect_bd_net -net axilite_regs_0_RD_ADDR_EN [get_bd_pins axilite_regs_0/RD_ADDR_EN] [get_bd_pins rx_wrmem_regs_0/RD_ADDR_EN]
  connect_bd_net -net axilite_regs_0_WR_ADDR [get_bd_pins axilite_regs_0/WR_ADDR] [get_bd_pins rx_wrmem_regs_0/WR_ADDR]
  connect_bd_net -net axilite_regs_0_WR_DATA [get_bd_pins axilite_regs_0/WR_DATA] [get_bd_pins rx_wrmem_regs_0/WR_DATA]
  connect_bd_net -net axilite_regs_0_WR_EN [get_bd_pins axilite_regs_0/WR_EN] [get_bd_pins rx_wrmem_regs_0/WR_EN]
  connect_bd_net -net rx_wrmem_regs_0_CLEAR_ERR [get_bd_pins CLEAR_ERR] [get_bd_pins rx_wrmem_regs_0/CLEAR_ERR]
  connect_bd_net -net rx_wrmem_regs_0_CLOCK_CNT [get_bd_pins CLOCK_CNT] [get_bd_pins rx_wrmem_regs_0/CLOCK_CNT]
  connect_bd_net -net rx_wrmem_regs_0_KEEP_ERROR_PACKET [get_bd_pins KEEP_ERROR_PACKET] [get_bd_pins rx_wrmem_regs_0/KEEP_ERROR_PACKET]
  connect_bd_net -net rx_wrmem_regs_0_RD_DATA [get_bd_pins axilite_regs_0/RD_DATA] [get_bd_pins rx_wrmem_regs_0/RD_DATA]
  connect_bd_net -net rx_wrmem_regs_0_RD_DATA_EN [get_bd_pins axilite_regs_0/RD_DATA_EN] [get_bd_pins rx_wrmem_regs_0/RD_DATA_EN]
  connect_bd_net -net rx_wrmem_regs_0_TEST_GAP_SIZE [get_bd_pins TEST_GAP_SIZE] [get_bd_pins rx_wrmem_regs_0/TEST_GAP_SIZE]
  connect_bd_net -net rx_wrmem_regs_0_TEST_PKT [get_bd_pins TEST_PKT] [get_bd_pins rx_wrmem_regs_0/TEST_PKT]
  connect_bd_net -net rx_wrmem_regs_0_TEST_PKT_SIZE [get_bd_pins TEST_PKT_SIZE] [get_bd_pins rx_wrmem_regs_0/TEST_PKT_SIZE]
  connect_bd_net -net vio_0_probe_out0 [get_bd_pins rx_wrmem_regs_0/VIO_CLEAR] [get_bd_pins vio_0/probe_out0]
  connect_bd_net -net vio_0_probe_out1 [get_bd_pins rx_wrmem_regs_0/VIO_PKT] [get_bd_pins vio_0/probe_out1]
  connect_bd_net -net vio_0_probe_out2 [get_bd_pins rx_wrmem_regs_0/VIO_PKT_SIZE] [get_bd_pins vio_0/probe_out2]
  connect_bd_net -net vio_0_probe_out3 [get_bd_pins rx_wrmem_regs_0/VIO_GAP_SIZE] [get_bd_pins vio_0/probe_out3]
  connect_bd_net -net vio_0_probe_out4 [get_bd_pins rx_wrmem_regs_0/VIO_KEEP_ERROR_PACKET] [get_bd_pins vio_0/probe_out4]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: axis_wrmem
proc create_hier_cell_axis_wrmem { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_axis_wrmem() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M_AXI_S2MM
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 S_AXIS

  # Create pins
  create_bd_pin -dir O -from 3 -to 0 CAP_CNT
  create_bd_pin -dir O -from 3 -to 0 CAP_DELIM
  create_bd_pin -dir O -from 3 -to 0 CAP_WCMD
  create_bd_pin -dir O -from 14 -to 0 CAP_WDATA
  create_bd_pin -dir O -from 4 -to 0 CAP_WORDCNT
  create_bd_pin -dir O -from 63 -to 0 CUR_ADDR
  create_bd_pin -dir O -from 63 -to 0 CUR_WADDR
  create_bd_pin -dir O ERR_DELIM
  create_bd_pin -dir O -from 1 -to 0 ERR_FATAL
  create_bd_pin -dir O -from 7 -to 0 ERR_STS
  create_bd_pin -dir I -type clk XGMII_CLK
  create_bd_pin -dir I -type rst XGMII_RESETN
  create_bd_pin -dir O s2mm_err

  # Create instance: axi_datamover_0, and set properties
  set axi_datamover_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_datamover:5.1 axi_datamover_0 ]
  set_property -dict [ list \
   CONFIG.c_addr_width {64} \
   CONFIG.c_dummy {1} \
   CONFIG.c_enable_mm2s {0} \
   CONFIG.c_m_axi_s2mm_data_width {128} \
   CONFIG.c_s2mm_btt_used {23} \
   CONFIG.c_s2mm_burst_size {256} \
   CONFIG.c_s_axis_s2mm_tdata_width {128} \
 ] $axi_datamover_0

  # Create instance: axis_dwidth_converter_0, and set properties
  set axis_dwidth_converter_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_dwidth_converter:1.1 axis_dwidth_converter_0 ]
  set_property -dict [ list \
   CONFIG.HAS_MI_TKEEP {1} \
   CONFIG.HAS_TKEEP {0} \
   CONFIG.HAS_TLAST {1} \
   CONFIG.HAS_TSTRB {0} \
   CONFIG.M_TDATA_NUM_BYTES {16} \
   CONFIG.S_TDATA_NUM_BYTES {8} \
   CONFIG.TDEST_WIDTH {0} \
   CONFIG.TID_WIDTH {0} \
   CONFIG.TUSER_BITS_PER_BYTE {0} \
 ] $axis_dwidth_converter_0

  # Create instance: axis_fifo_wcmd, and set properties
  set block_name axis_fifo
  set block_cell_name axis_fifo_wcmd
  if { [catch {set axis_fifo_wcmd [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $axis_fifo_wcmd eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.FIFO_REG {8} \
   CONFIG.FIFO_SIZE_L2 {0} \
   CONFIG.WIDTH_DATA {104} \
 ] $axis_fifo_wcmd

  # Create instance: axis_fifo_wcmd_cnt, and set properties
  set block_name axis_fifo
  set block_cell_name axis_fifo_wcmd_cnt
  if { [catch {set axis_fifo_wcmd_cnt [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $axis_fifo_wcmd_cnt eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.FIFO_REG {8} \
   CONFIG.FIFO_SIZE_L2 {0} \
   CONFIG.WIDTH_DATA {104} \
 ] $axis_fifo_wcmd_cnt

  # Create instance: axis_fifo_wcmd_delim, and set properties
  set block_name axis_fifo
  set block_cell_name axis_fifo_wcmd_delim
  if { [catch {set axis_fifo_wcmd_delim [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $axis_fifo_wcmd_delim eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.FIFO_REG {8} \
   CONFIG.FIFO_SIZE_L2 {0} \
   CONFIG.WIDTH_DATA {104} \
 ] $axis_fifo_wcmd_delim

  # Create instance: axis_fifo_wdata, and set properties
  set block_name axis_fifo
  set block_cell_name axis_fifo_wdata
  if { [catch {set axis_fifo_wdata [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $axis_fifo_wdata eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.FIFO_SIZE_L2 {14} \
   CONFIG.WIDTH_DATA {128} \
 ] $axis_fifo_wdata

  # Create instance: axis_fifo_wordcnt, and set properties
  set block_name axis_fifo
  set block_cell_name axis_fifo_wordcnt
  if { [catch {set axis_fifo_wordcnt [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $axis_fifo_wordcnt eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.FIFO_REG {16} \
   CONFIG.FIFO_SIZE_L2 {0} \
   CONFIG.WIDTH_DATA {16} \
   CONFIG.WIDTH_LAST {0} \
 ] $axis_fifo_wordcnt

  # Create instance: axis_fork_0, and set properties
  set block_name axis_fork
  set block_cell_name axis_fork_0
  if { [catch {set axis_fork_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $axis_fork_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.WIDTH_DATA {104} \
   CONFIG.WIDTH_LAST {0} \
 ] $axis_fork_0

  # Create instance: axis_fork_1, and set properties
  set block_name axis_fork
  set block_cell_name axis_fork_1
  if { [catch {set axis_fork_1 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $axis_fork_1 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.WIDTH_DATA {104} \
   CONFIG.WIDTH_LAST {0} \
 ] $axis_fork_1

  # Create instance: gen_datamover_wcmd_0, and set properties
  set block_name gen_datamover_wcmd
  set block_cell_name gen_datamover_wcmd_0
  if { [catch {set gen_datamover_wcmd_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $gen_datamover_wcmd_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: get_word_count_0, and set properties
  set block_name get_word_count
  set block_cell_name get_word_count_0
  if { [catch {set get_word_count_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $get_word_count_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.WORD_SIZE_L2 {4} \
 ] $get_word_count_0

  # Create instance: groupify_wordcnt_0, and set properties
  set block_name groupify_wordcnt
  set block_cell_name groupify_wordcnt_0
  if { [catch {set groupify_wordcnt_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $groupify_wordcnt_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: rx_wrmem_status_0, and set properties
  set block_name rx_wrmem_status
  set block_cell_name rx_wrmem_status_0
  if { [catch {set rx_wrmem_status_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $rx_wrmem_status_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: update_packet_delim_1, and set properties
  set block_name update_packet_delim
  set block_cell_name update_packet_delim_1
  if { [catch {set update_packet_delim_1 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $update_packet_delim_1 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: xlconstant_1, and set properties
  set xlconstant_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_1 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {65535} \
   CONFIG.CONST_WIDTH {16} \
 ] $xlconstant_1

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins S_AXIS] [get_bd_intf_pins axis_dwidth_converter_0/S_AXIS]
  connect_bd_intf_net -intf_net Conn2 [get_bd_intf_pins M_AXI_S2MM] [get_bd_intf_pins axi_datamover_0/M_AXI_S2MM]
  connect_bd_intf_net -intf_net axi_datamover_0_M_AXIS_S2MM_STS [get_bd_intf_pins axi_datamover_0/M_AXIS_S2MM_STS] [get_bd_intf_pins rx_wrmem_status_0/STS]
  connect_bd_intf_net -intf_net axis_dwidth_converter_0_M_AXIS [get_bd_intf_pins axis_dwidth_converter_0/M_AXIS] [get_bd_intf_pins get_word_count_0/IV]
  connect_bd_intf_net -intf_net axis_fifo_wcmd_OV [get_bd_intf_pins axi_datamover_0/S_AXIS_S2MM_CMD] [get_bd_intf_pins axis_fifo_wcmd/OV]
  connect_bd_intf_net -intf_net axis_fifo_wcmd_cnt_OV [get_bd_intf_pins axis_fifo_wcmd_cnt/OV] [get_bd_intf_pins rx_wrmem_status_0/WCMD]
  connect_bd_intf_net -intf_net axis_fifo_wcmd_delim_OV [get_bd_intf_pins axis_fifo_wcmd_delim/OV] [get_bd_intf_pins update_packet_delim_1/IWCMD]
  connect_bd_intf_net -intf_net axis_fifo_wdata_OV [get_bd_intf_pins axis_fifo_wdata/OV] [get_bd_intf_pins update_packet_delim_1/IWDATA]
  connect_bd_intf_net -intf_net axis_fifo_wordcnt_OV [get_bd_intf_pins axis_fifo_wordcnt/OV] [get_bd_intf_pins groupify_wordcnt_0/IV]
  connect_bd_intf_net -intf_net axis_fork_0_OV0 [get_bd_intf_pins axis_fork_0/OV0] [get_bd_intf_pins axis_fork_1/IV]
  connect_bd_intf_net -intf_net axis_fork_0_OV1 [get_bd_intf_pins axis_fifo_wcmd/IV] [get_bd_intf_pins axis_fork_0/OV1]
  connect_bd_intf_net -intf_net axis_fork_1_OV0 [get_bd_intf_pins axis_fifo_wcmd_cnt/IV] [get_bd_intf_pins axis_fork_1/OV0]
  connect_bd_intf_net -intf_net axis_fork_1_OV1 [get_bd_intf_pins axis_fifo_wcmd_delim/IV] [get_bd_intf_pins axis_fork_1/OV1]
  connect_bd_intf_net -intf_net gen_datamover_wcmd_0_WCMD [get_bd_intf_pins axis_fork_0/IV] [get_bd_intf_pins gen_datamover_wcmd_0/WCMD]
  connect_bd_intf_net -intf_net get_word_count_0_OV [get_bd_intf_pins axis_fifo_wdata/IV] [get_bd_intf_pins get_word_count_0/OV]
  connect_bd_intf_net -intf_net get_word_count_0_WORDCNT [get_bd_intf_pins axis_fifo_wordcnt/IV] [get_bd_intf_pins get_word_count_0/WORDCNT]
  connect_bd_intf_net -intf_net groupify_wordcnt_0_OV [get_bd_intf_pins gen_datamover_wcmd_0/WORDCNT] [get_bd_intf_pins groupify_wordcnt_0/OV]
  connect_bd_intf_net -intf_net update_packet_delim_1_OWDATA [get_bd_intf_pins axi_datamover_0/S_AXIS_S2MM] [get_bd_intf_pins update_packet_delim_1/OWDATA]

  # Create port connections
  connect_bd_net -net XGMII_CLK_1 [get_bd_pins XGMII_CLK] [get_bd_pins axi_datamover_0/m_axi_s2mm_aclk] [get_bd_pins axi_datamover_0/m_axis_s2mm_cmdsts_awclk] [get_bd_pins axis_dwidth_converter_0/aclk] [get_bd_pins axis_fifo_wcmd/CLK] [get_bd_pins axis_fifo_wcmd_cnt/CLK] [get_bd_pins axis_fifo_wcmd_delim/CLK] [get_bd_pins axis_fifo_wdata/CLK] [get_bd_pins axis_fifo_wordcnt/CLK] [get_bd_pins axis_fork_0/CLK] [get_bd_pins axis_fork_1/CLK] [get_bd_pins gen_datamover_wcmd_0/CLK] [get_bd_pins get_word_count_0/CLK] [get_bd_pins groupify_wordcnt_0/CLK] [get_bd_pins rx_wrmem_status_0/CLK] [get_bd_pins update_packet_delim_1/CLK]
  connect_bd_net -net XGMII_RESETN_1 [get_bd_pins XGMII_RESETN] [get_bd_pins axi_datamover_0/m_axi_s2mm_aresetn] [get_bd_pins axi_datamover_0/m_axis_s2mm_cmdsts_aresetn] [get_bd_pins axis_dwidth_converter_0/aresetn] [get_bd_pins axis_fifo_wcmd/RESETN] [get_bd_pins axis_fifo_wcmd_cnt/RESETN] [get_bd_pins axis_fifo_wcmd_delim/RESETN] [get_bd_pins axis_fifo_wdata/RESETN] [get_bd_pins axis_fifo_wordcnt/RESETN] [get_bd_pins axis_fork_0/RESETN] [get_bd_pins axis_fork_1/RESETN] [get_bd_pins gen_datamover_wcmd_0/RESETN] [get_bd_pins get_word_count_0/RESETN] [get_bd_pins groupify_wordcnt_0/RESETN] [get_bd_pins rx_wrmem_status_0/RESETN] [get_bd_pins update_packet_delim_1/RESETN]
  connect_bd_net -net axi_datamover_0_s2mm_err [get_bd_pins s2mm_err] [get_bd_pins axi_datamover_0/s2mm_err]
  connect_bd_net -net axis_fifo_wcmd_CAP_PUSH [get_bd_pins CAP_WCMD] [get_bd_pins axis_fifo_wcmd/CAP_PUSH]
  connect_bd_net -net axis_fifo_wcmd_cnt_CAP_PUSH [get_bd_pins CAP_CNT] [get_bd_pins axis_fifo_wcmd_cnt/CAP_PUSH]
  connect_bd_net -net axis_fifo_wcmd_delim_CAP_PUSH [get_bd_pins CAP_DELIM] [get_bd_pins axis_fifo_wcmd_delim/CAP_PUSH]
  connect_bd_net -net axis_fifo_wdata_CAP_PUSH [get_bd_pins CAP_WDATA] [get_bd_pins axis_fifo_wdata/CAP_PUSH]
  connect_bd_net -net axis_fifo_wordcnt_CAP_PUSH [get_bd_pins CAP_WORDCNT] [get_bd_pins axis_fifo_wordcnt/CAP_PUSH]
  connect_bd_net -net gen_datamover_wcmd_0_CUR_ADDR [get_bd_pins CUR_ADDR] [get_bd_pins gen_datamover_wcmd_0/CUR_ADDR]
  connect_bd_net -net gen_datamover_wcmd_0_ERR_FATAL [get_bd_pins ERR_FATAL] [get_bd_pins gen_datamover_wcmd_0/ERR_FATAL]
  connect_bd_net -net rx_wrmem_status_0_CUR_WADDR [get_bd_pins CUR_WADDR] [get_bd_pins rx_wrmem_status_0/CUR_WADDR]
  connect_bd_net -net rx_wrmem_status_0_ERR_STS [get_bd_pins ERR_STS] [get_bd_pins rx_wrmem_status_0/ERR_STS]
  connect_bd_net -net update_packet_delim_1_ERR_DELIM [get_bd_pins ERR_DELIM] [get_bd_pins update_packet_delim_1/ERR_DELIM]
  connect_bd_net -net xlconstant_1_dout [get_bd_pins axi_datamover_0/s_axis_s2mm_tkeep] [get_bd_pins xlconstant_1/dout]

  # Restore current instance
  current_bd_instance $oldCurInst
}


# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set MGTCLK0_0 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 MGTCLK0_0 ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {156250000} \
   ] $MGTCLK0_0
  set ddr4_sdram_c0 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddr4_rtl:1.0 ddr4_sdram_c0 ]
  set default_300mhz_clk0 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 default_300mhz_clk0 ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {300000000} \
   ] $default_300mhz_clk0
  set led_8bits [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 led_8bits ]
  set pci_express_x8 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:pcie_7x_mgt_rtl:1.0 pci_express_x8 ]
  set pcie_refclk [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 pcie_refclk ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {100000000} \
   ] $pcie_refclk

  # Create ports
  set I2C_SCL [ create_bd_port -dir IO I2C_SCL ]
  set I2C_SDA [ create_bd_port -dir IO I2C_SDA ]
  set SFP1_RX_N_0 [ create_bd_port -dir I SFP1_RX_N_0 ]
  set SFP1_RX_P_0 [ create_bd_port -dir I SFP1_RX_P_0 ]
  set SFP1_TX_N_0 [ create_bd_port -dir O SFP1_TX_N_0 ]
  set SFP1_TX_P_0 [ create_bd_port -dir O SFP1_TX_P_0 ]
  set pcie_perstn [ create_bd_port -dir I -type rst pcie_perstn ]
  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_LOW} \
 ] $pcie_perstn
  set resetn [ create_bd_port -dir I -type rst resetn ]
  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_LOW} \
 ] $resetn

  # Create instance: axis_wrmem
  create_hier_cell_axis_wrmem [current_bd_instance .] axis_wrmem

  # Create instance: eth10_capt_ctrl
  create_hier_cell_eth10_capt_ctrl [current_bd_instance .] eth10_capt_ctrl

  # Create instance: eth_quad0
  create_hier_cell_eth_quad0 [current_bd_instance .] eth_quad0

  # Create instance: fanctrl
  create_hier_cell_fanctrl [current_bd_instance .] fanctrl

  # Create instance: pcie_dram
  create_hier_cell_pcie_dram [current_bd_instance .] pcie_dram

  # Create instance: reset_100M, and set properties
  set reset_100M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 reset_100M ]
  set_property -dict [ list \
   CONFIG.RESET_BOARD_INTERFACE {resetn} \
   CONFIG.USE_BOARD_FLOW {true} \
 ] $reset_100M

  # Create instance: util_vector_logic_0, and set properties
  set util_vector_logic_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_0 ]
  set_property -dict [ list \
   CONFIG.C_OPERATION {not} \
   CONFIG.C_SIZE {1} \
 ] $util_vector_logic_0

  # Create instance: xgmii_to_axis
  create_hier_cell_xgmii_to_axis [current_bd_instance .] xgmii_to_axis

  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0} \
 ] $xlconstant_0

  # Create interface connections
  connect_bd_intf_net -intf_net MGTCLK0_1 [get_bd_intf_ports MGTCLK0_0] [get_bd_intf_pins eth_quad0/MGTCLK0]
  connect_bd_intf_net -intf_net S_AXIS_1 [get_bd_intf_pins axis_wrmem/S_AXIS] [get_bd_intf_pins xgmii_to_axis/OV]
  connect_bd_intf_net -intf_net S_AXI_S2MM_1 [get_bd_intf_pins axis_wrmem/M_AXI_S2MM] [get_bd_intf_pins pcie_dram/S_AXI_S2MM]
  connect_bd_intf_net -intf_net default_300mhz_clk0_1 [get_bd_intf_ports default_300mhz_clk0] [get_bd_intf_pins pcie_dram/default_300mhz_clk0]
  connect_bd_intf_net -intf_net pcie_dram_M_AXI_REGS [get_bd_intf_pins eth10_capt_ctrl/s_axi_AXILiteS] [get_bd_intf_pins pcie_dram/M_AXI_REGS]
  connect_bd_intf_net -intf_net pcie_dram_ddr4_sdram_c0 [get_bd_intf_ports ddr4_sdram_c0] [get_bd_intf_pins pcie_dram/ddr4_sdram_c0]
  connect_bd_intf_net -intf_net pcie_dram_led_8bits [get_bd_intf_ports led_8bits] [get_bd_intf_pins pcie_dram/led_8bits]
  connect_bd_intf_net -intf_net pcie_dram_pci_express_x8 [get_bd_intf_ports pci_express_x8] [get_bd_intf_pins pcie_dram/pci_express_x8]
  connect_bd_intf_net -intf_net pcie_refclk_1 [get_bd_intf_ports pcie_refclk] [get_bd_intf_pins pcie_dram/pcie_refclk]

  # Create port connections
  connect_bd_net -net CLEAR_ERR_1 [get_bd_pins eth10_capt_ctrl/CLEAR_ERR] [get_bd_pins xgmii_to_axis/CLEAR_ERR]
  connect_bd_net -net CLK_1 [get_bd_pins eth_quad0/dclk] [get_bd_pins fanctrl/CLK] [get_bd_pins pcie_dram/clk_100] [get_bd_pins reset_100M/slowest_sync_clk]
  connect_bd_net -net CLOCK_CNT_1 [get_bd_pins eth10_capt_ctrl/CLOCK_CNT] [get_bd_pins xgmii_to_axis/CLOCK_CNT]
  connect_bd_net -net GAPLEN_1 [get_bd_pins eth10_capt_ctrl/TEST_GAP_SIZE] [get_bd_pins eth_quad0/GAPLEN]
  connect_bd_net -net KEEP_ERROR_PACKET_1 [get_bd_pins eth10_capt_ctrl/KEEP_ERROR_PACKET] [get_bd_pins xgmii_to_axis/KEEP_ERROR_PACKET]
  connect_bd_net -net Net [get_bd_ports I2C_SDA] [get_bd_pins fanctrl/I2C_SDA]
  connect_bd_net -net Net1 [get_bd_ports I2C_SCL] [get_bd_pins fanctrl/I2C_SCL]
  connect_bd_net -net RESET_N_1 [get_bd_pins fanctrl/RESET_N] [get_bd_pins reset_100M/peripheral_aresetn]
  connect_bd_net -net SFP1_RX_N_0_1 [get_bd_ports SFP1_RX_N_0] [get_bd_pins eth_quad0/SFP1_RX_N]
  connect_bd_net -net SFP1_RX_P_0_1 [get_bd_ports SFP1_RX_P_0] [get_bd_pins eth_quad0/SFP1_RX_P]
  connect_bd_net -net STARTBTN_1 [get_bd_pins eth10_capt_ctrl/TEST_PKT] [get_bd_pins eth_quad0/STARTBTN]
  connect_bd_net -net axis_wrmem_CAP_CNT [get_bd_pins axis_wrmem/CAP_CNT] [get_bd_pins eth10_capt_ctrl/CAP_CNT]
  connect_bd_net -net axis_wrmem_CAP_DELIM [get_bd_pins axis_wrmem/CAP_DELIM] [get_bd_pins eth10_capt_ctrl/CAP_DELIM]
  connect_bd_net -net axis_wrmem_CAP_WCMD [get_bd_pins axis_wrmem/CAP_WCMD] [get_bd_pins eth10_capt_ctrl/CAP_WCMD]
  connect_bd_net -net axis_wrmem_CAP_WDATA [get_bd_pins axis_wrmem/CAP_WDATA] [get_bd_pins eth10_capt_ctrl/CAP_WDATA]
  connect_bd_net -net axis_wrmem_CAP_WORDCNT [get_bd_pins axis_wrmem/CAP_WORDCNT] [get_bd_pins eth10_capt_ctrl/CAP_WORDCNT]
  connect_bd_net -net axis_wrmem_CUR_ADDR [get_bd_pins axis_wrmem/CUR_ADDR] [get_bd_pins eth10_capt_ctrl/WADDR_PRE]
  connect_bd_net -net axis_wrmem_CUR_WADDR [get_bd_pins axis_wrmem/CUR_WADDR] [get_bd_pins eth10_capt_ctrl/WADDR_POST]
  connect_bd_net -net axis_wrmem_ERR_DELIM [get_bd_pins axis_wrmem/ERR_DELIM] [get_bd_pins eth10_capt_ctrl/ERR_DELIM]
  connect_bd_net -net axis_wrmem_ERR_FATAL [get_bd_pins axis_wrmem/ERR_FATAL] [get_bd_pins eth10_capt_ctrl/ERR_WCMD]
  connect_bd_net -net axis_wrmem_ERR_STS [get_bd_pins axis_wrmem/ERR_STS] [get_bd_pins eth10_capt_ctrl/ERR_STS]
  connect_bd_net -net axis_wrmem_s2mm_err [get_bd_pins axis_wrmem/s2mm_err] [get_bd_pins eth10_capt_ctrl/ERR_S2MM]
  connect_bd_net -net eth10_capt_ctrl_TEST_PKT_SIZE [get_bd_pins eth10_capt_ctrl/TEST_PKT_SIZE] [get_bd_pins eth_quad0/PKTLEN] [get_bd_pins xgmii_to_axis/TEST_PKT_SIZE]
  connect_bd_net -net eth_quad0_FCS_CORRECT_0 [get_bd_pins eth_quad0/FCS_CORRECT_0] [get_bd_pins xgmii_to_axis/FCS_CORRECT]
  connect_bd_net -net eth_quad0_FCS_EN_0 [get_bd_pins eth_quad0/FCS_EN_0] [get_bd_pins xgmii_to_axis/FCS_EN]
  connect_bd_net -net eth_quad0_RXD_0 [get_bd_pins eth_quad0/RXD_0] [get_bd_pins xgmii_to_axis/IN_RXD]
  connect_bd_net -net eth_quad0_RXLEN_0 [get_bd_pins eth_quad0/RXLEN_0] [get_bd_pins xgmii_to_axis/IN_RXLEN]
  connect_bd_net -net eth_quad0_XGMII_CLK [get_bd_pins axis_wrmem/XGMII_CLK] [get_bd_pins eth10_capt_ctrl/CLK] [get_bd_pins eth_quad0/XGMII_CLK] [get_bd_pins pcie_dram/XGMII_CLK] [get_bd_pins xgmii_to_axis/XGMII_CLK]
  connect_bd_net -net eth_quad0_XGMII_RESET [get_bd_pins eth_quad0/XGMII_RESET] [get_bd_pins util_vector_logic_0/Op1]
  connect_bd_net -net eth_quad_SFP1_TX_N [get_bd_ports SFP1_TX_N_0] [get_bd_pins eth_quad0/SFP1_TX_N]
  connect_bd_net -net eth_quad_SFP1_TX_P [get_bd_ports SFP1_TX_P_0] [get_bd_pins eth_quad0/SFP1_TX_P]
  connect_bd_net -net pcie_perstn_1 [get_bd_ports pcie_perstn] [get_bd_pins pcie_dram/pcie_perstn]
  connect_bd_net -net reset_1 [get_bd_pins eth_quad0/reset] [get_bd_pins reset_100M/peripheral_reset]
  connect_bd_net -net resetn_1 [get_bd_ports resetn] [get_bd_pins pcie_dram/resetn] [get_bd_pins reset_100M/ext_reset_in]
  connect_bd_net -net rst_ten_gig_eth_pcs_pma_0_156M_peripheral_aresetn [get_bd_pins axis_wrmem/XGMII_RESETN] [get_bd_pins eth10_capt_ctrl/RESETN] [get_bd_pins pcie_dram/XGMII_RESETN] [get_bd_pins util_vector_logic_0/Res] [get_bd_pins xgmii_to_axis/XGMII_RESETN]
  connect_bd_net -net xgmii_to_axis_CAP_PUSH [get_bd_pins eth10_capt_ctrl/CAP_PKT] [get_bd_pins xgmii_to_axis/CAP_PUSH]
  connect_bd_net -net xgmii_to_axis_ERR_FCS [get_bd_pins eth10_capt_ctrl/ERR_FCS] [get_bd_pins xgmii_to_axis/ERR_FCS]
  connect_bd_net -net xgmii_to_axis_ERR_FULL [get_bd_pins eth10_capt_ctrl/ERR_FULL] [get_bd_pins xgmii_to_axis/ERR_FULL]
  connect_bd_net -net xgmii_to_axis_ERR_LONG [get_bd_pins eth10_capt_ctrl/ERR_LONG] [get_bd_pins xgmii_to_axis/ERR_LONG]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins xgmii_to_axis/TEST_PKT] [get_bd_pins xlconstant_0/dout]

  # Create address segments
  create_bd_addr_seg -range 0x000100000000 -offset 0x00000000 [get_bd_addr_spaces axis_wrmem/axi_datamover_0/Data_S2MM] [get_bd_addr_segs pcie_dram/ddr4_0/C0_DDR4_MEMORY_MAP/C0_DDR4_ADDRESS_BLOCK] SEG_ddr4_0_C0_DDR4_ADDRESS_BLOCK
  create_bd_addr_seg -range 0x00010000 -offset 0x00200000 [get_bd_addr_spaces pcie_dram/xdma_0/M_AXI_LITE] [get_bd_addr_segs pcie_dram/axi_gpio_0/S_AXI/Reg] SEG_axi_gpio_0_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x00000000 [get_bd_addr_spaces pcie_dram/xdma_0/M_AXI_LITE] [get_bd_addr_segs eth10_capt_ctrl/axilite_regs_0/s_axi_AXILiteS/reg0] SEG_axilite_regs_0_reg0
  create_bd_addr_seg -range 0x000100000000 -offset 0x00000000 [get_bd_addr_spaces pcie_dram/xdma_0/M_AXI] [get_bd_addr_segs pcie_dram/ddr4_0/C0_DDR4_MEMORY_MAP/C0_DDR4_ADDRESS_BLOCK] SEG_ddr4_0_C0_DDR4_ADDRESS_BLOCK
  create_bd_addr_seg -range 0x00100000 -offset 0x00100000 [get_bd_addr_spaces pcie_dram/xdma_0/M_AXI_LITE] [get_bd_addr_segs pcie_dram/ddr4_0/C0_DDR4_MEMORY_MAP_CTRL/C0_REG] SEG_ddr4_0_C0_REG


  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


