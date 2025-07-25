resource "aws_eip" "dev_eip" {
  domain = "vpc"

  tags = var.tags
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.dev_eip.id
  subnet_id     = var.public_subnet_id

  tags = var.tags

  depends_on = [aws_eip.dev_eip]
}
