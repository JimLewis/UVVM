# run.pro for uvvm_assertions
include ../../script/sim_init.pro
BuildName regression_bitvis_vip_axilite

TestSuite bitvis_vip_axilite
ChangeWorkingDirectory ../tb/maintenance_tb

library  bitvis_vip_axilite
analyze  axilite_slave_model_pkg.vhd
analyze  axilite_slave_model.vhd

library  tb_bitvis_vip_axilite
analyze  axilite_slave.vhd
analyze  axilite_th.vhd
RunTest  axilite_bfm_tb.vhd
RunTest  axilite_vvc_tb.vhd
