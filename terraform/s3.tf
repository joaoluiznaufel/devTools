resource "aws_s3_bucket" "bucket" {
  bucket = var.www_domain_name
  acl    = "public-read"
  policy = file("policy.json")
  region = "my-region"
  website {
    index_document = "index.html"
    error_document = "404.html"
  }
}

resource "aws_s3_bucket" "bucket_api" {
  bucket = var.another_domain_name
  acl    = "public-read"
  policy = file("policy.json")
  region = "my-region"
  website {
    index_document = "index.html"
    error_document = "404.html"
  }
}
