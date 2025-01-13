FROM ubuntu:latest

# Update the package list and install python3, pip, and git 
# RUN apt-get update && apt-get install -y python3.10 python3-pip git 

RUN apt-get update && apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
    git \
    && rm -rf /var/lib/apt/lists/* # Clean up apt cache

# Upgrade pip 
# RUN pip3 install --upgrade python3-pip 

# Install other dependencies 
RUN pip3 install PyYAML


COPY feed.py /usr/bin/feed.py

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]