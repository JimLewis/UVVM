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
BuildName regression_bitvis_vip_sbi

TestSuite bitvis_vip_sbi
ChangeWorkingDirectory ../tb/maintenance_tb

library  tb_bitvis_vip_sbi
analyze  sbi_fifo.vhd
analyze  sbi_slave.vhd
analyze  sbi_th.vhd

analyze  sbi_vvc_tb.vhd
simulate sbi_vvc_tb [TestName simple_write_and_check]                        [generic GC_TESTCASE simple_write_and_check]
simulate sbi_vvc_tb [TestName simple_write_and_read]                         [generic GC_TESTCASE simple_write_and_read]
simulate sbi_vvc_tb [TestName scoreboard_test]                               [generic GC_TESTCASE scoreboard_test]
simulate sbi_vvc_tb [TestName test_of_poll_until]                            [generic GC_TESTCASE test_of_poll_until]
simulate sbi_vvc_tb [TestName extended_write_and_read]                       [generic GC_TESTCASE extended_write_and_read]
simulate sbi_vvc_tb [TestName read_of_previous_value]                        [generic GC_TESTCASE read_of_previous_value]
simulate sbi_vvc_tb [TestName read_of_executor_status_and_inter_bfm_delay]   [generic GC_TESTCASE read_of_executor_status_and_inter_bfm_delay]
simulate sbi_vvc_tb [TestName distribution_of_vvc_commands]                  [generic GC_TESTCASE distribution_of_vvc_commands]
if {$::osvvm::ToolVendor eq "Aldec"} {
#  ExpectedStatus FAILED 0 0 -1  "Aldec has one less warning than expected - differs from Siemens"
}
simulate sbi_vvc_tb [TestName vvc_broadcast_test]                            [generic GC_TESTCASE vvc_broadcast_test]
simulate sbi_vvc_tb [TestName vvc_setup_and_hold_time_test]                  [generic GC_TESTCASE vvc_setup_and_hold_time_test]
simulate sbi_vvc_tb [TestName test_unwanted_activity]                        [generic GC_TESTCASE test_unwanted_activity]
RunTest  sbi_vvc_multi_cycle_read_tb.vhd [generic GC_TESTCASE fixed_wait_read_test]
