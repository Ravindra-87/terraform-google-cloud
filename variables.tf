
variable "project" {
  description = "jenkins-tf-pro-2025"
  type        = string
}
variable "credentials_file" {
  default = "~/Downloads/terraform-sra-key.json"
}
variable "region" {
  default = "us-central1"
}
variable "zone" {
  default = "us-central1-b"
}
variable "instance_name" {
  default = "jenkins-machine"
}
variable "machine_type" {
  default = "n2-standard-3"
}
variable "service_account_email" {
  description = "Email of the service account to attach to the VM"
  type        = string
}



