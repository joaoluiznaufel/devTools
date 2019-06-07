resource "aws_route53_zone" "main" {
  name = "website.com"
}

resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "www.website.com"
  type    = "CNAME"

  records = [aws_s3_bucket.bucket.website_domain]
  ttl = "300"
}

resource "aws_route53_record" "travel" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "api.website.com"
  type    = "CNAME"

  records = [aws_s3_bucket.bucket_api.website_domain]
  ttl = "300"
}
