# run.pro for UVVM_util
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
