# run.pro for uvvm_assertions
include ../../script/sim_init.pro
BuildName regression_bitvis_vip_clock_generator

TestSuite bitvis_vip_clock_generator
ChangeWorkingDirectory ../tb/maintenance_tb

library  tb_bitvis_vip_clock_generator
analyze  clock_generator_th.vhd
RunTest  clock_generator_tb.vhd
