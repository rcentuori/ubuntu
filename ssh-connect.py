import subprocess

def run_command(command):
    process = subprocess.Popen(command, stdout=subprocess.PIPE, shell=True)
    output, error = process.communicate()

    if error:
        print(f"Error: {error}")
    else:
        print(output)

# SSH into the Docker container
ssh_command = "ssh -p 2222 ubuntu@localhost"
run_command(ssh_command)
