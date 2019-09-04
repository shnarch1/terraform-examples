output "bucket_name" {
  description = "The new bucket name"
  value = "${module.s3-bucket.bucket_name}"
}

output "website_endpoint" {
  description = "The static web site endpoint"
  value = "${module.s3-bucket.website_endpoint}"
}