# lab3 
# main.tf
provider "aws" {
  region = "us-west-2"
  access_key = "ASIASKYLFYNXTGH7BCFA"
  secret_key = "GExPZh0shO5iP6EU7uh4eArJuRaJjYAyS/iFXnL9"
  token = "FwoGZXIvYXdzEMv//////////wEaDJvRuxno/m5WuQn6YiLVAYQR4Zz5ChrVFzEk27Jip7BKxJpBd20VMwAxm7xdBf+QCvuG5g9y+OvV5p9APgkjvi6Sk8MKzdvhChkLc5e5Zlz2eZGrNnSgH+V9UhNWFJ759uAt6KymhOug7DxGN/X0FGjmOrN2DFesysUqM8gkIETIE9MVWbTV8Ghp3Q/b2JJOEoZXyQYRE/QhVyD1qnA/jgUpD9waXrlMLoFSOEfwW+ssR3e5KuVxsJzQVlbrtC+a8dZmLQ5npq78d7JPp7bVc1uH0CO5hqST+gV+y+YaNVTyS0eDTCinmr2UBjItgBDQi+SASlEyy4WIktUCdRwNv8DU8ykZJrI7NOuzGiW6CU7d6GlGOesY3cOP"
}

# module "cc2022-client2-web-app" {
#     source = "./modules/s3website"
#     region = local.region
#     site_name = local.client_app_site_name
# }

# resource "aws_s3_object" "object" {
#   bucket = local.client_app_site_name
#   key = "test.html"
#   source = "./test/html"
#   content_type = "text/html"

#   etag = filemd5("./test.html")
# }

# resource "aws_s3_object" "object2" {
#   bucket = local.client_app_site_name
#   key = "index.html"
#   source = "./index.html"
#   content_type = "text/html"

#   etag = filemd5("./index.html")
# }

resource "aws_s3_bucket" "main_s3_bucket" {
  bucket = "soudeh-bucket-assignment"
  tags = {
    Name        = "Soudeh bucket"
    Environment = "Dev"
  }
}
resource "aws_instance" "app_server" {
  ami           = "ami-08d70e59c07c61a3a"
  instance_type = "t2.micro"
  tags = {
    Name = var.instance_name
  }
}

# variables.tf
variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "Soudeh_CC_Assignment1"
}