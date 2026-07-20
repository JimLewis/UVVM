# run.pro for uvvm_assertions
include ../../script/sim_init.pro
BuildName regression_bitvis_irqc

TestSuite bitvis_irqc
ChangeWorkingDirectory ../tb/maintenance_tb

library tb_bitvis_irqc
RunTest  irqc_tb.vhd
