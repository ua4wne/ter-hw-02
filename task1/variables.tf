###cloud vars


variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}


###ssh vars

variable "vms_ssh_public_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIF6BlRL7ju3oOkk33aTncS7h7aChx4ZIaUs8wipYkZFS dervish@devops"
  description = "ssh-keygen -t ed25519"
}

variable "vm_web_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "yandex_compute_image"
}

variable "vm_web_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "name of compute instanse"
}

variable "vm_web_platform" {
  type        = string
  default     = "standard-v1"
  description = "platform of compute instanse"
}

variable "vm_web_cores" {
  type        = number
  default     = 2
  description = "CPU count"
}

variable "vm_web_memory" {
  type        = number
  default     = 1
  description = "RAM size"
}

variable "vm_web_core_fraction" {
  type        = number
  default     = 5
  description = "CPU core_fraction"
}

variable "vm_web_preemptible" {
  type        = bool
  default     = true
  description = "enable preemptible"
}

variable "vm_web_nat" {
  type        = bool
  default     = true
  description = "enable nat"
}

variable "vm_web_serial-port" {
  type        = bool
  default     = true
  description = "enable serial-port"
}

variable "vm_web_user" {
  type        = string
  default     = "ubuntu"
  description = "user"
}
