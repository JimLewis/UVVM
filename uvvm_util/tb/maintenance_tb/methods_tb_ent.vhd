--================================================================================================================================
-- Copyright 2024 UVVM
-- Copyright 2026 SynthWorks Design Inc
-- Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0 and in the provided LICENSE.TXT.
--
-- Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on
-- an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and limitations under the License.
--================================================================================================================================
-- Note : Any functionality not explicitly described in the documentation is subject to change at any time
----------------------------------------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------
-- Description : See library quick reference (under 'doc') and README-file(s)
------------------------------------------------------------------------------------------
-- Modifications:
--   July 2026  done by SynthWorks
--       This file is modified from the UVVM Master branch
--       Minor modifications were done to add
--       * OSVVM library and context
--       * Constant C_TESTCASE_FILE_PATH
--       * Calls to SetTestName, TranscriptOpen, and SetTranscriptMirror
--       * Calls to OSVVM TranscriptClose, AffirmIfTranscriptsMatch, and EndOfTestReports
--       UVVM calls to report_alert_counters were changed to INTERMEDIATE (directly or indirectly)
--       Generally comments associated with these code modifications reference OSVVM or "--O"
------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library std;
use std.textio.all;

library uvvm_util;
context uvvm_util.uvvm_util_context;

library osvvm ;
use OSVVM.FileLinePathPkg.FILE_PATH ;
use std.env.all ;

--HDLRegression:TB
entity methods_tb is
  generic(
    GC_TESTCASE : string := "UVVM"
  );

  constant RawTestFilePath : string  := FILE_PATH ;
  constant TestFilePath    : string  := OSVVM.FileUtilPkg.RemoveEndingSeparator(OSVVM.FileUtilPkg.ChangeSeparator(RawTestFilePath)) ;
  constant CheckResults    : boolean := RawTestFilePath'length > 0 ;
end entity;
