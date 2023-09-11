# Use a lightweight node base image
FROM node:14-slim

# Set the working directory in docker
WORKDIR /usr/src/app

# Copy the dependencies file to the working directory
COPY package*.json ./

# Install any dependencies
RUN npm install docsify-cli -g

# Copy the content of the local src directory to the working directory
COPY . .

# Specify the command to run on container start
CMD [ "docsify", "serve", "." ]