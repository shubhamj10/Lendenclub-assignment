# Login & Registration Form with MERN stack

## Description
This project is a full-stack web application built with the **MERN** stack:

- **React** for the frontend
- **Node.js** for the backend
- **MongoDB** for the database

The project also uses **Docker** for containerization and **Terraform** for automating infrastructure provisioning. The application allows users to register, log in, and manage their sessions.

---

## Prerequisites

Before you begin, ensure you have the following installed:

- [Docker](https://www.docker.com/get-started)
- [Terraform](https://www.terraform.io/downloads.html)
- [Node.js](https://nodejs.org/) (for development purposes)
- [Git](https://git-scm.com/) (for cloning the repository)

---

## Installation & Setup

### 1. Clone the Repository

Clone the repository to your local machine:

```bash
git clone https://github.com/shubhamj10/Lendenclub-assignment
cd Lendenclub-assignment
```

## 2.Docker Setup
 ### Build the Docker images
 You can build the Docker images for both the React frontend, Node.js backend, and MongoDB by running:
 ```
docker-compose build
```

### Run the containers
 run the Docker containers using:
 ```
docker-compose up
```
This will start up the services.
Your application will be available at http://localhost:5173

## 3. Terraform Setup 

#### 1. Initialize Terraform:
```
terraform init
```
#### 2. Plan Terraform:
```
terraform plan
```
#### 3. Apply the Terraform configuration to provision the infrastructure:
```
terraform apply
```
This will prompt you to approve changes. Type yes to apply.

## 4.Deployment Steps

#### 1. Build the Docker images for production
```
docker build -t username/reponame .
```
#### 2. Push Docker images to a container registry(Docker Hub)
```
docker push username/reponame
```
#### 3. Provision cloud infrastructure using Terraform
```
terraform apply
```

## 5. Monitoring Instructions 
To monitor the application:

#### 1. Docker Logs
Monitor the logs for your containers:
```
docker-compose logs -f
```

#### 2. Check Container Health
Check if the containers are running correctly:
```
docker ps --a
```

#### 3. Monitor all running containers
```
docker stats
```

