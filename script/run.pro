#================================================================================================================================
# Copyright 2026  SynthWorks Design Inc
# Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.
# You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0 and in the provided file LICENSE.
#
# Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on
# an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and limitations under the License.
#================================================================================================================================
# run.pro for UVVM
include sim_init.pro

# Testbenches are not updated, so do not expect the VHDL TestName to match the Script TestName
set $::osvvm::FailOnVhdlNameNotMatchTestName "false"
# FailOnVhdlNameNotMatchTestName is recommended when running a UVVM test case with the library updated in UseOsvvmAlertLogInUvvm
# emulated this capability here by
#     1. Checking out repository branch UseOsvvmAlertLogInUvvm and doing a build of UVVM library
#     2. Check out repository branch RunWithOsvvmPro and simulating using the unmodified UVVM testbenches

foreach item [ReadListFromFile component_list.txt] {
  if {$item ne ""} {
    include ../${item}/script/run

    if {![catch {glob *.txt}]} {
      EndSimulation ;# close VHDL files if not already closed
      # Move UVVM results files to OSVVM ResultsDirectory
      CreateDirectory ${::osvvm::ResultsDirectory}
      foreach ResultsFile [glob *.txt] {
        catch {file copy $ResultsFile ${::osvvm::ResultsDirectory}/${item}/${ResultsFile}}
        catch {file delete -force $ResultsFile}
      }
    }
  }
}
