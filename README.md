# Webhook Deploy

## Synopsis

An [Alpine Linux](https://hub.docker.com/_/alpine/) based image that can clone 
a Git repository and execute a custom setup script upon receiving webhooks.

In order to keep the image small and as close to the base image as possible,
no system-wide package is installed; Git and SSH clients are compiled, 
statically linked, and placed in their own directories.

## Environment Variables

The following environment variables must be set before starting the container

1. `SSH_PRIVATE_KEY`: a string containing the private key (in OpenSSH format) to
   access the Git repository
2. `GIT_REPO_URL`: Git repository URL
3. `GIT_REPO_BRANCH`: Git branch to checkout before running the setup script

In order to prevent unauthorized clients from triggering the webhook handler, 
one can set `WEBHOOK_AUTH_TOKEN` environment variable. The webhook receiver
server will only accept URL paths that end in `WEBHOOK_AUTH_TOKEN`.

## How it Works

Webhook receiver server listens on port 8000 and does the following upon 
receiving webhooks:

1. Clones the specified Git repository
2. Checks out the specified branch
3. Looks for **.webhook/setup** script within the cloned repository and 
   executes it

## Notes

1. Only SSH protocol is supported for cloning Git repositories
2. **.webhook/setup** script must have a shebang line (ex. `#!/bin/sh`)
3. Webhook receiver server will clone the repository to a temporary directory 
   and removes it after setup script is finished
4. Setup script will be executed relative to the repository directory
5. Nothing should be executed directly from the setup script's working directory
6. It's up to the setup script to compile/process and copy required files to 
   their correct location before the cloned repository directory gets removed
7. It's up to the setup script to start and track the state of services within
   the container
8. Setup script should not start any blocking foreground processes
9. It's highly recommended to use `nohup` to start background processes in setup 
   script

(Take a look at example directory for a working setup)

## License

[MIT](https://opensource.org/licenses/MIT)
