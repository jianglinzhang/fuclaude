# Use an existing base image
FROM pengzhile/fuclaude:latest

# Set working directory
WORKDIR /data

# Create a startup script
RUN echo '#!/bin/sh' > /tmp/start.sh && \
    echo 'mkdir -p /tmp/fuclaude-config' >> /tmp/start.sh && \
    echo 'mkdir -p /tmp/fuclaude-data' >> /tmp/start.sh && \
    echo '# Copy default config if it exists' >> /tmp/start.sh && \
    echo 'if [ -f "/data/config.json" ] && [ ! -f "/tmp/fuclaude-config/config.json" ]; then' >> /tmp/start.sh && \
    echo '    cp /data/config.json /tmp/fuclaude-config/config.json' >> /tmp/start.sh && \
    echo 'fi' >> /tmp/start.sh && \
    echo '# Create empty config if none exists' >> /tmp/start.sh && \
    echo 'if [ ! -f "/tmp/fuclaude-config/config.json" ]; then' >> /tmp/start.sh && \
    echo '    echo "{}" > /tmp/fuclaude-config/config.json' >> /tmp/start.sh && \
    echo 'fi' >> /tmp/start.sh && \
    echo '# Create symlink or set environment' >> /tmp/start.sh && \
    echo 'export CONFIG_PATH=/tmp/fuclaude-config/config.json' >> /tmp/start.sh && \
    echo 'cd /data' >> /tmp/start.sh && \
    echo 'exec ./fuclaude' >> /tmp/start.sh && \
    chmod +x /tmp/start.sh && \
    chown 10014:10014 /tmp/start.sh

# Expose the port inside the container
EXPOSE 8181

# Switch to non-root user  
USER 10014

# Use the startup script
CMD ["/tmp/start.sh"]
