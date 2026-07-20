# run.pro for uvvm_assertions
include ../../script/sim_init.pro
BuildName regression_bitvis_vip_gmii

TestSuite bitvis_vip_gmii
ChangeWorkingDirectory ../tb/maintenance_tb

library  tb_bitvis_vip_gmii
analyze  gmii_th.vhd
RunTest  gmii_bfm_tb.vhd
RunTest  gmii_vvc_tb.vhd
