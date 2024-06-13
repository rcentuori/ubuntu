Sure, here's a README file for your project:
# Docker Ubuntu Setup with SSH Connection

This project sets up a Docker container with Ubuntu and allows SSH connection to it. The project consists of three main files:

1. `Dockerfile`: This file contains the instructions to build the Docker image with Ubuntu and necessary packages.
2. `build-ubuntu.py`: This Python script automates the process of stopping, removing, and building the Docker container.
3. `ssh-connect.py`: This Python script allows you to SSH into the running Docker container.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine.
Ensure:
- Python3 is installed
- Docker is installed on your machine and in vscode
- The local directory ~/ubuntu exists

### Prerequisites

- Docker
- Python

### Building the Docker Image

Run the `build-ubuntu.py` script to build the Docker image and start the container:

```bash
python3 build-ubuntu.py
```

This script will:

- Stop and remove the Docker container named 'ubuntu' if it exists.
- Remove the Docker image named 'ubuntu' if it exists.
- Build a new Docker image named 'ubuntu' using the Dockerfile.
- Run a new Docker container named 'ubuntu' in the background.

The Docker container runs an SSH server and exposes port 22 for SSH access.

### Connecting to the Docker Container

After the Docker container is running, you can SSH into it using the `ssh-connect.py` script:

```bash
python3 ssh-connect.py
```

This script will run the SSH command to connect to the Docker container at `localhost` on port `2222`.

## Built With

- [Docker](https://www.docker.com/)
- [Ubuntu](https://ubuntu.com/)
- [Python](https://www.python.org/)

## Authors

- Rafe Centuori

