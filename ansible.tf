resource "local_file" "ansible_inventory" {
  filename        = local.ansible.inventory_file_path
  file_permission = "0640"
  content = templatefile(
    local.ansible.inventory_template_path,
    {
      ip_name      = digitalocean_droplet.VM1.ipv4_address
      droplet_name = digitalocean_droplet.VM1.name
    }
  )
  depends_on = [digitalocean_droplet.VM1]
}
