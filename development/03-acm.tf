resource "aws_acm_certificate" "cert" {
  domain_name       = var.acm_domain_name
  validation_method = "DNS"

  key_algorithm = "RSA_2048"

  tags = {
    Environment = "${var.stage}"
  }
}


// ! As there an issue with the ACM cerificate with alternate names, we validated manually in cloudflare
