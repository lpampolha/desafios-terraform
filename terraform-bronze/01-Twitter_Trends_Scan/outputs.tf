output "droplet_ip" {
  value = digitalocean_droplet.desafio1[*].ipv4_address
}