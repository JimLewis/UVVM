# What if UVVM and OSVVM could work together?
## Abstract
This branch is a derivative of the main branch of Universal VHDL Verification Methodology (UVVM).  It is special in that it supports the usage of Open Source VHDL Verification Methodology (OSVVM) and UVVM together.

## About this Branch:  UseOsvvmAlertLogInUvvm
This branch edits UVVM's alert and log capability to use OSVVM's capability.  Doing this allows you to:
  * Run UVVM test cases in an OSVVM environment to get better reporting (minimal modifications recommended)
  * Run UVVM VVC and OSVVM VC together in a testbench
  * Select the best features from OSVVM and UVVM and use them together
  * Transition from UVVM (which uses deprecated VHDL features) to OSVVM (which is fully VHDL compliant)

What do you gain by using OSVVM
  * OSVVM test reports
  * OSVVM's singleton data structures
  * OSVVM's simplified scripting which is simulator independent

## Changes from branch RunWithOsvvmPro
This branch incorporates the changes made in the branch RunWithOsvvmPro.  Specifically,
	 * Added build.pro to script and each component script directory to analyze the libraries
	 * Added run.pro to script and each component script directory to run simulations

## Changes added in this branch: RunWithOsvvmPro
This update replaces UVVM's alert and log capability with that of OSVVM.

The following files in uvvm_util src were updated.
   * Adaptations_pkg.vhd  (very little)
   * hierarchy_linked_list_pkg.vhd  (very little)
   * string_methods_pkg.vhd (some)
   * methods_pkg.vhd (significant)

All testbench/test case files have OSVVM additions.

In general OSVVM changes are commented with either "--O" or "OSVVM"

## How to build this library and run its test cases
After starting OSVVM scripting at the tcl shell do the following:
```
   build <PathToUvvm>/script/build.pro  ;# analyze the uvvm libraries
   build <PathToUvvm>/script/run.pro     ;# simulate all of the uvvm test cases
```

## Documentation
* [OSVVM Documentation](https://osvvm.github.io/)
* [UVVM Documentation](https://uvvm.github.io)

## Copyrights
Copyright 2016 to 2026 UVVM

Copyright 2026 SynthWorks Design Inc

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.
You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0 and in the provided file LICENSE.

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on
an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and limitations under the License.

## Modifications
July 2026 - Updated README.md to reflect the purpose of this branch
