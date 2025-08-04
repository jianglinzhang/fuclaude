# Use an existing base image
FROM pengzhile/fuclaude:latest

# Set working directory
WORKDIR /data

# Expose the port inside the container
EXPOSE 8181

# Switch to non-root user
USER 10014

# Specify the command to run your application
CMD ["./fuclaude"]
