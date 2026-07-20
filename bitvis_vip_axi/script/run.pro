# run.pro for uvvm_assertions
include ../../script/sim_init.pro
BuildName regression_bitvis_vip_axi

TestSuite bitvis_vip_axi
ChangeWorkingDirectory ../tb/maintenance_tb

library  bitvis_vip_axi
analyze  axi_slave_model_pkg.vhd
analyze  axi_slave_model.vhd

library  tb_bitvis_vip_axi
analyze  axi_th.vhd
RunTest  axi_bfm_tb.vhd
RunTest  axi_vvc_tb.vhd
