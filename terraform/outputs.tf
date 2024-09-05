output "public_ip" {
  value = hcloud_server.this-server.ipv4_address
}
