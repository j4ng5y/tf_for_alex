resource "digitalocean_domain" "domain" {
    name = var.domain_name
}

resource "digitalocean_certificate" "lecert" {
    name = "le-terraform-cert"
    type = "lets_encrypt"
    domains = [
        var.domain_name
    ]
}

resource "digitalocean_loadbalancer" "public" {
    name = "lb"
    region = "nyc1"
    redirect_http_to_https = true

    forwarding_rule {
        entry_port = 80
        entry_protocol = "http"
        target_port = 8080
        target_protocol = "http"
    }

    forwarding_rule {
        entry_port = 443
        entry_protocol = "https"
        target_port = 8080
        target_protocol = "http"
        certificate_name = digitalocean_certificate.lecert.name
    }

    healthcheck {
        port = 22
        protocol = "tcp"
    }

    droplet_ids = [
        var.docker_host_id
    ]
}