resource "local_file" "ansible_inventory" {
  filename = "${path.module}/inventory.ini"
  content  = <<-EOT
    [linux]
    %{for name, vm in google_compute_instance.linux_vms~}
    ${name} ansible_host=${vm.network_interface[0].access_config[0].nat_ip} ansible_user=${var.ssh_user} ansible_ssh_private_key_file=${pathexpand(var.ssh_private_key_path)}
    %{endfor~}

    [linux:vars]
    ansible_connection=ssh
    ansible_ssh_common_args='-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'
  EOT
}