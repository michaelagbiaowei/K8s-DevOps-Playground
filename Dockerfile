# Choose an authorized Node.js base image for your application as the build stage
FROM node:20-alpine3.17 AS build

LABEL apptainer="Michael Agbiaowei"
LABEL LinkedIn="https://www.linkedin.com/in/maiempire"
LABEL Last_Edited="18/09/2023"

# Set working directory for the build stage
ENV APP_HOME /opt/app
RUN mkdir ${APP_HOME}
WORKDIR ${APP_HOME}

# Copy the package.json and package-lock.json files from the current directory
# on the host machine to the working directory of the Docker image.
COPY ["package*.json", "${APP_HOME}"]

# Install the dependencies for the Node.js application inside the Docker container. 
# This command is typically used in the build stage of a Docker image to ensure that all the required 
# dependencies are installed before the application is run. 
# The npm install command reads the package.json file and installs all the dependencies listed in it. 
# Once the dependencies are installed, they are stored in the Docker image and can be used by the application when it is run.
RUN npm install

# Copy the rest of the application code to the working directory inside the Docker container excluding the files listed in the .dockerignore file
COPY [".", "${APP_HOME}"]

# Create a new build stage named base
FROM build AS base

# Set working directory for the final stage
WORKDIR ${APP_HOME}

# Expose the port your application will run on
EXPOSE 3000

# Define the command to run when the Docker container starts. 
# In this case, it runs the node command with app.js as the argument. 
# This means that when the Docker container starts, it will execute the app.js file using Node.js.
CMD ["node", "app.js"]
