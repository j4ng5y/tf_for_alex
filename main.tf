module "network" {
  source   = "./mods/digitalocean/networking"
  vpc_name = var.vpc_name
}

module "db" {
  source       = "./mods/digitalocean/db"
  cluster_name = var.db_cluster_name
  db_name      = var.db_name
}

module "compute" {
  source       = "./mods/digitalocean/droplet"
  vpc_uuid     = module.network.vpc_uuid
  ssh_key_file = var.ssh_key_file
}

module "lb" {
  source         = "./mods/digitalocean/lb"
  docker_host_id = module.compute.docker_host_id
}