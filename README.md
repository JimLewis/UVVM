# UVVM that uses OSVVM's AlertLog Capability
## Abstract
This is a branch/derivative of Universal VHDL Verification Methodology (UVVM) that supports the usage of Open Source VHDL Verification Methodology (OSVVM) and UVVM together.

## About this Branch:  UseOsvvmAlertLogInUvvm
This branch allows you to run UVVM within an OSVVM environment.

What do you gain by using OSVVM
  * OSVVM test reports
  * OSVVM's singleton data structures
  * OSVVM's simplified scripting which is simulator independent

What is the use Model
  * Run older UVVM test cases in an OSVVM environment to get better reporting*
  * Run mixed UVVM and OSVVM VC with either UVVM or OSVVM testbenches
  * Transition from UVVM (which uses deprecated VHDL features) to OSVVM (which is fully VHDL compliant)

### Changes from branch RunWithOsvvmPro
This branch incorporates the changes made in the branch RunWithOsvvmPro.  Specifically,
	 * Added build.pro to script and each component script directory to analyze the libraries
	 * Added run.pro to script and each component script directory to run simulations

### Changes added in this branch: RunWithOsvvmPro
This update replaces UVVM's alert and log capability with that of OSVVM.

The following files in uvvm_util src were updated.
   * Adaptations_pkg.vhd
   * hierarchy_linked_list_pkg.vhd
   * string_methods_pkg.vhd
   * methods_pkg.vhd

All testbench/test case files have OSVVM additions.

In general OSVVM changes are commented with "--O"

### How to use these
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
