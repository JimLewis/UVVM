# UVVM
## Abstract
UVVM (Universal VHDL Verification Methodology) is a free and Open Source Methodology and Library for making very structured VHDL-based testbenches.

## About this Branch
This branch allows you to run UVVM using OSVVM pro scripts.

This branch is part of a larger effort that intends to be able to run UVVM and OSVVM together.

By providing a way to run pro scripts within a UVVM environment, we are able to compare the testbench output of a pure UVVM environment with the output of the combined environment - just by compiling different branches of UVVM.


## Full Documentation
UVVM consists currently of the following elements:

* [Utility Library](https://uvvm.github.io/utility_library.html)
* [VVC (VHDL Verification Component) Framework](https://uvvm.github.io/vvc_framework.html) - Including Utility Library
* BFMs (Bus Functional Models) to be used with any part of UVVM
* VVCs to be used with UVVM VVC Framework and may be combined with BFMs (See [Available VVCs and BFMs](https://uvvm.github.io/tool_compatibility.html#uvvm-vvcs-and-bfms))

For information on how to get started, see [Getting Started](https://uvvm.github.io/uvvm_getting_started.html).

For frequently asked questions, see [FAQ](https://uvvm.github.io/faq.html).

The complete UVVM documentation can be found on https://uvvm.github.io.
