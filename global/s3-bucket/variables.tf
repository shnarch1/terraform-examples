
variable "bucket_name" {
  description = "The new bucket name"
  type        = "string"
  }

variable "bucket_acl" {
  description = "The bucket's acl"
  type        = "string"
}

variable "tag_env" {
  description = "Environment tag"
  type        = "string"
}

variable "index_document" {
  description = "index file"
  type        = "string"
}

variable "error_document" {
  description = "error document"
  type        = "string"
}
