#================================================================================================================================
# Copyright 2026  SynthWorks Design Inc
# Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.
# You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0 and in the provided file LICENSE.
#
# Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on
# an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and limitations under the License.
#================================================================================================================================
# run_one.pro - temporary standin for run.pro
include ../../script/sim_init.pro

BuildName regression_uvvm_util

ChangeWorkingDirectory ../tb/maintenance_tb

library tb_uvvm_util
analyze methods_tb_ent.vhd

# log_arch
TestSuite uvvm_util.clock_arch
analyze methods_tb_clock_arch.vhd
simulate methods_tb [TestName clock_generators] [generic GC_TESTCASE clock_generators]
puts "Status is $::osvvm::TestCaseStatus"
KnownStatus ANY "This test case is unstable and may pass or fail due to different ordering of outputs in transcript file"
