FROM alpine:latest
RUN apk add --no-cache wget
WORKDIR /app

RUN wget https://github.com/ihciah/shadow-tls/releases/download/v0.3.3/shadow-tls-x86_64-unknown-linux-musl \
    -O shadowtls && chmod +x shadowtls

CMD ["./shadowtls",
     "-proxy", "0.0.0.0:4443",
     "-sni", "www.microsoft.com",
     "-password", "supersecret123",
     "-v3"]
