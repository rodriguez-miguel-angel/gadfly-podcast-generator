FROM ubuntu:latest

# Update the package list and install python3, pip, and git 
# RUN apt-get update && apt-get install -y python3.10 python3-pip git 

RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    python3-venv \
    git
    
# Upgrade pip 
# RUN pip3 install --upgrade python3-pip 

# Install other dependencies 
# RUN pip3 install PyYAML

# Set the virtual environment as the default Python environment 
# ENV PATH="/opt/venv/bin:$PATH"

# Create a virtual environment 
RUN python3 -m venv /opt/venv 
# Activate the virtual environment and install PyYAML 
RUN /opt/venv/bin/pip install PyYAML 
# Set the virtual environment as the default Python environment 
ENV PATH="/opt/venv/bin:$PATH"

COPY feed.py /usr/bin/feed.py

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]