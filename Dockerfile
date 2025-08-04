# Use an existing base image
FROM pengzhile/fuclaude:latest

# Set working directory
WORKDIR /data

# Create writable directories in /tmp (which is usually writable)
RUN mkdir -p /tmp/fuclaude-data && \
    mkdir -p /tmp/fuclaude-config && \
    chown -R 10014:10014 /tmp/fuclaude-data /tmp/fuclaude-config

# Copy any necessary files and set permissions
# If there's a default config, copy it to the writable location
RUN if [ -f "/data/config.json" ]; then \
        cp /data/config.json /tmp/fuclaude-config/config.json && \
        chown 10014:10014 /tmp/fuclaude-config/config.json; \
    else \
        touch /tmp/fuclaude-config/config.json && \
        chown 10014:10014 /tmp/fuclaude-config/config.json; \
    fi

# Create a symbolic link or set environment variable
RUN ln -sf /tmp/fuclaude-config/config.json /data/config.json || true

# Set environment variables to point to writable locations
ENV CONFIG_PATH=/tmp/fuclaude-config/config.json
ENV DATA_PATH=/tmp/fuclaude-data

# Expose the port inside the container
EXPOSE 8181

# Switch to non-root user
USER 10014

# Specify the command to run your application
CMD ["./fuclaude"]
