variable "AmiName" {
	default = "Ixia_BreakingPoint_Virtual_Blade_11.20.20.18-prod-cl7jzjvfgu32i"
	description = "AMI name used for deploying instances"
	type = string
}

variable "AmiOwner" {
	default = "aws-marketplace"
	description = "Owner of AMI used for deploying instances"
	type = string
}

variable "Eth0PrivateIpAddress" {
	default = "10.0.10.11"
	description = "Private IP address associated with the first network interface"
	type = string
}

variable "Eth0SecurityGroupId" {
	description = "Id of the security group associated with first network interface"
	type = string
}

variable "Eth0SubnetId" {
	description = "Id of the subnet associated with the first network interface"
	type = string
}

variable "Eth1PrivateIpAddresses" {
	default = [ "10.0.2.12", "10.0.2.13", "10.0.2.14", "10.0.2.15", "10.0.2.16", "10.0.2.17", "10.0.2.18", "10.0.2.19", "10.0.2.20", "10.0.2.21" ]
	description = "List of IP addresses associated with the second network interface"
	type = list(string)
}

variable "Eth1SecurityGroupId" {
	description = "Id of the security group associated with second network interface"
	type = string
}

variable "Eth1SubnetId" {
	description = "Id of the subnet associated with the second network interface"
	type = string
}

variable "Eth2PrivateIpAddresses" {
	default = [ "10.0.3.12", "10.0.3.13", "10.0.3.14", "10.0.3.15", "10.0.3.16", "10.0.3.17", "10.0.3.18", "10.0.3.19", "10.0.3.20", "10.0.3.21" ]
	description = "List of IP addresses associated with the third network interface"
	type = list(string)
}

variable "Eth2SecurityGroupId" {
	description = "Id of the security group associated with third network interface"
	type = string
}

variable "Eth2SubnetId" {
	description = "Id of the subnet associated with the third network interface"
	type = string
}

variable "InstanceId" {
	default = "agent"
	description = "Id of the instance of this module that ensures uniqueness"
	type = string
}

variable "InstanceName" {
	default = null
	description = "Custom instance name used to override the default automatically generated name"
	type = string
}

variable "InstanceType" {
	default = "c5n.xlarge"
	description = "Instance type of VM"
	type = string
	validation {
		condition = contains([ "c5n.xlarge", "c5n.2xlarge", "c5n.4xlarge", "c5n.9xlarge", "c5n.18xlarge",
							   "c6in.xlarge", "c6in.2xlarge", "c6in.4xlarge", "c6in.8xlarge", "c6in.12xlarge", "c6in.16xlarge", "c6in.24xlarge", "c6in.32xlarge" ], var.InstanceType)
		error_message = <<EOF
InstanceType must be one of the following types:
	c5n.xlarge, c5n.2xlarge, c5n.4xlarge, c5n.9xlarge, c5n.18xlarge,
	c6in.xlarge, c6in.2xlarge, c6in.4xlarge, c6in.8xlarge, c6in.12xlarge, c6in.16xlarge, c6in.24xlarge, c6in.32xlarge
		EOF
	}
}

variable "PlacementGroupId" {
	description = "Id of the placment group to which instance has been deployed"
	type = string
}

variable "SleepDelay" {
	default = "1m"
	description = "Time duration to delay to allow application to perform internal initialization required before use"
	type = string
}

variable "Tag" {
	default = "bps"
	description = "App ID tag of application using the deployment"
	type = string
}

variable "UserEmailTag" {
	default = "terraform@example.com"
	description = "Email address tag of user creating the deployment"
	type = string
	validation {
		condition = length(var.UserEmailTag) >= 14
		error_message = "UserEmailTag minimum length must be >= 14."
	}
}

variable "UserLoginTag" {
	default = "terraform"
	description = "Login ID tag of user creating the deployment"
	type = string
	validation {
		condition = length(var.UserLoginTag) >= 4
		error_message = "UserLoginTag minimum length must be >= 4."
	}
}

variable "UserProjectTag" {
	default = "module"
	description = "Project tag of user creating the deployment"
	type = string
}

variable "Version" {
	default = "11-20"
	description = "Versioning of the application using the deployment"
	type = string
}

variable "init_cli" {
	default = <<-EOF
#!/bin/bash -xe
systemctl status amazon-ssm-agent
    EOF
	type = string
}