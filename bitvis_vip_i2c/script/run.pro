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
BuildName regression_bitvis_vip_i2c

TestSuite bitvis_vip_i2c
ChangeWorkingDirectory ../tb/maintenance_tb

# requires include $uvvm_support/build.pro

library  tb_bitvis_vip_i2c
analyze i2c_master_dut.vhd
analyze i2c_slave_dut.vhd
analyze i2c_th.vhd

analyze  i2c_vvc_tb.vhd
simulate i2c_vvc_tb [TestName master_to_slave_VVC-to-VVC_7_bit_addressing]                                           [generic GC_TESTCASE master_to_slave_VVC-to-VVC_7_bit_addressing]
simulate i2c_vvc_tb [TestName slave_to_master_VVC-to-VVC_7_bit_addressing]                                           [generic GC_TESTCASE slave_to_master_VVC-to-VVC_7_bit_addressing]
simulate i2c_vvc_tb [TestName master_to_slave_VVC-to-VVC_10_bit_addressing]                                          [generic GC_TESTCASE master_to_slave_VVC-to-VVC_10_bit_addressing]
simulate i2c_vvc_tb [TestName slave_to_master_VVC-to-VVC_10_bit_addressing]                                          [generic GC_TESTCASE slave_to_master_VVC-to-VVC_10_bit_addressing]
simulate i2c_vvc_tb [TestName single-byte_communication_with_master_dut]                                             [generic GC_TESTCASE single-byte_communication_with_master_dut]
simulate i2c_vvc_tb [TestName single-byte_communication_with_single_slave_dut]                                       [generic GC_TESTCASE single-byte_communication_with_single_slave_dut]
simulate i2c_vvc_tb [TestName single-byte_communication_with_multiple_slave_duts]                                    [generic GC_TESTCASE single-byte_communication_with_multiple_slave_duts]
simulate i2c_vvc_tb [TestName multi-byte_transmit_to_i2c_master_dut]                                                 [generic GC_TESTCASE multi-byte_transmit_to_i2c_master_dut]
simulate i2c_vvc_tb [TestName multi-byte_receive_from_i2c_master_dut]                                                [generic GC_TESTCASE multi-byte_receive_from_i2c_master_dut]
simulate i2c_vvc_tb [TestName multi-byte_transmit_to_i2c_slave_dut]                                                  [generic GC_TESTCASE multi-byte_transmit_to_i2c_slave_dut]
simulate i2c_vvc_tb [TestName multi-byte_receive_from_i2c_slave_dut]                                                 [generic GC_TESTCASE multi-byte_receive_from_i2c_slave_dut]
simulate i2c_vvc_tb [TestName multi-byte_receive_from_i2c_slave_VVC-to-VVC]                                          [generic GC_TESTCASE multi-byte_receive_from_i2c_slave_VVC-to-VVC]
simulate i2c_vvc_tb [TestName multi-byte_transaction_with_i2c_master_dut_with_repeated_start_conditions]             [generic GC_TESTCASE multi-byte_transaction_with_i2c_master_dut_with_repeated_start_conditions]
simulate i2c_vvc_tb [TestName single-byte_communication_with_multiple_slave_duts_without_stop_condition_in_between]  [generic GC_TESTCASE single-byte_communication_with_multiple_slave_duts_without_stop_condition_in_between]
simulate i2c_vvc_tb [TestName multi-byte_transmit_to_i2c_master_dut_10_bit_addressing]                               [generic GC_TESTCASE multi-byte_transmit_to_i2c_master_dut_10_bit_addressing]
simulate i2c_vvc_tb [TestName multi-byte_receive_from_i2c_master_dut_10_bit_addressing]                              [generic GC_TESTCASE multi-byte_receive_from_i2c_master_dut_10_bit_addressing]
simulate i2c_vvc_tb [TestName receive_and_fetch_result]                                                              [generic GC_TESTCASE receive_and_fetch_result]
simulate i2c_vvc_tb [TestName multi-byte-send-and-receive-with-restart]                                              [generic GC_TESTCASE multi-byte-send-and-receive-with-restart]
simulate i2c_vvc_tb [TestName master-slave-vvc-quick-command]                                                        [generic GC_TESTCASE master-slave-vvc-quick-command]
simulate i2c_vvc_tb [TestName master_quick_cmd_I2C_7bit_dut_test]                                                    [generic GC_TESTCASE master_quick_cmd_I2C_7bit_dut_test]
simulate i2c_vvc_tb [TestName scoreboard_test]                                                                       [generic GC_TESTCASE scoreboard_test]
simulate i2c_vvc_tb [TestName test_unwanted_activity]                                                                [generic GC_TESTCASE test_unwanted_activity]
if {$::osvvm::ToolVendor eq "Aldec"} {
  ExpectedStatus FAILED -12 -12 12  "Aldec detects extra unwanted activity"
}
