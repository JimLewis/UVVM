# run.pro for uvvm_assertions
include ../../script/sim_init.pro
BuildName regression_bitvis_vip_ethernet

TestSuite bitvis_vip_ethernet
ChangeWorkingDirectory ../tb/maintenance_tb

library  tb_bitvis_vip_ethernet
analyze  sbi_fifo.vhd
analyze  ethernet_sbi_pkg.vhd

analyze  ethernet_th.vhd

RunTest  ethernet_sbi_tb.vhd  ;# ethernet_th, ethernet_sbi_pkg
RunTest  ethernet_gmii_tb.vhd ;# ethernet_th


# These require mac_master which is in uvvm_support directory
# analyze  ethernet_gmii_mac_master_pkg.vhd ;# mac_master lib
# analyze  ethernet_gmii_mac_master_th.vhd ;# mac_master lib
# analyze  ethernet_gmii_mac_master_tb.vhd ;# mac_master lib


