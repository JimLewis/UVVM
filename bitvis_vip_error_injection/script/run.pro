# run.pro for uvvm_assertions
include ../../script/sim_init.pro
BuildName regression_bitvis_vip_error_injection

TestSuite bitvis_vip_error_injection
ChangeWorkingDirectory ../tb/maintenance_tb

library  tb_bitvis_vip_error_injection
RunTest  ei_vip_tb.vhd
