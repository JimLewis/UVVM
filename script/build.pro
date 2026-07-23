# build.pro for UVVM
include sim_init.pro

BuildName uvvm_build

foreach item [ReadListFromFile component_list.txt] {
  if {$item ne ""} {
    include ../${item}/script
  }
}
