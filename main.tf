terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 2.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_network" "app_network" {
  name = "app-network"

  lifecycle {
    create_before_destroy = true
  }
}

resource "docker_volume" "mongo_data" {
  name = "mongo-data"
}

resource "docker_container" "mongo" {
  name  = "mongo"
  image = "mongo:latest"

  ports {
    internal = 27017
    external = 27017
  }

  volumes {
    container_path = "/data/db"
    volume_name      = docker_volume.mongo_data.name
  }

  networks_advanced {
    name = docker_network.app_network.name
  }
}

resource "docker_image" "backend_image" {
  name   = "backend:latest"
  build {
    context    = "./backend"
    dockerfile = "./backend/Dockerfile"
  }
}

resource "docker_container" "backend" {
  name  = "backend"
  image = docker_image.backend_image.name 

  ports {
    internal = 3001
    external = 3001
  }


  command = ["node", "index.js"]

  networks_advanced {
    name = docker_network.app_network.name
  }

  depends_on = [docker_container.mongo]
}

resource "docker_image" "frontend_image" {
  name   = "frontend:latest"
  build {
    context    = "./frontend"
    dockerfile = "./frontend/Dockerfile"
  }
}

resource "docker_container" "frontend" {
  name  = "frontend"
  image = docker_image.frontend_image.name

  ports {
    internal = 5173
    external = 5173
  }

  command = ["npm", "run", "dev", "--", "--host", "0.0.0.0"]

  networks_advanced {
    name = docker_network.app_network.name
  }

  depends_on = [docker_container.backend]
}
