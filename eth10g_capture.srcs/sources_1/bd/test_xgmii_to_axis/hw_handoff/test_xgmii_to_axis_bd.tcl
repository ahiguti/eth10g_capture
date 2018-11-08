
################################################################
# This is a generated script based on design: test_xgmii_to_axis
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
# source test_xgmii_to_axis_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# add_packet_header, axis_fifo, axis_fifo, axis_fifo, get_packet_info

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
set design_name test_xgmii_to_axis

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

  # Create ports
  set FCS_CORRECT [ create_bd_port -dir I FCS_CORRECT ]
  set FCS_EN [ create_bd_port -dir I FCS_EN ]
  set OV_TREADY [ create_bd_port -dir I OV_TREADY ]
  set XGMII_CLK [ create_bd_port -dir I -type clk XGMII_CLK ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {156250000} \
 ] $XGMII_CLK
  set XGMII_D [ create_bd_port -dir I -from 63 -to 0 XGMII_D ]
  set XGMII_LEN [ create_bd_port -dir I -from 3 -to 0 XGMII_LEN ]
  set XGMII_RESETN [ create_bd_port -dir I -type rst XGMII_RESETN ]

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
  
  # Create instance: axis_fifo_0, and set properties
  set block_name axis_fifo
  set block_cell_name axis_fifo_0
  if { [catch {set axis_fifo_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $axis_fifo_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.FIFO_SIZE_L2 {0} \
 ] $axis_fifo_0

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
   CONFIG.FIFO_DELAY {2} \
   CONFIG.FIFO_REG {5} \
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
   CONFIG.FIFO_REG {4} \
   CONFIG.FIFO_SIZE_L2 {10} \
   CONFIG.WIDTH_DATA {24} \
   CONFIG.WIDTH_LAST {0} \
 ] $axis_fifo_pinfo

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
  
  # Create interface connections
  connect_bd_intf_net -intf_net axis_fifo_0_OV [get_bd_intf_pins add_packet_header_0/DATA] [get_bd_intf_pins axis_fifo_pdata/OV]
  connect_bd_intf_net -intf_net axis_fifo_pinfo_OV [get_bd_intf_pins add_packet_header_0/INFO] [get_bd_intf_pins axis_fifo_pinfo/OV]

  # Create port connections
  connect_bd_net -net FCS_CORRECT_0_1 [get_bd_ports FCS_CORRECT] [get_bd_pins get_packet_info_0/FCS_CORRECT]
  connect_bd_net -net FCS_EN_0_1 [get_bd_ports FCS_EN] [get_bd_pins get_packet_info_0/FCS_EN]
  connect_bd_net -net OV_TREADY_0_1 [get_bd_ports OV_TREADY] [get_bd_pins axis_fifo_0/OV_TREADY]
  connect_bd_net -net XGMII_CLK_1 [get_bd_ports XGMII_CLK] [get_bd_pins add_packet_header_0/CLK] [get_bd_pins axis_fifo_0/CLK] [get_bd_pins axis_fifo_pdata/CLK] [get_bd_pins axis_fifo_pinfo/CLK] [get_bd_pins get_packet_info_0/CLK]
  connect_bd_net -net XGMII_D_0_1 [get_bd_ports XGMII_D] [get_bd_pins get_packet_info_0/XGMII_D]
  connect_bd_net -net XGMII_LEN_0_1 [get_bd_ports XGMII_LEN] [get_bd_pins get_packet_info_0/XGMII_LEN]
  connect_bd_net -net XGMII_RESETN_1 [get_bd_ports XGMII_RESETN] [get_bd_pins add_packet_header_0/RESETN] [get_bd_pins axis_fifo_0/RESETN] [get_bd_pins axis_fifo_pdata/RESETN] [get_bd_pins axis_fifo_pinfo/RESETN] [get_bd_pins get_packet_info_0/RESETN]
  connect_bd_net -net add_packet_header_0_PKT_TDATA [get_bd_pins add_packet_header_0/PKT_TDATA] [get_bd_pins axis_fifo_0/IV_TDATA]
  connect_bd_net -net add_packet_header_0_PKT_TLAST [get_bd_pins add_packet_header_0/PKT_TLAST] [get_bd_pins axis_fifo_0/IV_TLAST]
  connect_bd_net -net add_packet_header_0_PKT_TVALID [get_bd_pins add_packet_header_0/PKT_TVALID] [get_bd_pins axis_fifo_0/IV_TVALID]
  connect_bd_net -net axis_fifo_0_IV_TREADY [get_bd_pins add_packet_header_0/PKT_TREADY] [get_bd_pins axis_fifo_0/IV_TREADY]
  connect_bd_net -net axis_fifo_pdata_IV_TREADY [get_bd_pins axis_fifo_pdata/IV_TREADY] [get_bd_pins get_packet_info_0/DATA_TREADY]
  connect_bd_net -net axis_fifo_pinfo_IV_TREADY [get_bd_pins axis_fifo_pinfo/IV_TREADY] [get_bd_pins get_packet_info_0/INFO_TREADY]
  connect_bd_net -net get_packet_info_0_DATA_TDATA [get_bd_pins axis_fifo_pdata/IV_TDATA] [get_bd_pins get_packet_info_0/DATA_TDATA]
  connect_bd_net -net get_packet_info_0_DATA_TVALID [get_bd_pins axis_fifo_pdata/IV_TVALID] [get_bd_pins get_packet_info_0/DATA_TVALID]
  connect_bd_net -net get_packet_info_0_INFO_TDATA [get_bd_pins axis_fifo_pinfo/IV_TDATA] [get_bd_pins get_packet_info_0/INFO_TDATA]
  connect_bd_net -net get_packet_info_0_INFO_TVALID [get_bd_pins axis_fifo_pinfo/IV_TVALID] [get_bd_pins get_packet_info_0/INFO_TVALID]

  # Create address segments


  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


