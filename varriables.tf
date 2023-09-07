variable "image" {
  type    = string
  default = "ubuntu"
}

variable "region" {
  type    = string
  default = "eu"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "db_user" {
  type    = string
  default = "test1"
}

variable "db_pass" {
  type    = string
  default = "passdb"
}

variable "db_name" {
  type    = string
  default = "test_db"
}

variable "airflow_www_user" {
  type    = string
  default = "teset_airflow"
}

variable "airflow_www_pass" {
  type    = string
  default = "testpass"
}

variable "docker_username" {
  type    = string
  default = "docker"
}

variable "docker_pass" {
  type    = string
  default = "pass"
}

variable "conn_type" {
  type    = string
  default = "any"
}

variable "work_db_user" {
  type    = string
  default = "user"
}

variable "work_db_pass" {
  type    = string
  default = "pass"
}

variable "work_db_host" {
  type    = string
  default = "host"
}

variable "work_db_port" {
  type    = number
  default = 3888
}

variable "work_db_schema" {
  type    = string
  default = "my_schema"
}

variable "image_name" {
  type    = string
  default = "ghcr.io/lek-x/airflow:21"
}

variable "build_ver" {
  type    = string
  default = "43"
}

variable "vm_size" {
  type    = string
  default = "s-2vcpu-4gb"
}
