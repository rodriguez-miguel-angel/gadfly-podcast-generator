FROM ubuntu:latest

# Update the package list and install python3, pip, and git 
# RUN apt-get update && apt-get install -y python3.10 python3-pip git 

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    git \
    python3-yaml

# Upgrade pip 
# RUN pip3 install --upgrade python3-pip 

# Install other dependencies 
# RUN pip3 install python3-yaml

# Set the virtual environment as the default Python environment 
# ENV PATH="/opt/venv/bin:$PATH"

COPY feed.py /usr/bin/feed.py

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]