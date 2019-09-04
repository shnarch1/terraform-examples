# Configure the AWS Provider
provider "aws" {
  version = "~> 2.0"
  region  = "us-east-1"
}

module "s3-bucket" {
  source = "../global/s3-bucket"

  "bucket_name" = "schnarch-project1"
  "bucket_acl"  = "private"
  "tag_env"     = "project1"
  "index_document" = "index.html"
  "error_document" = "index.html"

}

module "cloudfront-s3dist" {
  source = "../global/cloudfront-s3dist"
  
  domain_name = "${module.s3-bucket.bucket_domain_name}"
  origin_id   = "${module.s3-bucket.bucket_name}"
  #origin_path = "/"
}


