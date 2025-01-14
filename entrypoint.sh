#!/bin/bash

echo " ========== entrypoint.sh ========== "

git config --global user.name "${GITHUB_ACTOR}"
git config --global user.email "${INPUT_EMAIL}"
git config --global --add safe.directory /github/workspace



# python3 /usr/bin/feed.py

# Activate the virtual environment 
source /opt/venv/bin/activate

# Run the Python script
python /app/feed.py


git add -A && git commit -m "Update Feed"

git push --set-upstream origin main

echo " ========== entrypoint.sh ========== "