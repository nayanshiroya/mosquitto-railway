# Use the specific Ubuntu version (Focal) required by QA
FROM ubuntu:20.04

# Install Mosquitto and its tools, which will bring in OpenSSL 1.1.1f
# This process is common for installing software on Debian/Ubuntu base images
RUN apt-get update && apt-get install -y \
    mosquitto \
    mosquitto-clients \
    openssl \
    && rm -rf /var/lib/apt/lists/*

# The Mosquitto executable is now installed at /usr/sbin/mosquitto

# Set the Mosquitto working directory and create data/log folders
RUN mkdir -p /mosquitto/config /mosquitto/data /mosquitto/log

# Copy config files, including the certificates, to the correct location
COPY ./config /mosquitto/config

# Set correct permissions
RUN chmod 600 /mosquitto/config/acl.txt
# Ensure mosquitto.conf is readable
RUN chmod 644 /mosquitto/config/mosquitto.conf

# Expose ports (remains correct)
EXPOSE 1883
EXPOSE 8883

# Define the command to run the broker when the container starts
CMD ["/usr/sbin/mosquitto", "-c", "/mosquitto/config/mosquitto.conf"]
