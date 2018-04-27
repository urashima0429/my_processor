## Generated SDC file "processor_p1.sdc"

## Copyright (C) 2017  Intel Corporation. All rights reserved.
## Your use of Intel Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Intel Program License 
## Subscription Agreement, the Intel Quartus Prime License Agreement,
## the Intel FPGA IP License Agreement, or other applicable license
## agreement, including, without limitation, that your use is for
## the sole purpose of programming logic devices manufactured by
## Intel and sold by Intel or its authorized distributors.  Please
## refer to the applicable agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus Prime"
## VERSION "Version 17.1.0 Build 590 10/25/2017 SJ Standard Edition"

## DATE    "Fri Apr 27 20:31:27 2018"

##
## DEVICE  "EP4CE30F23I7"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {clock} -period 50.000 -waveform { 0.000 25.000 } [get_ports {clock}]
create_clock -name {reset} -period 1.000 -waveform { 0.000 0.500 } [get_ports {reset}]
create_clock -name {exec} -period 1.000 -waveform { 0.000 0.500 } [get_ports {exec}]


#**************************************************************
# Create Generated Clock
#**************************************************************



#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {reset}] -rise_to [get_clocks {exec}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {reset}] -fall_to [get_clocks {exec}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {reset}] -rise_to [get_clocks {clock}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {reset}] -fall_to [get_clocks {clock}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {reset}] -rise_to [get_clocks {exec}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {reset}] -fall_to [get_clocks {exec}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {reset}] -rise_to [get_clocks {clock}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {reset}] -fall_to [get_clocks {clock}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {exec}] -rise_to [get_clocks {reset}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {exec}] -fall_to [get_clocks {reset}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {exec}] -rise_to [get_clocks {exec}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {exec}] -fall_to [get_clocks {exec}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {exec}] -rise_to [get_clocks {clock}]  0.040  
set_clock_uncertainty -rise_from [get_clocks {exec}] -fall_to [get_clocks {clock}]  0.040  
set_clock_uncertainty -fall_from [get_clocks {exec}] -rise_to [get_clocks {reset}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {exec}] -fall_to [get_clocks {reset}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {exec}] -rise_to [get_clocks {exec}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {exec}] -fall_to [get_clocks {exec}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {exec}] -rise_to [get_clocks {clock}]  0.040  
set_clock_uncertainty -fall_from [get_clocks {exec}] -fall_to [get_clocks {clock}]  0.040  
set_clock_uncertainty -rise_from [get_clocks {clock}] -rise_to [get_clocks {exec}]  0.040  
set_clock_uncertainty -rise_from [get_clocks {clock}] -fall_to [get_clocks {exec}]  0.040  
set_clock_uncertainty -rise_from [get_clocks {clock}] -rise_to [get_clocks {clock}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clock}] -fall_to [get_clocks {clock}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clock}] -rise_to [get_clocks {exec}]  0.040  
set_clock_uncertainty -fall_from [get_clocks {clock}] -fall_to [get_clocks {exec}]  0.040  
set_clock_uncertainty -fall_from [get_clocks {clock}] -rise_to [get_clocks {clock}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clock}] -fall_to [get_clocks {clock}]  0.020  


#**************************************************************
# Set Input Delay
#**************************************************************



#**************************************************************
# Set Output Delay
#**************************************************************



#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************



#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

