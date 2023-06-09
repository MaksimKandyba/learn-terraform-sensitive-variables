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

output "db_cpus" {
  value = fly_machine.db.cpus
}

output "db_cputype" {
  value = fly_machine.db.cputype
}

output "db_memorymb" {
  value = fly_machine.db.memorymb
}

output "db_volume_size_gb" {
  value = fly_volume.databaseVolume.size
}
