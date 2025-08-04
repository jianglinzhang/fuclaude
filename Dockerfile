# Use an existing base image
FROM pengzhile/fuclaude:latest

# Set the timezone (replace "Asia/Shanghai" with your desired timezone)
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Create data directory and set permissions
RUN mkdir -p /data && chown 10014:10014 /data

# Set environment variable
ENV FUCLAUDE_SIGNUP_ENABLED=true


# Create config.json file with the specified content
RUN echo '{ \
  "bind": "[::]:8181", \
  "timeout": 600, \
  "proxy_url": "", \
  "real_logout": false, \
  "cookie_secret": "1234567890abcdefghijklmnopqrstuv", \
  "openai_base_url": "https://moderations.shellten.top/v1", \
  "openai_api_key": "sk-xxx", \
  "moderation_enabled": false , \
  "show_session_key": true \
}' > /data/config.json



# Set working directory
WORKDIR /data

# Expose the port inside the container
EXPOSE 8181

# Switch to non-root user
USER 10014

# Specify the command to run your application
CMD ["./fuclaude"]
