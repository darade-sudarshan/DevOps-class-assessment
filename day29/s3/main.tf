
resource "aws_s3_bucket" "app_bucket" {
  bucket = var.bucket_name
 

  tags = {
    Name = join("-", ["s3bucket", var.environment, "AppBucket"])
  }
}

