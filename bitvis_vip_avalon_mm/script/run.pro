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
BuildName regression_bitvis_vip_avalon_mm

TestSuite bitvis_vip_avalon_mm
ChangeWorkingDirectory ../tb/maintenance_tb

library  tb_bitvis_vip_avalon_mm
analyze  avalon_mm_vvc_th.vhd

RunTest  avalon_mm_bfm_tb.vhd
RunTest  avalon_mm_bfm_spi_tb.vhd
RunTest  avalon_mm_vvc_tb.vhd
RunTest  avalon_mm_vvc_pipeline_tb.vhd
