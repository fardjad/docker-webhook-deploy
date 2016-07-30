# Webhook Deploy

## Synopsis

An Alpine Linux based image that can clone a Git repository and execute a 
custom setup script upon receiving webhooks.

In order to keep the image small and as close to the base image as possible,
no system-wide package is installed; Git and SSH clients are compiled, 
statically linked, and placed in their own directories.

## Environment Variables

The following environment variables must be set before starting the container

1. `SSH_PRIVATE_KEY`: a string containing the private key (in OpenSSH format) to access the Git repository
2. `GIT_REPO_URL Git`: repository URL
3. `GIT_REPO_BRANCH`: Git branch to checkout before running the setup script

In order to prevent unauthorized clients from triggering the webhook handler, 
one can set `WEBHOOK_AUTH_TOKEN` environment variable. The webhook handler 
server will only accept URL paths that end in `WEBHOOK_AUTH_TOKEN`.

## How it Works

Webhook handler server does the following when the container starts:

1. Clones the specified Git repository
2. Checks out the specified branch
3. Looks for **.webhook/setup** script within cloned repository and executes it if it exists
4. Listens on port *8000* and repeats steps 1 through 3 upon receiving webhooks

## Notes

1. Only SSH protocol is supported for cloning Git repositories
1. **.webhook/setup** script must have a shebang line (ex. `#!/bin/sh`)
2. It's up to the user to start and track the state of services within the container
3. Setup script should not run any blocking foreground process
4. It's highly recommended to use `nohup` to start background processes in setup script

## License

MIT
