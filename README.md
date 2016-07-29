# WebHook Deploy

## Synopsis

Deploys an app from a Git repository into a Docker container

## Environment Variables

The following environment variables must be set before starting the container

    1. `SSH_PRIVATE_KEY` a string containing SSH private key to access the Git repository
    2. `GIT_REPO_URL` Git repository URL
    3. `GIT_REPO_BRANCH` Git branch to checkout before running the **setup** script

## How It Works

WebHook handler script does the following when the container starts:

    1. Clones the specified Git repository
    2. Checks out the specified branch
    3. Looks for **.webhook/setup** script within cloned repository and executes it if it exists
    4. Listens on port 8000 and repeats steps 1 through 3 upon receiving WebHooks

## Notes

    1. **.webhook/setup** script must have a shebang line (ex. `#!/bin/bash`)
    2. It's up to the user to start and track the state of desired services within the container via the setup script
    3. Setup script should not start any blocking process/job upon execution

## License

MIT
