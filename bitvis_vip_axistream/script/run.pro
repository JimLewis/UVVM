# run.pro for uvvm_assertions
include ../../script/sim_init.pro
BuildName regression_bitvis_vip_axistream

TestSuite bitvis_vip_axistream
ChangeWorkingDirectory ../tb/maintenance_tb

# library  bitvis_vip_axistream

library  tb_bitvis_vip_axistream
analyze  axis_fifo.vhd
analyze  axistream_th.vhd

RunTest  axistream_bfm_tb.vhd
RunTest  axistream_bfm_slv_array_tb.vhd
RunTest  axistream_vvc_tb.vhd
RunTest  axistream_vvc_slv_array_tb.vhd
RunTest  axistream_vvc_multiple_tb.vhd
RunTest  axistream_vvc_width_tb.vhd
