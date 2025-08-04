# Use an existing base image
FROM pengzhile/fuclaude:latest

# Set working directory
WORKDIR /data

# Expose the port inside the container
EXPOSE 8181

# Switch to root temporarily to change directory permissions
USER root 
# -R 表示递归地修改目录及其中所有文件的权限
# 将 /data 目录的所有权交给用户 10014 和组 10014
RUN chown -R 10014:10014 /data

# Switch back to the non-root user for security
USER 10014

# Specify the command to run your application
CMD ["./fuclaude"]
