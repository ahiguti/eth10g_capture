# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "CLOCK_DIV" -parent ${Page_0}
  ipgui::add_param $IPINST -name "IGNORE_ACK" -parent ${Page_0}
  ipgui::add_param $IPINST -name "RW_DELAY" -parent ${Page_0}
  ipgui::add_param $IPINST -name "USE_RESTART" -parent ${Page_0}


}

proc update_PARAM_VALUE.CLOCK_DIV { PARAM_VALUE.CLOCK_DIV } {
	# Procedure called to update CLOCK_DIV when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.CLOCK_DIV { PARAM_VALUE.CLOCK_DIV } {
	# Procedure called to validate CLOCK_DIV
	return true
}

proc update_PARAM_VALUE.IGNORE_ACK { PARAM_VALUE.IGNORE_ACK } {
	# Procedure called to update IGNORE_ACK when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.IGNORE_ACK { PARAM_VALUE.IGNORE_ACK } {
	# Procedure called to validate IGNORE_ACK
	return true
}

proc update_PARAM_VALUE.RW_DELAY { PARAM_VALUE.RW_DELAY } {
	# Procedure called to update RW_DELAY when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.RW_DELAY { PARAM_VALUE.RW_DELAY } {
	# Procedure called to validate RW_DELAY
	return true
}

proc update_PARAM_VALUE.USE_RESTART { PARAM_VALUE.USE_RESTART } {
	# Procedure called to update USE_RESTART when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.USE_RESTART { PARAM_VALUE.USE_RESTART } {
	# Procedure called to validate USE_RESTART
	return true
}


proc update_MODELPARAM_VALUE.IGNORE_ACK { MODELPARAM_VALUE.IGNORE_ACK PARAM_VALUE.IGNORE_ACK } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IGNORE_ACK}] ${MODELPARAM_VALUE.IGNORE_ACK}
}

proc update_MODELPARAM_VALUE.CLOCK_DIV { MODELPARAM_VALUE.CLOCK_DIV PARAM_VALUE.CLOCK_DIV } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CLOCK_DIV}] ${MODELPARAM_VALUE.CLOCK_DIV}
}

proc update_MODELPARAM_VALUE.USE_RESTART { MODELPARAM_VALUE.USE_RESTART PARAM_VALUE.USE_RESTART } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.USE_RESTART}] ${MODELPARAM_VALUE.USE_RESTART}
}

proc update_MODELPARAM_VALUE.RW_DELAY { MODELPARAM_VALUE.RW_DELAY PARAM_VALUE.RW_DELAY } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.RW_DELAY}] ${MODELPARAM_VALUE.RW_DELAY}
}

