variable "hosts" {
	default = ["128.0.0.1 localhost","192.168.1.13 gitlab.test"]
}

resource "null_resource" "hosts" {
	count ="${length(var.hosts)}"
	triggers = {
		foo = element(var.hosts,count.index)
	}
	provisioner "local-exec"{
		command = "echo '${element(var.hosts,count.index)}' >> hosts.txt"
	}
}
