# docker-example

This is a sample project for the accompanying Intro to Docker presentation for OUSDC.

The provided instructions are for Debian-based distros (tested on Ubuntu).

## Setup
0. Clone this repo
1. Install docker-compose & and the build plugin
```bash
sudo apt install docker-compose docker-buildx
```
2. Create `docker-compose.yml`
```yml
# 'services' will define our services/containers
services:
  # Define the 'web-app' service/container
  web-app:
    # 'build' tells docker the directory (context) and path the Dockerfile (dockerfile)
    build:
      context: .
      dockerfile: Dockerfile
      network: host # 'network' set to host because WSL has network issues otherwise
    # 'ports' defines the 'external:internal' network ports for the container
    ports:
      - 3000:3000
```
3. Create `Dockerfile`
```Dockerfile
# 'FROM' chooses the base image for the container (Node.js image)
FROM node:latest

# 'WORDIR' creates a directory for all the future commands to execute from
WORKDIR /app

# 'EXPOSE' defines an open network port in the container
EXPOSE 3000

# 'COPY' is copying all the files in the current directory to '/app' directory
# NOTE: COPY will ignore items listed in the .dockerignore file
COPY . .

# 'RUN' executes commands inside the container during the build process
RUN npm install

# 'CMD' defines the command to run when the container is started
CMD ["npm", "start"]
```
4. Create `.dockerignore`
```plaintext
# Docker
docker-compose.yml
Dockerfile
.dockerignore

# Git
.gitignore
.git

# NPM packages
node_modules

# Misc. non-code files
*.md
```
5. Build the image using `sudo docker-compose build`
6. Run it with `sudo docker-compose up`

## Useful Docker Commands
| Command                               | Description                                                       |
|---------------------------------------|-------------------------------------------------------------------|
| `docker-compose build`                | Create a container image from `docker-compose.yml` & `Dockerfile` |
| `docker-compose up`                   | Create and start containers as defined in `docker-compose.yml`.   |
| `docker-compose down`                 | Tear down and remove containers, networks, and volumes.           |
| `docker-compose ps --all`             | Show all containers, including stopped ones.                      |
| `docker-compose ps --services`        | Display all services defined in `docker-compose.yml`.             |
| `docker-compose start <service-name>` | Start a stopped service.                                          |
| `docker-compose stop <service-name>`  | Stop a running service.                                           |
