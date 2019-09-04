locals {
  viewer_protocol_policy = "allow-all"
  min_ttl = 0
  default_ttl = 86400
  max_ttl = 31536000
}


resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name = "${var.domain_name}"
    origin_id   = "${var.origin_id}"
    origin_path = "${var.origin_path}"
  }

  enabled = true
  is_ipv6_enabled = true

  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "${var.origin_id}"

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "${local.viewer_protocol_policy}"
    min_ttl                = "${local.min_ttl}"
    default_ttl            = "${local.default_ttl}"
    max_ttl                = "${local.max_ttl}"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
  
  viewer_certificate {
    cloudfront_default_certificate = true
  }

}