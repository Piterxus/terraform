resource "aws_s3_bucket" "mi_bucket" {
  bucket = "my-tf-test-bucket-pedsanlan"


  tags = {
    Name = "Bucket ejercicio 3 terraform"
  }
}