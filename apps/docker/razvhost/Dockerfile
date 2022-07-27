FROM alpine/git as downloader
WORKDIR /workspace
RUN git clone https://github.com/razzie/razvhost.git .
RUN echo 'go build -mod=vendor -ldflags="-s -w -X main.version=`git describe --tags`" -o app ./cmd/razvhost' > build.sh
RUN chmod +x build.sh

FROM golang:1.18 as builder
WORKDIR /workspace
COPY --from=downloader /workspace .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 ./build.sh

FROM alpine
WORKDIR /
COPY --from=builder /workspace/app .
ENTRYPOINT ["/app"]
