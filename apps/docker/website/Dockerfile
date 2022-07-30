FROM alpine/git as downloader
WORKDIR /workspace
RUN git clone https://github.com/razzie/gorzsony.com.git .

FROM golang:1.18 as builder
WORKDIR /workspace
COPY --from=downloader /workspace .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -mod vendor -ldflags="-s -w" -o app ./cmd/razweb

FROM alpine
WORKDIR /
COPY --from=builder /workspace/app .
USER 65532:65532
CMD ["/app"]
