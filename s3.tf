# Create S3 Bucket 
resource "aws_s3_bucket" "yousef_bucket" { 
    bucket = "bucketname" 
    force_destroy = true 
    tags = { 
        Name = "bucket tag"
         }
}