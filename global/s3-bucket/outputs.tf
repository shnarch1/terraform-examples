output "bucket_name" {
  description = "The new bucket name"
  value = "${aws_s3_bucket.this.bucket}"
}

output "website_endpoint" {
  description = "The static web site endpoint"
  value = "${aws_s3_bucket.this.website_endpoint}"
}

output "bucket_domain_name" {
  description = "The static web site endpoint"
  value = "${aws_s3_bucket.this.bucket_domain_name}"
}