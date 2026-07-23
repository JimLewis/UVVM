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

TestSuite uvvm_util
ChangeWorkingDirectory ../tb/maintenance_tb

library tb_uvvm_util
analyze methods_tb_ent.vhd

# check_arch
analyze  methods_tb_check_arch.vhd
simulate methods_tb [TestName check_value]                         [generic GC_TESTCASE check_value]
simulate methods_tb [TestName check_value_default_alert]           [generic GC_TESTCASE check_value_default_alert]
simulate methods_tb [TestName check_stable]                        [generic GC_TESTCASE check_stable]
simulate methods_tb [TestName check_stable_default_alert]          [generic GC_TESTCASE check_stable_default_alert]
simulate methods_tb [TestName check_value_in_range]                [generic GC_TESTCASE check_value_in_range]
simulate methods_tb [TestName check_value_in_range_default_alert]  [generic GC_TESTCASE check_value_in_range_default_alert]
simulate methods_tb [TestName check_sb_completion]                 [generic GC_TESTCASE check_sb_completion]
