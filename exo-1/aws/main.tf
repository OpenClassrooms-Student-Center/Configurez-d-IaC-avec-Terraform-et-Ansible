terraform {
  # Définition des providers utilisés par le déploiement
  # avec la version souhaité
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  # Définition de la version de Terraform requise
  required_version = ">= 1.2.0"
}

# Configuration du provider "aws"
# Voir https://registry.terraform.io/providers/hashicorp/aws/latest/docs
# pour plus de détails
provider "aws" {
  # Définition de la "région" ciblée par le déploiement
  # Voir https://aws.amazon.com/fr/about-aws/global-infrastructure/
  region = "us-east-1"
}

# Définit d'une ressource de type
# "aws_instance" permettant de créer un serveur
# sur l'infrastructure Amazon EC2
resource "aws_instance" "my_server" {
  # Définition de l'AMI (identifiant du modèle d'image disque)
  # et du type d'instance (i.e. caractéristiques de performance)
  # de la machine virtuelle à créer
  ami           = "ami-04a81a99f5ec58529"
  instance_type = "t2.micro"

  # Définition des étiquettes à associer à la machine
  # virtuelle, ici "Name" pour définir un nom
  tags = {
    Name = "OpenClassrooms-P6"
  }
}
