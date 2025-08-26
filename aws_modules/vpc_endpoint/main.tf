data "aws_vpc_endpoint_service" "storage_objects" {
  service = "s3"
}

resource "aws_vpc_endpoint" "s3" {
  vpc_id       = var.vpc_id
  service_name = data.aws_vpc_endpoint_service.storage_objects.service_name
}


resource "aws_vpc_endpoint_route_table_association" "example" {
  route_table_id  = var.route_table_id
  vpc_endpoint_id = aws_vpc_endpoint.s3.id
}

resource "aws_vpc_endpoint_policy" "example" {
  vpc_endpoint_id = aws_vpc_endpoint.s3.id
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "AllowAll",
        "Effect" : "Allow",
        "Principal" : {
          "AWS" : "*"
        },
        "Action" : [
          "s3:*"
        ],
        "Resource" : "*"
      }
    ]
  })
}