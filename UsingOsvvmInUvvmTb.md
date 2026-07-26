# How to use OSVVM in a UVVM test case
Most of the features here require the UseOsvvmAlertLogInUvvm branch.  Only the first step is also supported by the RunWithOsvvmPro branch.

## Building UVVM and UVVM tests with OSVVM *.pro files
After starting OSVVM scripting at the tcl shell do the following:
```
   build <PathToUvvm>/script/build.pro  ;# analyze the uvvm libraries
   build <PathToUvvm>/script/run.pro     ;# simulate all of the uvvm test cases
```

This capaility is available in either the UseOsvvmAlertLogInUvvm or the RunWithOsvvmPro branch.
The remaining capabilities require the UseOsvvmAlertLogInUvvm branch.

## OSVVM Reports indicate NAMEMISMATCH
One of the advantages of using OSVVM is the build summary reports.
With the UseOsvvmAlertLogInUvvm branch, OSVVM tries to report the state of your test, however, with a basic UVVM test case, the test case will fail due to NAMEMISMATCH.

NAME_MISMATCH indicates the VHDL test case name does not match the script test case name.

## Fixing NAMEMISMATCH by Hacking the Scripts
Set the following TCL variable to disable the NAME_MISMATCH error.
```
set $::osvvm::FailOnVhdlNameNotMatchTestName "false"
```

## Fixing NAMEMISMATCH by Adding OSVVM Code (recommended)
Before the entity declaration add a library and context reference for OSVVM. This is shown below
```
library osvvm ;
```

At the start of the test case, add SetTestName and in your scripts add a call to TestName (*.pro procedure).
```
    -- Start of Test Case
    osvvm.AlertLogPkg.SetTestName("Test1") ;             -- Test Name matches entity name
--    osvvm.AlertLogPkg.SetTestName(GC_TESTCASE ) ;      -- Test Name matches generic
```

If your UVVM test case finishes with one of the following, you are done.  If not, see the section titled "Checking the Transcript File" to see the additional OSVVM steps that replace these.
```
    -- One possible UVVM test completion
    await_uvvm_completion(1000 ns,
        print_alert_counters => REPORT_ALERT_COUNTERS_FINAL,
        scope                => C_SCOPE);
    -- Another possible UVVM test completion
    report_alert_counters(FINAL);
```

If the TestName matches the entity name, there is nothing else to do.  If not, you need to set the test name in pro by doing:
```
TestName Test1
```

This can be done in the call to RunTest by doing.
```
RunTest Test1_name.vhd [TestName Test1]
```

## Using the OSVVM Context
Generally it is not recommended to use selected names (such as osvvm.AlertLogPkg.SetTestName("ABC")).  Instead use a package use clause or a context (preferred and shown below).
```
library osvvm ;
context OSVVM.OsvvmContext ;
```

The problem with using selecte names is if the contents of a package are refactored (moved to another package), then the selected name must change.

The problem with using both the context of OSVVM and UVVM is ambiguity.

## Unfortunately there is Ambiguity
if you include both the OSVVM and UVVM context declarations there is a minor amount of ambiguity with calls to log("A Message").

If you are using UVVM logs, add the msg_id NO_ID to the call:
```
-- log("A Message") ;      -- Ambiguous call
log(NO_ID, "A Message") ;  -- Updated call
```

For OSVVM, you can follow the UVVM pattern in use  you are using OSVVM logs, use the default log of OSVVM
```
-- log("A Message") ;                    -- Ambiguous call
log(ALERTLOG_DEFAULT_ID, "A Message") ;  -- Updated call
```

Instead of using the default ID, with OSVVM it is recommended that you create your own ID using NewID.  This allows you to give each different context in your test case its own ID.   OSVVM VC do this for you.
```
TbID := NewID("TbID") ;
log(TbID, "A Message") ;
```

Currently this is the only known ambiguity between OSVVM and UVVM.

## Transcript files the OSVVM Way
OSVVM only uses one transcript file for both alerts and logs.  If you opened two using UVVM, then the last one opened becomes the OSVVM TranscriptFile (and the first one is ignored).   Instead, comment both of these out:
Comment out the uvvm calls to std_log_file_name and set_alert_file_name - that are used at the beginning of a UVVM test case.  OSVVM only supports a single transcript file, where UVVM splits them into separate files.
```
    --O set_log_file_name(GC_TESTCASE & "_Log.txt");
    --O set_alert_file_name(GC_TESTCASE & "_Alert.txt");
```

Open a transcript file with osvvm using TranscriptOpen.
```
TranscriptOpen("TranscriptFileName.log") ;
```

There is a short-cut.  If you call SetTestName first (recommended), then TranscriptOpen can be called without a parameter, and the transcript file will be named <TestName>.log.
```
    -- Start of Test Case
    osvvm.AlertLogPkg.SetTestName("Test1") ;
    TranscriptOpen ;  -- opens "Test1.log"
```

## Console and Log
When the transcript file is opened, OSVVM logs to just the transcript file.   This is a good setting for regressions.

For debugging, it is useful to also output to the console.  To do this, set transcript mirroring by doing the following after opening the transript.
```
    -- Start of Test Case
    osvvm.AlertLogPkg.SetTestName("Test1") ;
    TranscriptOpen ;
    SetTranscriptMirror ;
```

## Where is the transcript file?
The transcrpt starts in the current simulation directory and
when the simulation finishes the OSVVM scripts move it to
the directory <OutputBaseDirector>/<BuildName>/<TestSuiteName>.
OutputBaseDirector is determined by OSVVM tcl settings and
by default is the current simulation directory.
BuildName defaults to <ScriptDirectory_ScriptName>.
The default ensures that if the same script name is used in more
than one directory the name of the build is unique.
The BuildName can also be set.
TestSuite name is set by the OSVVM Pro procedure TestSuite.
It is a name given to a group of tests to indicate purpose and
differentiate them from another group of tests.

In the UVVM directory hierarchy, OSVVM scripts are in a directory
named script - this is done since all other scripts are also there.
Currently this does not work well with the OSVVM default build naming scheme.
With the UVVM naming methodology, it is recommended to explicitly name the builds
by using BuildName as follows:

```
build <PathToUvvm>/script/run.pro [BuildName uvvm_regression_all]
```

## Checking the Transcript File
Some test cases have a considerable amount of text output that needs to be checked.
OSVVM checks this by capturing the transcript in a single file and then checks that file against a previously checked.


################################################################################
################################################################################
################################################################################
### RESUME EDITING HERE
################################################################################
################################################################################
################################################################################
```
-- Required by OSVVM
library osvvm ;
context OSVVM.OsvvmContext ;
use std.env.all ;
-- End of Required by OSVVM

  -- Required by OSVVM
  constant C_TESTCASE_FILE_PATH : string  := FILE_PATH ;
  -- End of Required by OSVVM

    -- OSVVM Start of Test Case
    SetTestName("avalon_st_bfm_tb") ;
--    SetTestName(GC_TESTCASE ) ;
    TranscriptOpen ;
    SetTranscriptMirror ;
    -- End of OSVVM Start of Test Case

    --O set_log_file_name(GC_TESTCASE & "_Log.txt");
    --O set_alert_file_name(GC_TESTCASE & "_Alert.txt");

    -- OSVVM Test Completion Steps
    TranscriptClose ;
    if C_TESTCASE_FILE_PATH'length > 0 then
      AffirmIfTranscriptsMatch(RemoveEndingSeparator(ChangeSeparator(C_TESTCASE_FILE_PATH)) & "/OsvvmResults") ;
    end if ;
    EndOfTestReports ;
    -- End of Test OSVVM Completion Steps
```

At the end of the test case, just before the end of the test case (before the call to std.env.stop).
```
    TranscriptClose ;
    EndOfTestReports ;
```

If you UVVM test case ended with either of the following,
```
    await_uvvm_completion(1000 ns,
        print_alert_counters => REPORT_ALERT_COUNTERS_FINAL,
        scope                => C_SCOPE);

One of the advantages of using OSVVM is the build summary reports.
With the UseOsvvmAlertLogInUvvm branch, OSVVM tries to report the state of your test, however, with a basic UVVM test case, the test case will fail due to NAMEMISMATCH.

NAME_MISMATCH indicates the VHDL test case name does not match the script test case name.

Without changing the VHDL code, you can set the following TCL variable to disable this check.
```
set $::osvvm::FailOnVhdlNameNotMatchTestName "false"
```

## Getting OSVVM Reports - Hacking the Scripts

At this point if your test did any checking - using one of the UVVM check_* subprograms, the test case will indicate PASSED if they all passed.   If any failed the test case will FAIL.

If your test case did not do any checking, then it will fail with NOCHECKS - which is appropriate since your test case did not do any checking.

If you are expecting an exact text output from your test case, with OSVVM you can add this form of self-checking to your test cases.

## Getting OSVVM Reports

OSVVM generates
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
