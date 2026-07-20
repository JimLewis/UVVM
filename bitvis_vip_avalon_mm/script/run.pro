# run.pro for uvvm_assertions
include ../../script/sim_init.pro
BuildName regression_uvvm_avalon_mm

TestSuite uvvm_avalon_mm
ChangeWorkingDirectory ../tb/maintenance_tb

library  tb_uvvm_avalon_mm
analyze  avalon_mm_vvc_th.vhd

RunTest  avalon_mm_bfm_tb.vhd
RunTest  avalon_mm_bfm_spi_tb.vhd
RunTest  avalon_mm_vvc_tb.vhd
RunTest  avalon_mm_vvc_pipeline_tb.vhd
