variable "project_id" {
  description = "ID del proyecto en Google Cloud Platform"
  type        = string
}

variable "region" {
  description = "Region de GCP para la subred y recursos regionales"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "Zona dentro de us-central1 para las instancias"
  type        = string
  default     = "us-central1-a"
}

variable "subnet_cidr" {
  description = "Rango CIDR de la subred en us-central1"
  type        = string
  default     = "10.10.0.0/24"
}

variable "ssh_user" {
  description = "Usuario SSH que creara GCP en las instancias Linux"
  type        = string
  default     = "ansible"
}

variable "ssh_public_key_path" {
  description = "Ruta a la clave publica SSH generada en el nodo maestro"
  type        = string
  default     = "~/.ssh/ansible_gcp_lab.pub"
}

variable "ssh_private_key_path" {
  description = "Ruta a la clave privada SSH en el nodo maestro para el inventario"
  type        = string
  default     = "~/.ssh/ansible_gcp_lab"
}