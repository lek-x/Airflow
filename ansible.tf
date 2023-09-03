resource "local_file" "ansible_inventory" {
  filename        = local.ansible.inventory_file_path
  file_permission = "0640"
  content = templatefile(
    local.ansible.inventory_template_path,
    {
      ip_name          = digitalocean_droplet.VM1.ipv4_address
      droplet_name     = digitalocean_droplet.VM1.name
      db_user          = var.db_user
      db_pass          = var.db_pass
      db_name          = var.db_name
      airflow_www_user = var.airflow_www_user
      airflow_www_pass = var.airflow_www_pass
      docker_pass      = var.docker_pass
      docker_username  = var.docker_username
      conn_type        = var.conn_type
      work_db_user     = var.work_db_user
      work_db_pass     = var.work_db_pass
      work_db_host     = var.work_db_host
      work_db_port     = var.work_db_port
      work_db_schema   = var.work_db_schema
      image_name       = var.image_name
      build_version    = var.build_version
    }
  )
  depends_on = [digitalocean_droplet.VM1]
}
