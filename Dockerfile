# Use an existing base image
FROM pengzhile/fuclaude:latest

# Set the timezone (replace "Asia/Shanghai" with your desired timezone)
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Set environment variable
ENV FUCLAUDE_SIGNUP_ENABLED=true

# Create data directory and set permissions
RUN mkdir -p /data && chown 10014:10014 /data

# Set working directory
WORKDIR /data

# Expose the port inside the container
EXPOSE 8181

# Switch to non-root user
USER 10014

# Specify the command to run your application
CMD ["./fuclaude"]
