# Use a base image with Bash installed
FROM bash:latest

# Set the working directory inside the container
WORKDIR /app

# Copy the Bash script into the container
COPY your_script.sh /app/your_script.sh

# Install cowsay and fortune (and netcat, if necessary)
RUN apt-get update \
    && apt-get install -y cowsay fortune netcat \
    && rm -rf /var/lib/apt/lists/*

# Set execute permissions on the script
RUN chmod +x /app/your_script.sh

# Expose the port that your script is listening on
EXPOSE 4499

# Run the script when the container starts
CMD ["/app/your_script.sh"]
