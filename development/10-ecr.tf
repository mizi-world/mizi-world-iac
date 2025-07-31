resource "aws_ecr_repository" "ecr_image" {
  name                 = "${var.environment}-ecr"
  image_tag_mutability = var.ecr_mutability == true ? "MUTABLE" : "IMMUTABLE"
}

resource "aws_ecr_lifecycle_policy" "ecr_authn_policy" {
  repository = aws_ecr_repository.ecr_image.name
  policy = jsonencode({
    rules = [
      {
        rulePriority = 1,
        description  = "Keep last ${var.ecr_keepImageCount} images",
        selection = {
          tagStatus     = "tagged",
          tagPrefixList = ["v"],
          countType     = "imageCountMoreThan",
          countNumber   = "${var.ecr_keepImageCount}"
        },
        action = {
          type = "expire"
        }
      }
    ]
  })
}
