# run.pro for uvvm_assertions
include ../../script/sim_init.pro
BuildName regression_bitvis_vip_i2c

TestSuite bitvis_vip_i2c
ChangeWorkingDirectory ../tb/maintenance_tb

# requires include $uvvm_support/build.pro

library  tb_bitvis_vip_i2c
analyze i2c_master_dut.vhd
analyze i2c_slave_dut.vhd
analyze i2c_th.vhd

RunTest  i2c_vvc_tb.vhd
