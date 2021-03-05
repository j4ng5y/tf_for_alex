resource "digitalocean_ssh_key" "keyfile" {
    name = "terraform ssh key"
    public_key = file(var.ssh_key_file)
}

resource "digitalocean_droplet" "docker_host" {
    image = "docker-20-04"
    name = "docker-host"
    region = "nyc1"
    size = "s-1vcpu-1gb"
    vpc_uuid = var.vpc_uuid
    ssh_keys = [
      digitalocean_ssh_key.keyfile
    ]
}