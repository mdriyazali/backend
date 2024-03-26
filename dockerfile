# Use an official Node.js runtime as a base image
FROM node:20.11 AS backend
# Set the working directory for the backend
WORKDIR /root/app/backend
# Copy package.json and package-lock.json to install dependencies
COPY package*.json ./
# Install backend dependencies
RUN yarn
# Copy the backend source code to the container
COPY . .

ENV NODE_ENV=local
# Expose the port on which the backend will run
EXPOSE 5000
# Command to start the backend
CMD yarn migrate; \
    yarn start;
