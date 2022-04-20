resource "aws_instance" "bastion" {
    ami                                  = "ami-0801a1e12f4a9ccc0"
    associate_public_ip_address          = true
    availability_zone                    = "ap-southeast-1b"
    disable_api_termination              = false
    ebs_optimized                        = false
    get_password_data                    = false
    hibernation                          = false
    instance_initiated_shutdown_behavior = "stop"
    instance_type                        = "t2.micro"
    key_name                             = "aguscuk"
    monitoring                           = false
    security_groups                      = [
        "secg-aguscuk",
    ]
    source_dest_check                    = true
    subnet_id                            = "subnet-09b30a6f"
    tags                                 = {
        "Name"     = "bastion"
        "Service"  = "bastion"
        "env"      = "prd"
        "hostname" = "bastion"
        "provider" = "aws"
        "tribe"    = "sre"
    }
    tags_all                             = {
        "Name"     = "bastion"
        "Service"  = "bastion"
        "env"      = "prd"
        "hostname" = "bastion"
        "provider" = "aws"
        "tribe"    = "sre"
    }
    tenancy                              = "default"
    vpc_security_group_ids               = [
        "sg-02390b75fbb1def17",
    ]

    capacity_reservation_specification {
        capacity_reservation_preference = "open"
    }

    credit_specification {
        cpu_credits = "standard"
    }

    enclave_options {
        enabled = false
    }

    metadata_options {
        http_endpoint               = "enabled"
        http_put_response_hop_limit = 1
        http_tokens                 = "optional"
        instance_metadata_tags      = "disabled"
    }

    root_block_device {
        delete_on_termination = true
        encrypted             = false
        iops                  = 100
        tags                  = {
            "Name"     = "bastion"
            "env"      = "prd"
            "hostname" = "bastion"
            "provider" = "aws"
            "service"  = "bastion"
            "tribe"    = "sre"
        }
        throughput            = 0
        volume_size           = 8
        volume_type           = "gp2"
    }

    timeouts {}
}