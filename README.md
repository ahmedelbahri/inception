# Inception

**Inception** is a project that involves building a Docker containerized application based on the 42 network's specific requirements. The goal of this project is to familiarize students with Docker, containerization, and managing services with configuration files. The project ensures that the student understands how to create an environment that mimics a production setup using Docker containers.

---

## About

The **Inception** project revolves around creating a working infrastructure for a project using Docker and Docker Compose. It involves setting up a system where various services like a web server, database, and other services run in isolated containers. The purpose is to allow students to understand how to manage multi-container applications, configure a server environment, and ensure the application runs smoothly in a containerized environment.

### Core Requirements:
- Set up Docker containers for different services.
- Use **Docker Compose** to orchestrate the containers.
- Create a configuration file to ensure the environment is properly set up.
- Ensure that all the containers are linked together and can communicate with each other.

---

## Installation

To install and set up **Inception**, follow these steps:

1. Clone the repository:
    ```bash
    git clone https://github.com/ahmedelbahri/inception.git
    cd inception
    ```

2. Build the Docker containers using Docker Compose:
    ```bash
    docker-compose up --build
    ```

3. To stop and remove the containers:
    ```bash
    docker-compose down
    ```

4. To rebuild and start the containers after making changes:
    ```bash
    docker-compose up --build
    ```

---

## Usage

To test the setup, run the following command to start the containers with the required configuration:

```bash
docker-compose up
```

You can access the different services (e.g., web server, database) through the specified ports in the configuration.

## Bonus
The bonus section in Inception involves adding extra layers of complexity, including:

- Multiple Services: Adding additional services like a reverse proxy (e.g., NGINX) to handle routing between containers.
- Persistent Volumes: Ensuring that data in the database or other services persists across container restarts.
- Network Configuration: Fine-tuning the network configuration to allow specific services to communicate with one another while isolating others.
- To test the bonus features, ensure that the services are set up with the additional configurations and monitor how they interact in the containerized environment.
