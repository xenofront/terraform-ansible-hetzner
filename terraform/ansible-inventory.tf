resource "local_file" "ansible_inventory" {

  content = templatefile("./ansible/inventory.tmpl", {
    hosts = tomap({
      server = tomap({
        public_ip = hcloud_server.this-server.ipv4_address
        ssh_port  = var.ssh_port
      })
    })
  })

  filename = format("%s/%s", abspath(path.root), "../ansible/inventory.yml")
}

resource "local_file" "ansible_cfg" {

  content = templatefile("./ansible/cfg.tmpl", {
    data = tomap({
      inventory        = "inventory.yml"
      private_key_file = var.private_key_path
      user             = var.user_name
    })
  })

  filename = format("%s/%s", abspath(path.root), "../ansible/ansible.cfg")
}

resource "local_file" "host_vars" {

  content = templatefile("./ansible/host_vars.tmpl", {
    data = tomap({
      user = var.user_name
    })
  })

  filename = format("%s/%s", abspath(path.root), "../ansible/host_vars/${hcloud_server.this-server.ipv4_address}.yml")
}
