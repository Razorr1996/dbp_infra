variable "cluster_name" {
  description = "Cluster name"
}

variable "service_name" {
  description = "Service name"
}

variable "cpu_average_target" {
  description = "CPU average target"
}

variable "memory_average_target" {
  description = "Memory average target"
}

variable "scale_in_cooldown" {
  description = "Scale-in cooldown"
}

variable "scale_out_cooldown" {
  description = "Scale-out cooldown"
}

variable "max_capacity" {
  description = "Max capacity"
}

variable "min_capacity" {
  description = "Min capacity"
}
