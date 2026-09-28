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
BuildName regression_bitvis_vip_rgmii

TestSuite bitvis_vip_rgmii
ChangeWorkingDirectory ../tb/maintenance_tb

library  tb_bitvis_vip_rgmii
analyze  rgmii_th.vhd
analyze  rgmii_bfm_tb.vhd
simulate  rgmii_bfm_tb [TestName test_rgmii_double_data_rate] [generic GC_TESTCASE test_rgmii_double_data_rate]
simulate  rgmii_bfm_tb [TestName test_rgmii_single_data_rate] [generic GC_TESTCASE test_rgmii_single_data_rate]
RunTest  rgmii_vvc_tb.vhd
