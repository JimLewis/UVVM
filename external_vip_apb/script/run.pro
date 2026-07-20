# run.pro for uvvm_assertions
include ../../script/sim_init.pro
BuildName regression_uvvm_apb

TestSuite external_vip_apb
ChangeWorkingDirectory ../tb/maintenance_tb

library  tb_uvvm_apb
analyze  apb_register.vhd
RunTest  apb_bfm_tb.vhd
RunTest  apb_vvc_tb.vhd
