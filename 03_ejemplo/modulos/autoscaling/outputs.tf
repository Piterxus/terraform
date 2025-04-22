output "autoscaling_group_id" {
  value = aws_autoscaling_group.example.id
}

output "launch_configuration_id" {
  value = aws_launch_configuration.example.id
}
