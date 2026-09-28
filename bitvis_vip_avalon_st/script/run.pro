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
BuildName regression_bitvis_vip_avalon_st

TestSuite bitvis_vip_avalon_st
ChangeWorkingDirectory ../tb/maintenance_tb

library  tb_bitvis_vip_avalon_st
analyze  avalon_st_fifo.vhd
analyze  avalon_st_th.vhd
analyze  avalon_st_bfm_tb.vhd
simulate avalon_st_bfm_tb [TestName bfm_test_packet_data]           [generic GC_TESTCASE test_packet_data]
simulate avalon_st_bfm_tb [TestName bfm_test_stream_data]           [generic GC_TESTCASE test_stream_data]
simulate avalon_st_bfm_tb [TestName bfm_test_setup_and_hold_times]  [generic GC_TESTCASE test_setup_and_hold_times]

analyze  avalon_st_vvc_tb.vhd
simulate avalon_st_vvc_tb [TestName vvc_test_packet_data]           [generic GC_TESTCASE test_packet_data]
if {$::osvvm::ToolVendor eq "Aldec"} {
  ExpectedStatus FAILED 0 2 0 "Extra unwanted activity generated in Aldec"
}
simulate avalon_st_vvc_tb [TestName vvc_test_stream_data]           [generic GC_TESTCASE test_stream_data]
if {$::osvvm::ToolVendor eq "Aldec"} {
  ExpectedStatus FAILED 0 2 0 "Extra unwanted activity generated in Aldec"
}
simulate avalon_st_vvc_tb [TestName vvc_test_setup_and_hold_times]  [generic GC_TESTCASE test_setup_and_hold_times]
if {$::osvvm::ToolVendor eq "Aldec"} {
  ExpectedStatus FAILED 0 1 0 "Extra unwanted activity generated in Aldec"
}
simulate avalon_st_vvc_tb [TestName vvc_test_random_configuration]  [generic GC_TESTCASE test_random_configuration]
if {$::osvvm::ToolVendor eq "Aldec"} {
  ExpectedStatus FAILED 0 1 0 "Extra unwanted activity generated in Aldec"
}
simulate avalon_st_vvc_tb [TestName vvc_test_unwanted_activity]     [generic GC_TESTCASE test_unwanted_activity]
if {$::osvvm::ToolVendor eq "Aldec"} {
  ExpectedStatus FAILED 0 5 4 "Extra unwanted activity generated in Aldec"
}
