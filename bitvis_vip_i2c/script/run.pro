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

RunTest  i2c_vvc_tb.vhd
