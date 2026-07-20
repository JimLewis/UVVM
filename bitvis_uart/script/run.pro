# run.pro for uvvm_assertions
include ../../script/sim_init.pro
BuildName regression_bitvis_uart

TestSuite bitvis_uart
ChangeWorkingDirectory ../tb/maintenance_tb

library tb_bitvis_uart
analyze  ../uart_vvc_demo_th.vhd  ;# required for uart_vvc_tb
RunTest  ../uart_vvc_demo_tb.vhd

RunTest  uart_bfm_tb.vhd
RunTest  uart_vvc_tb.vhd  ;# uses uart_vvc_demo_th

