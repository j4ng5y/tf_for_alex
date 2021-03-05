resource "digitalocean_database_cluster" "db_cluster" {
    name = var.cluster_name
    engine = "mysql"
    version = "8"
    size = "db-s-1vcpu-1gb"
    region = "nyc1"
    node_count = 1
}

resource "digitalocean_database_db" "db" {
    cluster_id = digitalocean_database_cluster.db_cluster.id
    name = var.db_name
}