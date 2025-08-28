# Subnet group for ElastiCache
resource "aws_elasticache_subnet_group" "sg" {
  name       = "${var.cluster_id}-subnet-group"
  subnet_ids = var.subnet_ids
}

# Redis Replication Group
resource "aws_elasticache_replication_group" "example" {
  description = "redis replication group"
  replication_group_id          = var.cluster_id
  engine                        = var.engine        
  engine_version                = var.engine_version   
  node_type                     = var.cache_node_type
  parameter_group_name          = var.parameter_group_name
  port                          = var.port
  num_cache_clusters            = var.num_cache_clusters             
  automatic_failover_enabled    = var.failover
  multi_az_enabled              = var.multi_az_enabled
  subnet_group_name             = aws_elasticache_subnet_group.sg.name
  security_group_ids            = var.security_group_ids

  tags = var.tags
}
