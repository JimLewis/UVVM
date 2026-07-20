# run.pro for uvvm_assertions
include ../../script/sim_init.pro
BuildName regression_uvvm_assertions

TestSuite uvvm_assertions
ChangeWorkingDirectory ../tb/maintenance_tb

library tb_uvvm_assertions
analyze  uvvm_assertions_tb.vhd
simulate uvvm_assertions_tb [TestName "assert_value" ]                                                  [generic GC_TESTCASE "assert_value" ]
simulate uvvm_assertions_tb [TestName "assert_one_of" ]                                                 [generic GC_TESTCASE "assert_one_of" ]
simulate uvvm_assertions_tb [TestName "assert_one_hot" ]                                                [generic GC_TESTCASE "assert_one_hot" ]
simulate uvvm_assertions_tb [TestName "assert_value_in_range" ]                                         [generic GC_TESTCASE "assert_value_in_range" ]
simulate uvvm_assertions_tb [TestName "assert_shift_one_from_left" ]                                    [generic GC_TESTCASE "assert_shift_one_from_left" ]
simulate uvvm_assertions_tb [TestName "assert_value_from_min_to_max_cycles_after_trigger" ]             [generic GC_TESTCASE "assert_value_from_min_to_max_cycles_after_trigger" ]
simulate uvvm_assertions_tb [TestName "assert_change_to_value_from_min_to_max_cycles_after_trigger" ]   [generic GC_TESTCASE "assert_change_to_value_from_min_to_max_cycles_after_trigger" ]
simulate uvvm_assertions_tb [TestName "assert_change_from_min_to_max_cycles_after_trigger" ]            [generic GC_TESTCASE "assert_change_from_min_to_max_cycles_after_trigger" ]
simulate uvvm_assertions_tb [TestName "assert_stable_from_min_to_max_cycles_after_trigger" ]            [generic GC_TESTCASE "assert_stable_from_min_to_max_cycles_after_trigger" ]
simulate uvvm_assertions_tb [TestName "assert_value_from_start_to_end_trigger" ]                        [generic GC_TESTCASE "assert_value_from_start_to_end_trigger" ]
simulate uvvm_assertions_tb [TestName "assert_change_to_value_from_start_to_end_trigger" ]              [generic GC_TESTCASE "assert_change_to_value_from_start_to_end_trigger" ]
simulate uvvm_assertions_tb [TestName "assert_change_from_start_to_end_trigger" ]                       [generic GC_TESTCASE "assert_change_from_start_to_end_trigger" ]
simulate uvvm_assertions_tb [TestName "assert_stable_from_start_to_end_trigger" ]                       [generic GC_TESTCASE "assert_stable_from_start_to_end_trigger" ]
