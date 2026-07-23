# UVVM
## Abstract
UVVM (Universal VHDL Verification Methodology) is a free and Open Source Methodology and Library for making very structured VHDL-based testbenches.

## About this Branch
This branch allows you to run UVVM using OSVVM pro scripts.

This branch is part of a larger effort that intends to be able to use UVVM and OSVVM together.

By providing a way to run pro scripts within a UVVM environment, we are able to compare the testbench output of a pure UVVM environment with the output of the combined environment - just by compiling different branches of UVVM.

### What was changed
	 * Added build.pro to script and each component script directory to analyze the libraries
	 * Added run.pro to script and each component script directory to run simulations

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
