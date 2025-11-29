FROM debian:stable-slim

RUN apt-get update \
    && apt-get install -y wget ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Скачиваем рабочий бинарник Shadow-TLS v0.2.25
RUN wget https://github.com/ihciah/shadow-tls/releases/download/v0.2.25/shadow-tls-x86_64-unknown-linux-musl \
    -O shadowtls && chmod +x shadowtls

CMD ["./shadowtls", \
     "-proxy", "0.0.0.0:4443", \
     "-sni", "www.microsoft.com", \
     "-password", "supersecret123", \
     "-v3"]
