# run.pro for UVVM
include sim_init.pro

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
