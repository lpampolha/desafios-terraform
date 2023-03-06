terraform {
  required_version = "~>1.0"
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

resource "digitalocean_droplet" "desafio1" {
  image    = "ubuntu-22-04-x64"
  name     = var.droplet_name
  region   = var.droplet_region
  size     = var.droplet_size
  ssh_keys = [data.digitalocean_ssh_key.ssh_key.id]
}

resource "digitalocean_firewall" "firewall_desafio1" {
  name = "firewall-desafio1"

  droplet_ids = [digitalocean_droplet.desafio1.id]

  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = ["239.13.117.114/32"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "53"
    source_addresses = ["239.13.117.114/32"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "80"
    source_addresses = ["239.13.117.114/32"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "443"
    source_addresses = ["239.13.117.114/32"]
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "22"
    destination_addresses = ["239.13.117.114/32"]
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "53"
    destination_addresses = ["239.13.117.114/32"]
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "80"
    destination_addresses = ["239.13.117.114/32"]
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "443"
    destination_addresses = ["239.13.117.114/32"]
  }
}