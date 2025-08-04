# Use an existing base image
FROM pengzhile/fuclaude:latest

# Set working directory
WORKDIR /tmp

# Expose the port inside the container
EXPOSE 8181

# Switch back to the non-root user for security
USER 10014

# Specify the command to run your application
CMD ["./fuclaude"]
