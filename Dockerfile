# Use an existing base image
FROM pengzhile/fuclaude:latest

# Set working directory
WORKDIR /data

# Set environment variables to avoid file system writes
ENV CONFIG_PATH=/tmp/config.json
ENV LOG_PATH=/tmp/fuclaude.log
ENV DATA_PATH=/tmp/fuclaude-data
ENV DISABLE_CONFIG_WRITE=true

# Create necessary directories with proper permissions
RUN mkdir -p /tmp/fuclaude-data && \
    touch /tmp/config.json && \
    chown -R 10014:10014 /tmp/config.json /tmp/fuclaude-data

# Expose the port inside the container
EXPOSE 8181

# Switch to non-root user
USER 10014

# Specify the command to run your application
CMD ["./fuclaude"]
