terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = ">= 3.0.1"
    }
  }
}

provider "docker" {
  host    = "unix:///var/run/docker.sock"
  registry_auth {
    address  = "docker.io" # Replace with the correct registry URL if different
    username = "shubhamjankar04"
    password = "DevOps@123"
}

}

# Docker Network
resource "docker_network" "project_network" {
  name = "project_network"
}

# MongoDB Container
resource "docker_container" "mongo" {
  name  = "mongo_container"
  image = "mongo:6.0" # Use pre-built MongoDB image
  ports {
    internal = 27017
    external = 27017
  }
  networks_advanced {
    name = docker_network.project_network.name
  }
}

# Frontend Image
resource "docker_image" "frontend" {
  name = "frontend"
  build {
    context    = "/Users/shashikant.bandgar/Desktop/Lendenclub/registrationform/frontend" 
    dockerfile = "Dockerfile"             
    no_cache   = true
  }
}

# Frontend Container
resource "docker_container" "frontend" {
  name  = "frontend"
  image = docker_image.frontend.name
  ports {
    internal = 3000
    external = 3000
  }
  networks_advanced {
    name = docker_network.project_network.name
  }
}

# Backend Image
  resource "docker_image" "backend" {
  name = "backend"
  build {
    context    = "/Users/shashikant.bandgar/Desktop/Lendenclub/registrationform/backend" 
    dockerfile = "Dockerfile"             
    no_cache   = true
  }
}

# Backend Container
resource "docker_container" "backend" {
  name  = "backend"
  image = docker_image.backend.name
  ports {
    internal = 8000
    external = 8000
  }
  networks_advanced {
    name = docker_network.project_network.name
  }
}