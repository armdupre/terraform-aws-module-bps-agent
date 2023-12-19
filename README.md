# module-bps-agent/aws

## Description
Terraform module for BreakingPoint agent deployment on Amazon Web Services

## Deployment
This module creates a single instance having three network interfaces.

## Usage
```tf
module "Agent" {
	source  = "armdupre/module-bps-agent/aws"
	Eth0SecurityGroupId = aws_security_group.PublicSecurityGroup.id
	Eth0SubnetId = aws_subnet.PublicSubnet.id
	Eth1SecurityGroupId = aws_security_group.PrivateSecurityGroup.id
	Eth1SubnetId = aws_subnet.PrivateSubnet.id
	Eth2SecurityGroupId = aws_security_group.PrivateSecurityGroup.id
	Eth2SubnetId = aws_subnet.PrivateSubnet.id
}
```