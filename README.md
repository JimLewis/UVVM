# UVVM
## Abstract
UVVM (Universal VHDL Verification Methodology) is a free and Open Source Methodology and Library for making very structured VHDL-based testbenches.

## About this Branch
This branch allows you to run UVVM using within an OSVVM environment using OSVVM's AlertLogPkg.

What do you gain by using OSVVM
* OSVVM test reports
* OSVVM's singleton data structures
* OSVVM's simplified scripting which is simulator independent

What is the use Model
* Run older UVVM test cases in an OSVVM environment to get better reporting* 
* Run mixed UVVM and OSVVM testbenches
* Transition from UVVM (which uses deprecated VHDL features) to OSVVM (which is fully VHDl compliant)

Note that to get OSVVM reporting, small additions need to be added to UVVM testbenches.

This branch is part of a larger effort that intends to be able to run UVVM and OSVVM together.

By providing a way to run pro scripts within a UVVM environment, we are able to compare the testbench output of a pure UVVM environment with the output of the combined environment - just by compiling different branches of UVVM.

To do this, the low level OSVVM AlertLog capability is used in place of UVVM reporting (log and alert).   UVVM alerts are replaced with OSVVM alerts and affirmations since they are an essential part of OSVVM's reporting.  UVVM logs are replaced with printing that is consistent with OSVVM alerts.   At the same time, the UVVM style headers are preserved.

Once you have done that, you can freely mix UVVM (and in particular UVVM VC) with OSVVM.

## Full Documentation
UVVM consists currently of the following elements:

* [Utility Library](https://uvvm.github.io/utility_library.html)
* [VVC (VHDL Verification Component) Framework](https://uvvm.github.io/vvc_framework.html) - Including Utility Library
* BFMs (Bus Functional Models) to be used with any part of UVVM
* VVCs to be used with UVVM VVC Framework and may be combined with BFMs (See [Available VVCs and BFMs](https://uvvm.github.io/tool_compatibility.html#uvvm-vvcs-and-bfms))

For information on how to get started, see [Getting Started](https://uvvm.github.io/uvvm_getting_started.html).

For frequently asked questions, see [FAQ](https://uvvm.github.io/faq.html).

The complete UVVM documentation can be found on https://uvvm.github.io.
