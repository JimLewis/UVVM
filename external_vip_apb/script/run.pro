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
BuildName regression_external_vip_apb

TestSuite external_vip_apb
ChangeWorkingDirectory ../tb/maintenance_tb

library  tb_external_vip_apb
analyze  apb_register.vhd
RunTest  apb_bfm_tb.vhd
RunTest  apb_vvc_tb.vhd
