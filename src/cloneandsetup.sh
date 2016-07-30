#!/bin/sh

cd "$1"
SSH_GIT="/opt/webhook-deploy/sshhelper.sh" /opt/git-static/bin/git clone -b "$GIT_REPO_BRANCH" --single-branch "$GIT_REPO_URL" .

if [ ! $? -eq 0 ] || [ ! -d .git ]; then
    >&2 echo "Could not clone the repository"
    exit 1
fi

if [ -f .webhook/setup ]; then
    chmod +x .webhook/setup
    .webhook/setup
fi

