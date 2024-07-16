terraform {
  # Définition des providers utilisés par le déploiement
  # avec la version souhaité
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

# Configuration du provider "docker"
# Voir https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs
# pour plus de détails
provider "docker" {}

# Création d'une ressource du type "docker_image"
# permettant de créer (récupérer) une image Docker qui
# sera utilisée par notre conteneur
resource "docker_image" "nginx" {
  name = "nginx:latest"
}

# Création d'une ressource du type "docker_container"
# permettant de créer un conteneur utilisant une image
# personnalisée.
resource "docker_container" "my_container" {
  image = docker_image.nginx.image_id
  name  = "my-container"
}
