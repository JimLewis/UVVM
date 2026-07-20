# run.pro for uvvm_assertions
include ../../script/sim_init.pro
BuildName regression_bitvis_vip_rgmii

TestSuite bitvis_vip_rgmii
ChangeWorkingDirectory ../tb/maintenance_tb

library  tb_bitvis_vip_rgmii
analyze  rgmii_th.vhd
RunTest  rgmii_bfm_tb.vhd
RunTest  rgmii_vvc_tb.vhd
