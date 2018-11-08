# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "ADDR_MOD_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "ADDR_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "WORDCNT_WORD_SIZE_LOG2" -parent ${Page_0}


}

proc update_PARAM_VALUE.ADDR_MOD_WIDTH { PARAM_VALUE.ADDR_MOD_WIDTH } {
	# Procedure called to update ADDR_MOD_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ADDR_MOD_WIDTH { PARAM_VALUE.ADDR_MOD_WIDTH } {
	# Procedure called to validate ADDR_MOD_WIDTH
	return true
}

proc update_PARAM_VALUE.ADDR_WIDTH { PARAM_VALUE.ADDR_WIDTH } {
	# Procedure called to update ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ADDR_WIDTH { PARAM_VALUE.ADDR_WIDTH } {
	# Procedure called to validate ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.WORDCNT_WORD_SIZE_LOG2 { PARAM_VALUE.WORDCNT_WORD_SIZE_LOG2 } {
	# Procedure called to update WORDCNT_WORD_SIZE_LOG2 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.WORDCNT_WORD_SIZE_LOG2 { PARAM_VALUE.WORDCNT_WORD_SIZE_LOG2 } {
	# Procedure called to validate WORDCNT_WORD_SIZE_LOG2
	return true
}


proc update_MODELPARAM_VALUE.WORDCNT_WORD_SIZE_LOG2 { MODELPARAM_VALUE.WORDCNT_WORD_SIZE_LOG2 PARAM_VALUE.WORDCNT_WORD_SIZE_LOG2 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.WORDCNT_WORD_SIZE_LOG2}] ${MODELPARAM_VALUE.WORDCNT_WORD_SIZE_LOG2}
}

proc update_MODELPARAM_VALUE.ADDR_WIDTH { MODELPARAM_VALUE.ADDR_WIDTH PARAM_VALUE.ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ADDR_WIDTH}] ${MODELPARAM_VALUE.ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.ADDR_MOD_WIDTH { MODELPARAM_VALUE.ADDR_MOD_WIDTH PARAM_VALUE.ADDR_MOD_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ADDR_MOD_WIDTH}] ${MODELPARAM_VALUE.ADDR_MOD_WIDTH}
}

