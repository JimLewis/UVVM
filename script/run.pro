# run.pro for UVVM
include sim_init.pro

foreach item [ReadListFromFile component_list.txt] {
  if {$item ne ""} {
    include ../${item}/script/run

    if {![catch {glob *_Alert.txt}]} {
      EndSimulation ;# close VHDL files if not already closed
      # Move UVVM results files to OSVVM ResultsDirectory
      CreateDirectory ${::osvvm::ResultsDirectory}
      foreach ResultsFile [glob *_Alert.txt] {
        file copy $ResultsFile ${::osvvm::ResultsDirectory}/${item}/${ResultsFile}
        catch [file delete -force $ResultsFile]
      }
      foreach ResultsFile [glob *_Log.txt] {
        file copy $ResultsFile ${::osvvm::ResultsDirectory}/${item}/${ResultsFile}
        catch [file delete -force $ResultsFile]
      }
    }
  }
}
