data "template_file" "policy" {
  template = "${file("${path.module}/policy.json")}"

  vars {
    bucket_name = "${var.bucket_name}"
  }
}

resource "aws_s3_bucket" "this" {
  bucket = "${var.bucket_name}"
  acl    = "${var.bucket_acl}"
  policy = "${data.template_file.policy.rendered}"

  tags = {
    Environment = "${var.tag_env}"
  }

  website {
    index_document = "${var.index_document}"
    error_document = "${var.error_document}"
  }
}