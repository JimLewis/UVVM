# run.pro for uvvm_assertions
include ../../script/sim_init.pro
BuildName regression_bitvis_vip_uart

TestSuite bitvis_vip_uart
ChangeWorkingDirectory ../tb/maintenance_tb

library  tb_bitvis_vip_uart
analyze  uart_transaction_sb_pkg.vhd
analyze  uart_monitor_th.vhd
RunTest  uart_monitor_tb.vhd
analyze  uart_vvc_th.vhd
RunTest  uart_vvc_tb.vhd
analyze  ../uvvm_demo_th.vhd
RunTest  ../uvvm_demo_tb.vhd
