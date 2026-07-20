# run.pro for uvvm_assertions
include ../../script/sim_init.pro
BuildName regression_bitvis_vip_wishbone

TestSuite bitvis_vip_wishbone
ChangeWorkingDirectory ../tb/maintenance_tb

library  tb_bitvis_vip_wishbone
analyze  wishbone_fifo.vhd
analyze  wishbone_th.vhd
RunTest  wishbone_vvc_tb.vhd
