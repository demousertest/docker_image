

# Use an appropriate base image (e.g., Ubuntu)
FROM ubuntu:latest
FROM python:3

# Set the working directory
WORKDIR /C:/Users/Hemant Mahawer-3348/Desktop/dockerfile



# Clone the repository
RUN  git clone   https://github.com/demousertest/docker_image.git

# Change the working directory to the cloned repository
WORKDIR /C:/Users/Hemant Mahawer-3348/Desktop/dockerfile/docker_image


# Specify the command to run when the container starts
CMD ["python", "reverse.py"]
