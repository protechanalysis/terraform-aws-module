resource "aws_redshift_cluster" "dev_cloud_wh" {
  cluster_identifier = var.name
  database_name      = var.database_name
  master_username    = var.master_username
  master_password    = var.master_password
  port               = var.port
  node_type          = var.node
  cluster_version =  var.version
  cluster_type       = var.cluster
  number_of_nodes = var.number_of_nodes
  cluster_subnet_group_name = aws_redshift_subnet_group.dev_cloud_wh.name
  vpc_security_group_ids = var.cluster_security_groups
  publicly_accessible = var.public_access
  multi_az           = var.multi_az
  availability_zone_relocation_enabled = var.relocation
  skip_final_snapshot = var.skip_snapshot

  tags = var.tags
}

resource "aws_redshift_subnet_group" "dev_cloud_wh" {
  name       = var.name
  subnet_ids = var.subnet_ids

  tags = var.tags
}

resource "aws_redshift_cluster_iam_roles" "dev_cloud_wh_role" {
  cluster_identifier = aws_redshift_cluster.dev_cloud_wh.cluster_identifier
  iam_role_arns      = var.iam_role_redshift_arn
}

