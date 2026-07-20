# run.pro for uvvm_assertions
include ../../script/sim_init.pro
BuildName regression_bitvis_vip_avalon_st

TestSuite bitvis_vip_avalon_st
ChangeWorkingDirectory ../tb/maintenance_tb

library  tb_bitvis_vip_avalon_st
analyze  avalon_st_fifo.vhd
analyze  avalon_st_th.vhd
RunTest  avalon_st_bfm_tb.vhd
RunTest  avalon_st_vvc_tb.vhd
