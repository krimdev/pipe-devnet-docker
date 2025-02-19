FROM ubuntu:22.04

# Install CA certificates and dependencies
RUN apt-get update && apt-get install -y \
    ca-certificates \
    openssl \
    curl \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Create necessary directories
RUN mkdir -p download_cache

# Download the latest pop executable
RUN curl -L -o pop "https://dl.pipecdn.app/v0.2.8/pop" && \
    chmod +x pop

EXPOSE 80 443 8003

CMD ["./pop", "--ram", "4", "--max-disk", "100", "--cache-dir", "./download_cache", "--pubKey", "YOUR_PUBLIC_KEY", "--enable-80-443"]
