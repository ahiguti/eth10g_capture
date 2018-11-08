# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "WORDCNT_WORD_SIZE_L2" -parent ${Page_0}
  ipgui::add_param $IPINST -name "WORD_SIZE_L2" -parent ${Page_0}


}

proc update_PARAM_VALUE.WORDCNT_WORD_SIZE_L2 { PARAM_VALUE.WORDCNT_WORD_SIZE_L2 } {
	# Procedure called to update WORDCNT_WORD_SIZE_L2 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.WORDCNT_WORD_SIZE_L2 { PARAM_VALUE.WORDCNT_WORD_SIZE_L2 } {
	# Procedure called to validate WORDCNT_WORD_SIZE_L2
	return true
}

proc update_PARAM_VALUE.WORD_SIZE_L2 { PARAM_VALUE.WORD_SIZE_L2 } {
	# Procedure called to update WORD_SIZE_L2 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.WORD_SIZE_L2 { PARAM_VALUE.WORD_SIZE_L2 } {
	# Procedure called to validate WORD_SIZE_L2
	return true
}


proc update_MODELPARAM_VALUE.WORD_SIZE_L2 { MODELPARAM_VALUE.WORD_SIZE_L2 PARAM_VALUE.WORD_SIZE_L2 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.WORD_SIZE_L2}] ${MODELPARAM_VALUE.WORD_SIZE_L2}
}

proc update_MODELPARAM_VALUE.WORDCNT_WORD_SIZE_L2 { MODELPARAM_VALUE.WORDCNT_WORD_SIZE_L2 PARAM_VALUE.WORDCNT_WORD_SIZE_L2 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.WORDCNT_WORD_SIZE_L2}] ${MODELPARAM_VALUE.WORDCNT_WORD_SIZE_L2}
}

