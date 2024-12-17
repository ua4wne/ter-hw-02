output "vm_params" {
  value = "platform_name: ${yandex_compute_instance.platform.name} \n platform_ip: ${yandex_compute_instance.platform.network_interface[0].nat_ip_address} \n platform_fqdn: ${yandex_compute_instance.platform.fqdn} \n dbvm_name: ${yandex_compute_instance.db.name} \n dbvm_ip: ${yandex_compute_instance.db.network_interface[0].nat_ip_address} \n dbvm_fqdn: ${yandex_compute_instance.db.fqdn}"
}
