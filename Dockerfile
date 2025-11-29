FROM debian:stable-slim

RUN apt update && apt install -y wget && rm -rf /var/lib/apt/lists/*
WORKDIR /app

RUN wget https://github.com/ihciah/shadow-tls/releases/download/v0.3.3/shadow-tls-x86_64-unknown-linux-gnu \
    -O shadowtls && chmod +x shadowtls

CMD ["./shadowtls", 
     "-proxy", "0.0.0.0:4443",
     "-sni", "www.microsoft.com",
     "-password", "supersecret123",
     "-v3"]
