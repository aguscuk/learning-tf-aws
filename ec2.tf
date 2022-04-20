resource "aws_instance" "web1" {
    ami                     = "ami-0801a1e12f4a9ccc0"
    instance_type           = "t2.micro"

    subnet_id               = "${aws_subnet.prod-subnet-public-1.id}"

    vpc_security_group_ids  = ["${aws_security_group.ssh-allowed.id}"]

    key_name                = "aguscuk"
    tags                    = {
        "Name"     = "web1"
        "service"  = "nginx"
        "env"      = "prd"
        "hostname" = "web1"
        "provider" = "aws"
        "tribe"    = "sre"
    }
    # user-data
    provisioner "file" {
        source              = "user-data.sh"
        destination         = "/tmp/user-data.sh"
    }
    provisioner "remote-exec" {
        inline = [
             "chmod +x /tmp/user-data.sh",
             "sudo /tmp/user-data.sh"
        ]
    }
    connection {
        type                = "ssh"
        host                = self.public_ip
        user                = "${var.EC2_USER}"
        private_key         = "${file("${var.PRIVATE_KEY_PATH}")}"
    }
}