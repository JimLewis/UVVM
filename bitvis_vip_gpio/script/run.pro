# run.pro for uvvm_assertions
include ../../script/sim_init.pro
BuildName regression_bitvis_vip_gpio

TestSuite bitvis_vip_gpio
ChangeWorkingDirectory ../tb/maintenance_tb

library  tb_bitvis_vip_gpio
RunTest  gpio_vvc_tb.vhd
