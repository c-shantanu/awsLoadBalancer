region                 = "us-east-1"
name                   = "my-alb"
security_groups        = ["sg-0029fbf611efb3d6c"]
subnets                = ["subnet-09b10d447e90b90e2", "subnet-0c38de8536d67f3b5"]
enable_deletion_protection = false
tags                   = {
  Environment = "production"
  Project     = "MyProject"
}

target_group_name      = "my-target-group"
target_group_port      = 80
target_group_protocol  = "HTTP"
vpc_id                 = "vpc-095809ea17cb4369c"
target_type            = "instance"
listener_port          = 80
listener_protocol      = "HTTP"
