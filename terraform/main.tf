terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "~> 1.45"
    }
  }
}

resource "hcloud_server" "this-server" {
  name        = var.server_name
  image       = var.image
  server_type = var.server_type
  location    = var.location
  ssh_keys    = [hcloud_ssh_key.default.id]
  depends_on  = [hcloud_ssh_key.default]
  user_data   = data.cloudinit_config.init.rendered

  connection {
    type        = "ssh"
    user        = var.user_name
    port        = var.ssh_port
    private_key = file(var.private_key_path)
    host        = hcloud_server.this-server.ipv4_address
    timeout     = "2m"
  }

  provisioner "remote-exec" {
    inline = ["echo UP AND RUNNING"]
  }
}
