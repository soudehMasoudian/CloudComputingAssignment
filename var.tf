# main.tf
resource "local_file" "pets" {
  filename = var.file_name
  content  = "we love pets"
}

# variables.tf
variable "file_name" {
  description = "The name of the file to create"
  default = "file_name"
}

# output.tf
output "file_permissions" {
  value = local_file.pets.directory_permission
}

output "file_name" {
  value = local_file.pets.filename
  description = "The name of the file created"
}