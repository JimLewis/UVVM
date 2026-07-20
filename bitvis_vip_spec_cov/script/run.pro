puts ""
puts ""
puts ""
puts "Add Test cases for bitvis_vip_spec_cov"
puts ""
puts ""
puts ""
# run.pro
# include ../../script/sim_init.pro
# BuildName regression_bitvis_vip_spec_cov
#
# TestSuite bitvis_vip_spec_cov
# ChangeWorkingDirectory ../tb/maintenance_tb
#
# library  tb_bitvis_vip_spec_cov
# analyze  spec_cov_tb.vhd
# simulate spec_cov_tb  [TestName test_init_with_no_requirement_file] [generic GC_TESTCASE test_init_with_no_requirement_file]
# simulate spec_cov_tb  [TestName general_tests]                      [generic GC_TESTCASE general_tests]
# simulate spec_cov_tb  [TestName test_uvvm_status_error_before_log]  [generic GC_TESTCASE test_uvvm_status_error_before_log]
# simulate spec_cov_tb  [TestName test_uvvm_status_error_after_log]   [generic GC_TESTCASE test_uvvm_status_error_after_log]
# simulate spec_cov_tb  [TestName test_open_no_existing_req_file]     [generic GC_TESTCASE test_open_no_existing_req_file]
# simulate spec_cov_tb  [TestName test_list_single_tick_off]          [generic GC_TESTCASE test_list_single_tick_off]
# simulate spec_cov_tb  [TestName test_cond_tick_off]                 [generic GC_TESTCASE test_cond_tick_off]
# simulate spec_cov_tb  [TestName test_open_empty_requirement_file]   [generic GC_TESTCASE test_open_empty_requirement_file]
# simulate spec_cov_tb  [TestName test_no_existing_partial_cov_dir]   [generic GC_TESTCASE test_no_existing_partial_cov_dir]
# simulate spec_cov_tb  [TestName test_mix_listed_input_reqs]         [generic GC_TESTCASE test_mix_listed_input_reqs]
