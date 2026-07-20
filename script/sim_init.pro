# build.pro for UVVM
if {$::osvvm::ToolVendor eq "NVC"} {
  SetExtendedAnalyzeOptions "--relaxed"
}
if {$::osvvm::ToolVendor eq "GHDL"} {
  SetExtendedAnalyzeOptions   "-frelaxed -Wno-shared"
  SetExtendedElaborateOptions "-frelaxed -Wno-shared"
}
