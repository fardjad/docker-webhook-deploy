#!/bin/bash

cd "$1"

tmpfile=$(mktemp)
exec 5<>"$tmpfile"
rm "$tmpfile"
echo "$SSH_PRIVATE_KEY" >&5

ssh-agent /bin/bash -c "ssh-add /proc/$$/fd/5; git clone $GIT_REPO_URL ."
git checkout "$GIT_REPO_BRANCH"

if [ -f .webhook/setup ]; then
    chmod +x .webhook/setup
    .webhook/setup
fi

