# run.pro
include ../../script/sim_init.pro
BuildName regression_bitvis_vip_sbi

TestSuite bitvis_vip_sbi
ChangeWorkingDirectory ../tb/maintenance_tb

library  tb_bitvis_vip_sbi
analyze  sbi_fifo.vhd
analyze  sbi_slave.vhd
analyze  sbi_th.vhd
RunTest  sbi_vvc_tb.vhd
RunTest  sbi_vvc_multi_cycle_read_tb.vhd
