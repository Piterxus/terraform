resource "aws_launch_configuration" "example" {
  name          = "example-launch-config"
  image_id      = var.ami_id  # Imagen de EC2 (Windows en este caso)
  instance_type = var.instance_type
  security_groups = [var.security_group_id]
  associate_public_ip_address = true  # Las instancias serán públicas

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "example" {
  desired_capacity     = var.desired_capacity
  max_size             = var.max_size
  min_size             = var.min_size
  vpc_zone_identifier  = var.subnet_ids
  launch_configuration = aws_launch_configuration.example.id
  health_check_type    = "EC2"
  health_check_grace_period = 300  # Tiempo de gracia para la verificación de salud

  tag {
    key                 = "Name"
    value               = "Windows-EC2"
    propagate_at_launch = true
  }
}

resource "aws_security_group" "autoscaling_sg" {
  name        = "autoscaling-sg"
  description = "Security group for auto scaling instances"
  vpc_id      = var.vpc_id
  ingress {
    from_port   = 3389   # Puerto para RDP (Windows)
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
