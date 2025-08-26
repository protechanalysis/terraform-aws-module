output "redis_primary_endpoint" {
  description = "Primary endpoint for Redis connections (read/write)"
  value       = aws_elasticache_replication_group.example.primary_endpoint_address
}

output "redis_reader_endpoint" {
  description = "Reader endpoint for Redis connections (read-only, load balanced)"
  value       = aws_elasticache_replication_group.example.reader_endpoint_address
}