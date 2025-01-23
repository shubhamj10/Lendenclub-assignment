# Login & Registration Form with MERN stack

## Description
A brief description of your project. For example:

This project is a full-stack web application built with React for the frontend, Node.js for the backend, and MongoDB for the database. Docker is used for containerization, and Terraform is used to automate infrastructure provisioning.

## Prerequisites

Before you begin, ensure you have the following installed:

- [Docker](https://www.docker.com/get-started)  
- [Terraform](https://www.terraform.io/downloads.html)  
- [Node.js](https://nodejs.org/) (for development purposes)  
- [Git](https://git-scm.com/) (for cloning the repository)

## Installation & Setup

## 1. Clone the repository

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

### 1.Initialize Terraform:
```
terraform init
```
### 2. Plan Terraform:
```
terraform plan
```
### 3. Apply the Terraform configuration to provision the infrastructure:
```
terraform apply
```
This will prompt you to approve changes. Type yes to apply.

