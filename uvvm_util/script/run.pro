#================================================================================================================================
# Copyright 2026  SynthWorks Design Inc
# Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.
# You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0 and in the provided file LICENSE.
#
# Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on
# an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and limitations under the License.
#================================================================================================================================
# run.pro for UVVM_util
include ../../script/sim_init.pro

BuildName regression_uvvm_util

TestSuite uvvm_util
ChangeWorkingDirectory ../tb/maintenance_tb

library tb_uvvm_util
analyze methods_tb_ent.vhd

# log_arch
analyze methods_tb_log_arch.vhd
simulate methods_tb [TestName basic_log_alert]         [generic GC_TESTCASE basic_log_alert]
simulate methods_tb [TestName enable_disable_log_msg]  [generic GC_TESTCASE enable_disable_log_msg]
simulate methods_tb [TestName log_text_block]          [generic GC_TESTCASE log_text_block]
file copy -force primary.txt     ${::osvvm::ResultsDirectory}/uvvm_util/primary.txt
file copy -force secondary.txt   ${::osvvm::ResultsDirectory}/uvvm_util/secondary.txt
simulate methods_tb [TestName log_to_file]             [generic GC_TESTCASE log_to_file]
simulate methods_tb [TestName log_header_formatting]   [generic GC_TESTCASE log_header_formatting]

# alert_arch
analyze methods_tb_alert_arch.vhd
simulate methods_tb [TestName alert_summary_report]         [generic GC_TESTCASE alert_summary_report]
simulate methods_tb [TestName ignored_alerts]               [generic GC_TESTCASE ignored_alerts]
simulate methods_tb [TestName hierarchical_alerts_report]   [generic GC_TESTCASE hierarchical_alerts_report]
simulate methods_tb [TestName hierarchical_alerts]          [generic GC_TESTCASE hierarchical_alerts]

# check_arch
analyze  methods_tb_check_arch.vhd
simulate methods_tb [TestName check_value]                         [generic GC_TESTCASE check_value]
simulate methods_tb [TestName check_value_default_alert]           [generic GC_TESTCASE check_value_default_alert]
simulate methods_tb [TestName check_stable]                        [generic GC_TESTCASE check_stable]
simulate methods_tb [TestName check_stable_default_alert]          [generic GC_TESTCASE check_stable_default_alert]
simulate methods_tb [TestName check_value_in_range]                [generic GC_TESTCASE check_value_in_range]
simulate methods_tb [TestName check_value_in_range_default_alert]  [generic GC_TESTCASE check_value_in_range_default_alert]
simulate methods_tb [TestName check_sb_completion]                 [generic GC_TESTCASE check_sb_completion]

# clock
analyze methods_tb_clock_arch.vhd
simulate methods_tb [TestName clock_generators] [generic GC_TESTCASE clock_generators]

# common
analyze methods_tb_common_arch.vhd
simulate methods_tb [TestName random_functions]     [generic GC_TESTCASE random_functions]
simulate methods_tb [TestName normalise]            [generic GC_TESTCASE normalise]
simulate methods_tb [TestName normalize_and_check]  [generic GC_TESTCASE normalize_and_check]
# not for OSVVM.  simulate methods_tb [TestName setting_output_file_name]  [generic GC_TESTCASE setting_output_file_name]
simulate methods_tb [TestName string_methods]       [generic GC_TESTCASE string_methods]
simulate methods_tb [TestName byte_and_slv_arrays]  [generic GC_TESTCASE byte_and_slv_arrays]

# await
analyze methods_tb_await_arch.vhd
simulate methods_tb [TestName await_stable]                [generic GC_TESTCASE await_stable]
simulate methods_tb [TestName await_stable_default_alert]  [generic GC_TESTCASE await_stable_default_alert]
simulate methods_tb [TestName await_value]                 [generic GC_TESTCASE await_value]
simulate methods_tb [TestName await_value_default_alert]   [generic GC_TESTCASE await_value_default_alert]
simulate methods_tb [TestName await_change_to_value]       [generic GC_TESTCASE await_change_to_value]
simulate methods_tb [TestName await_sb_completion]         [generic GC_TESTCASE await_sb_completion]

# Sync
analyze methods_tb_sync_arch.vhd
simulate methods_tb             [TestName synchronization_methods]   [generic GC_TESTCASE synchronization_methods]

# Watchdog
analyze methods_tb_watchdog_arch.vhd
simulate methods_tb             [TestName watchdog_timer]            [generic GC_TESTCASE watchdog_timer]

# association_list
RunTest association_list_tb.vhd [TestName association_list]          [generic GC_TESTCASE association_list]

# func_cov
analyze func_cov_tb.vhd
simulate func_cov_tb [TestName fc_bins]         [generic GC_TESTCASE fc_bins]
simulate func_cov_tb [TestName fc_cross_bin]    [generic GC_TESTCASE fc_cross_bin]
simulate func_cov_tb [TestName fc_cross_covpt]  [generic GC_TESTCASE fc_cross_covpt]
simulate func_cov_tb [TestName fc_rand_bin]     [generic GC_TESTCASE fc_rand_bin]
simulate func_cov_tb [TestName fc_rand_cross]   [generic GC_TESTCASE fc_rand_cross]
simulate func_cov_tb [TestName fc_database]     [generic GC_TESTCASE fc_database]
simulate func_cov_tb [TestName fc_database_2]   [generic GC_TESTCASE fc_database_2]
simulate func_cov_tb [TestName fc_database_3]   [generic GC_TESTCASE fc_database_3]
simulate func_cov_tb [TestName fc_reports]      [generic GC_TESTCASE fc_reports]
simulate func_cov_tb [TestName fc_coverage]     [generic GC_TESTCASE fc_coverage]
simulate func_cov_tb [TestName fc_init_delete]  [generic GC_TESTCASE fc_init_delete]

# generic queue tests
RunTest generic_queue_array_tb.vhd  [TestName generic_queue_array]  [generic GC_TESTCASE generic_queue_array]
RunTest generic_queue_record_tb.vhd [TestName generic_queue_record] [generic GC_TESTCASE generic_queue_record]
RunTest generic_queue_tb.vhd        [TestName generic_queue]        [generic GC_TESTCASE generic_queue]

analyze rand_tb_pkg.vhd

# RunTest questa_extension_tb.vhd  ; # only runs in QuestaOne

# rand multi
analyze rand_multi_method_tb.vhd
simulate rand_multi_method_tb [TestName rand_basic_multi]     [generic GC_TESTCASE rand_basic]
simulate rand_multi_method_tb [TestName rand_weighted_multi]  [generic GC_TESTCASE rand_weighted]
simulate rand_multi_method_tb [TestName rand_cyclic_multi]    [generic GC_TESTCASE rand_cyclic]
simulate rand_multi_method_tb [TestName rand_report_multi]    [generic GC_TESTCASE rand_report]
simulate rand_multi_method_tb [TestName rand_gaussian_multi]  [generic GC_TESTCASE rand_gaussian]

analyze rand_tb.vhd
simulate rand_tb [TestName rand_basic]               [generic GC_TESTCASE rand_basic]
simulate rand_tb [TestName rand_weighted]            [generic GC_TESTCASE rand_weighted]
simulate rand_tb [TestName rand_cyclic]              [generic GC_TESTCASE rand_cyclic]
if {$::osvvm::ToolName ne "NVC"} {
  simulate rand_tb [TestName rand_cyclic_performance]  [generic GC_TESTCASE rand_cyclic_performance]
}
simulate rand_tb [TestName rand_report]              [generic GC_TESTCASE rand_report]
simulate rand_tb [TestName rand_gaussian]            [generic GC_TESTCASE rand_gaussian]

RunTest simplified_data_queue_tb.vhd [TestName simplified_data_queue]  [generic GC_TESTCASE simplified_data_queue]

RunTest ../cr_fc_demo_tb.vhd