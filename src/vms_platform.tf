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

variable "vm_db_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "yandex_compute_image"
}

variable "vm_db_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "name of compute instanse"
}

variable "vm_db_platform" {
  type        = string
  default     = "standard-v1"
  description = "platform of compute instanse"
}

variable "vm_db_cores" {
  type        = number
  default     = 2
  description = "CPU count"
}

variable "vm_db_memory" {
  type        = number
  default     = 2
  description = "RAM size"
}

variable "vm_db_core_fraction" {
  type        = number
  default     = 20
  description = "CPU core_fraction"
}

variable "vm_db_preemptible" {
  type        = bool
  default     = true
  description = "enable preemptible"
}

variable "vm_db_nat" {
  type        = bool
  default     = true
  description = "enable nat"
}

variable "vm_db_serial-port" {
  type        = bool
  default     = true
  description = "enable serial-port"
}

variable "vm_db_user" {
  type        = string
  default     = "ubuntu"
  description = "user"
}

variable "vm_db_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "vm_db_cidr" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vm_db_vpc_name" {
  type        = string
  default     = "db"
  description = "VPC network & subnet name"
}

