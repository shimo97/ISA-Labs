###################################################################

# Created by write_sdc on Tue Oct 26 14:11:05 2021

###################################################################
set sdc_version 2.1

set_units -time ns -resistance MOhm -capacitance fF -voltage V -current mA
create_clock [get_ports CLK]  -name MY_CLK  -period 9.8  -waveform {0 4.9}
set_clock_uncertainty 0.07  [get_clocks MY_CLK]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports RST_n]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {DIN[11]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {DIN[10]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {DIN[9]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {DIN[8]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {DIN[7]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {DIN[6]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {DIN[5]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {DIN[4]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {DIN[3]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {DIN[2]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {DIN[1]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {DIN[0]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports VIN]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {b0[11]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {b0[10]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {b0[9]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {b0[8]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {b0[7]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {b0[6]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {b0[5]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {b0[4]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {b0[3]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {b0[2]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {b0[1]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {b0[0]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {b1[11]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {b1[10]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {b1[9]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {b1[8]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {b1[7]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {b1[6]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {b1[5]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {b1[4]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {b1[3]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {b1[2]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {b1[1]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {b1[0]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {a1[11]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {a1[10]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {a1[9]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {a1[8]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {a1[7]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {a1[6]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {a1[5]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {a1[4]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {a1[3]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {a1[2]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {a1[1]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {a1[0]}]