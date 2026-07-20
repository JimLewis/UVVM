# run.pro for UVVM
include sim_init.pro

foreach item [ReadListFromFile component_list.txt] {
  if {$item ne ""} {
    include ../${item}/script/run
  }
}
