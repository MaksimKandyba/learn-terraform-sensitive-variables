output "cpus" {
  value = fly_machine.web.cpus
}

output "cputype" {
  value = fly_machine.web.cputype
}

output "memorymb" {
  value = fly_machine.web.memorymb
}

output "volume_size_gb" {
  value = fly_volume.exampleVolume.size
}
