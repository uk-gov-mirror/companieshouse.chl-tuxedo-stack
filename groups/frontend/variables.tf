variable "ami_version_pattern" {
  type        = string
  description = "The pattern to match AMI version to"
  default     = "*"
}

variable "environment" {
  type        = string
  description = "The environment name to be used when creating AWS resources"
}

variable "instance_count" {
  type        = number
  description = "The number of instances to create"
  default     = 3
}

variable "instance_type" {
  type        = string
  description = "The instance type to use"
  default     = "t3.micro"
}

variable "lb_deletion_protection" {
  type        = bool
  description = "A boolean value representing whether to enable load balancer deletion protection"
  default     = false
}

variable "lvm_block_devices" {
  type = list(object({
    aws_volume_size_gb: string,
    filesystem_resize_tool: string,
    lvm_logical_volume_device_node: string,
    lvm_physical_volume_device_node: string,
  }))
  description = "A list of objects representing LVM block devices; each LVM volume group is assumed to contain a single physical volume and each logical volume is assumed to belong to a single volume group; the filesystem for each logical volume will be expanded to use all available space within the volume group using the filesystem resize tool specified; block device configuration applies only on resource creation. Set the 'filesystem_resize_tool' and 'lvm_logical_volume_device_node' fields to empty strings if the block device contains no filesystem and should be excluded from the automatic filesystem resizing, such as when the block device represents a swap volume"
  default = []
}

variable "region" {
  type        = string
  description = "The AWS region in which resources will be administered"
}

variable "service" {
  type        = string
  description = "The service name to be used when creating AWS resources"
  default     = "tuxedo"
}

variable "service_subtype" {
  type        = string
  description = "The service subtype name to be used when creating AWS resources"
  default     = "frontend"
}

variable "tuxedo_services" {
  type        = map(map(number))
  description = "A map whose keys represent server-side tuxedo server groups, with nested maps representing individual services by name and port number."
  default = {
    ceu = {
      ch  = 5000,
      img = 5001,
      orc = 5002,
    },
    chd = {
      ch  = 4000,
      img = 4001,
      orc = 4002,
    },
    ewf = {
      stem  = 2000,
      auth  = 2001,
      orc   = 2002,
      adobe = 2003,
      ixbrl = 2004,
      tnep  = 2005,
    },
    xml = {
      ois    = 3000,
      orc    = 3001,
      ewf    = 3002,
      chips  = 3003,
      ixbrl  = 3004
      tnep   = 3005,
      trans  = 3006,
      sameas = 3007,
    },
  }
}

variable "ssh_keyname" {
  type        = string
  description = "The SSH keypair name to use for remote connectivity"
}
