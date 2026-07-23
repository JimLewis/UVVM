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
BuildName regression_bitvis_vip_spi

TestSuite bitvis_vip_spi
ChangeWorkingDirectory ../tb/maintenance_tb

library  tb_bitvis_vip_spi
analyze  spi_pif.vhd
analyze  spi_vvc_tb.vhd
simulate  spi_vvc_tb  [TestName VVC-to-VVC]                    [generic GC_TESTCASE VVC-to-VVC]
simulate  spi_vvc_tb  [TestName spi_master_dut_to_slave_VVC]   [generic GC_TESTCASE spi_master_dut_to_slave_VVC]
simulate  spi_vvc_tb  [TestName spi_slave_vvc_to_master_dut]   [generic GC_TESTCASE spi_slave_vvc_to_master_dut]
simulate  spi_vvc_tb  [TestName spi_master_vvc_to_slave_dut]   [generic GC_TESTCASE spi_master_vvc_to_slave_dut]
simulate  spi_vvc_tb  [TestName spi_slave_dut_to_master_vvc]   [generic GC_TESTCASE spi_slave_dut_to_master_vvc]
simulate  spi_vvc_tb  [TestName scoreboard_test]               [generic GC_TESTCASE scoreboard_test]
simulate  spi_vvc_tb  [TestName test_unwanted_activity]        [generic GC_TESTCASE test_unwanted_activity]
