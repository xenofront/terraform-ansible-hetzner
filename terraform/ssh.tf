resource "hcloud_ssh_key" "default" {
  name       = "ssh-key"
  public_key = file(var.public_key_path)
}
