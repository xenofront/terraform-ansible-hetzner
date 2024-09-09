data "cloudinit_config" "init" {
  gzip          = false
  base64_encode = false

  part {
    filename     = "init-config.yml"
    content_type = "text/cloud-config"

    content = templatefile("files/init-config/init-config.yml", {
      ssh_port         = var.ssh_port,
      user_name        = var.user_name
    })
  }
}
