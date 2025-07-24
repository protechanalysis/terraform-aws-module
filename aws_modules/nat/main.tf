resource "aws_eip" "dev_eip" {
  domain = "vpc"

  tags = {
    Name = var.name
  }
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.dev_eip.id
  subnet_id     = var.public_subnet_id

  tags = {
    Name = var.name
  }

  depends_on = [aws_eip.dev_eip]
}
