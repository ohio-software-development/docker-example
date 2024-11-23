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
