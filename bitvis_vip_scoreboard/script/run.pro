# run.pro for uvvm_assertions
include ../../script/sim_init.pro
BuildName regression_bitvis_vip_scoreboard

TestSuite bitvis_vip_scoreboard
ChangeWorkingDirectory ../tb/maintenance_tb

library tb_bitvis_vip_scoreboard
RunTest  generic_sb_slv_tb.vhd
RunTest  generic_sb_record_tb.vhd
