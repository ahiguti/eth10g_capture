#set_property PACKAGE_PIN AD26 [get_ports SFP1_RX_LOS]
#set_property PACKAGE_PIN AF24 [get_ports SFP1_TX_DISABLE]
#set_property IOSTANDARD LVCMOS25 [get_ports SFP1_RX_LOS]
#set_property IOSTANDARD LVCMOS25 [get_ports SFP1_TX_DISABLE]

#set_property PACKAGE_PIN BA27 [get_ports DBG_CLK]
#set_property PACKAGE_PIN BA28 [get_ports DBG_CLK2]
#set_property IOSTANDARD LVCMOS18 [get_ports DBG_CLK]
#set_property IOSTANDARD LVCMOS18 [get_ports DBG_CLK2]

#set_property PACKAGE_PIN AW25 [get_ports {DEBUG_OUT[0]}]
#set_property PACKAGE_PIN AY25 [get_ports {DEBUG_OUT[1]}]
#set_property IOSTANDARD LVCMOS18 [get_ports {DEBUG_OUT[0]}]
#set_property IOSTANDARD LVCMOS18 [get_ports {DEBUG_OUT[1]}]

#set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
#set_property BITSTREAM.CONFIG.CONFIGRATE 50 [current_design]
#set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]

set_property PACKAGE_PIN AN24 [get_ports I2C_SCL]
set_property IOSTANDARD LVCMOS18 [get_ports I2C_SCL]
set_property PACKAGE_PIN AP24 [get_ports I2C_SDA]
set_property IOSTANDARD LVCMOS18 [get_ports I2C_SDA]


set_property CONFIG_VOLTAGE 1.8 [current_design]
set_property CFGBVS GND [current_design]
set_property BITSTREAM.CONFIG.CONFIGFALLBACK Enable [current_design]
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property CONFIG_MODE SPIx8 [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 8 [current_design]
set_property BITSTREAM.CONFIG.EXTMASTERCCLK_EN DIV-1 [current_design]
set_property BITSTREAM.CONFIG.SPI_FALL_EDGE YES [current_design]
set_property BITSTREAM.CONFIG.UNUSEDPIN Pullup [current_design]
set_property BITSTREAM.CONFIG.SPI_32BIT_ADDR Yes [current_design]

