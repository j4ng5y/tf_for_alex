resource "digitalocean_certificate" "lecert" {
    name = "le-terraform-cert"
    type = "lets_encrypt"
    domains = [
        
    ]
}

resource "digitalocean_loadbalancer" "public" {
    name = "lb"
    region = "nyc1"

    forwarding_rule {
        entry_port = 80
        entry_protocol = "tcp"
        target_port = 8080
        target_protocol = "tcp"
    }

    healthcheck {
        port = 22
        protocol = "tcp"
    }

    droplet_ids = [
        var.docker_host_id
    ]
}