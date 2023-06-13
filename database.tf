resource "fly_app" "databaseApp" {
  name = "kandyba-mysql"
  org  = "personal"
}

resource "fly_volume" "databaseVolume" {
  name       = "kandyba_mysql_volume"
  app        = "kandyba-mysql"
  size       = 1
  region     = var.fly_region
  depends_on = [fly_app.databaseApp]
}

resource "null_resource" "unmount_db_volume_in_bg" {
  depends_on = [fly_volume.databaseVolume]

  provisioner "local-exec" {
    when    = destroy
    command = "sleep 60"
  }
}

resource "fly_machine" "db" {
  app        = "kandyba-mysql"
  region     = var.fly_region
  name       = "kandyba-mysql-machine"
  image      = "mysql:5.7.28"
  cpus       = 1
  memorymb   = 256
  depends_on = [null_resource.unmount_db_volume_in_bg]
  mounts = [
    {
      path   = "/data"
      volume = fly_volume.databaseVolume.id
    }
  ]
  env = {
    MYSQL_DATABASE      = "some_db"
    MYSQL_USER          = "admin"
    MYSQL_PASSWORD      = "notasecurepassword"
    MYSQL_ROOT_PASSWORD = "thesame"
  }
  cmd = ["--datadir /data/mysql"]
}
