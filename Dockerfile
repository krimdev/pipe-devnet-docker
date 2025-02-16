    FROM ubuntu:22.04
    
    # Install required packages
    RUN apt-get update && apt-get install -y \
        curl \
        && rm -rf /var/lib/apt/lists/*
    
    # Create directories
    RUN mkdir -p /opt/pop /data
    
    # Set working directory
    WORKDIR /opt/pop
    
    # Download Pipe binary
    ARG POP_VERSION=v0.2.5
    RUN curl -L -o pop "https://dl.pipecdn.app/${POP_VERSION}/pop" \
        && chmod +x pop
    
    # Expose required port
    EXPOSE 8003
    
    # Set entrypoint
    ENTRYPOINT ["./pop"]
    CMD ["--ram=${RAM_SIZE}", "--pubKey=${SOLANA_WALLET}", "--max-disk=${DISK_SIZE}", "--cache-dir=${CACHE_DIR}"]
    