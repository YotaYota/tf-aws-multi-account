resource "aws_s3_bucket" "bucket" {
  bucket = "uvr-devops-test-digeridoo-dummy-bucket-wo-purpose-${terraform.workspace}"
}

