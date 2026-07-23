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
BuildName regression_bitvis_uart

TestSuite bitvis_uart
ChangeWorkingDirectory ../tb/maintenance_tb

library tb_bitvis_uart
analyze  ../uart_vvc_demo_th.vhd  ;# required for uart_vvc_tb
RunTest  ../uart_vvc_demo_tb.vhd

RunTest  uart_bfm_tb.vhd
RunTest  uart_vvc_tb.vhd  ;# uses uart_vvc_demo_th

