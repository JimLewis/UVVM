# run_one.pro for UVVM_util
include ../../script/sim_init.pro

BuildName regression_uvvm_util_partial

library tb_uvvm_util
ChangeWorkingDirectory ../tb/maintenance_tb

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