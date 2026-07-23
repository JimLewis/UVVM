#================================================================================================================================
# Copyright 2026  SynthWorks Design Inc
# Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.
# You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0 and in the provided file LICENSE.
#
# Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on
# an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and limitations under the License.
#================================================================================================================================
# run.pro
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


