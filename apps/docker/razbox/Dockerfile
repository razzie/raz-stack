FROM alpine/git as downloader
WORKDIR /workspace
RUN git clone https://github.com/razzie/razbox.git .
RUN echo 'go build -mod=vendor -ldflags="-s -w -X main.version=`git describe --tags`" -o app ./cmd/razbox' > build.sh
RUN chmod +x build.sh

FROM golang:1.18 as builder
WORKDIR /workspace
COPY --from=downloader /workspace .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 ./build.sh

FROM alpine
RUN apk add --no-cache ffmpeg p7zip
WORKDIR /
COPY --from=builder /workspace/app .
RUN echo "#!/bin/sh" > start.sh
RUN echo "/app -redis \$REDIS_ADDR \$@" >> start.sh
RUN chmod +x start.sh
#USER 65532:65532
ENTRYPOINT ["/start.sh"]
