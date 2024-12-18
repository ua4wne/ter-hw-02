resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}

resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
  route_table_id = yandex_vpc_route_table.rt.id
}

data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_family
}

resource "yandex_compute_instance" "web" {
  name        = local.websrv_name
  platform_id = var.vm_web_platform
  zone        = var.default_zone
  resources {
    cores         = var.resources_vm["cores"]
    memory        = var.resources_vm["memory"]
    core_fraction = var.resources_vm["core_fraction"]
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.vm_web_preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = var.vm_web_nat
  }

  metadata = {
    serial-port-enable = var.metadata_map.metadata.serial-port-enable
    ssh-keys           = "${var.vm_web_user}:${var.metadata_map.metadata.ssh-keys}"
  }

}

resource "yandex_vpc_subnet" "db" {
  name           = var.vm_db_vpc_name
  zone           = var.vm_db_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.vm_db_cidr
  route_table_id = yandex_vpc_route_table.rt.id
}

resource "yandex_compute_instance" "db" {
  name        = local.dbsrv_name
  platform_id = var.vm_db_platform
  zone        = var.vm_db_zone
  resources {
    cores         = var.resources_db["cores"]
    memory        = var.resources_db["memory"]
    core_fraction = var.resources_db["core_fraction"]
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.vm_db_preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.db.id
    nat       = var.vm_db_nat
  }

  metadata = {
    serial-port-enable = var.metadata_map.metadata.serial-port-enable
    ssh-keys           = "${var.vm_web_user}:${var.metadata_map.metadata.ssh-keys}"
  }

}
