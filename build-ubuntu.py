import subprocess

def run_command(command):
    process = subprocess.Popen(command, stdout=subprocess.PIPE, shell=True)
    output, error = process.communicate()

    if error:
        print(f"Error: {error}")
    else:
        print(output)

# Stop and remove the Docker container if it exists
docker_stop_command = "docker stop ubuntu || true"
run_command(docker_stop_command)

docker_rm_command = "docker rm ubuntu || true"
run_command(docker_rm_command)

# Remove the Docker image if it exists
docker_rmi_command = "docker rmi ubuntu || true"
run_command(docker_rmi_command)

# Build the Docker image
docker_build_command = "docker build -t ubuntu ."
run_command(docker_build_command)

# Run the Docker container in the background and mount ~/ubuntu to /home/ubuntu in the container
docker_run_command = "docker run -d -p 2222:22 -v ~/ubuntu:/home/ubuntu --name ubuntu ubuntu"
run_command(docker_run_command)
