FROM alpine:latest

RUN apk add --no-cache ca-certificates unzip wget

WORKDIR /app

RUN wget https://github.com/pocketbase/pocketbase/releases/download/v0.22.9/pocketbase_0.22.9_linux_amd64.zip && \
    unzip pocketbase_0.22.9_linux_amd64.zip && \
    rm pocketbase_0.22.9_linux_amd64.zip && \
    chmod +x pocketbase

EXPOSE 8090

CMD ["./pocketbase", "serve", "--http=0.0.0.0:8090"]