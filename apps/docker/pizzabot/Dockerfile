FROM alpine/git as downloader
WORKDIR /workspace
RUN git clone https://github.com/razzie/pizzabot.git .

FROM golang:1.18 as builder
WORKDIR /workspace
COPY --from=downloader /workspace .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -mod vendor -ldflags="-s -w" -o app ./cmd/pizzabot

FROM alpine
WORKDIR /
COPY --from=builder /workspace/app .
RUN echo "#!/bin/sh" > start.sh
RUN echo "/app \$PIZZABOT_TOKEN" >> start.sh
RUN chmod +x start.sh
USER 65532:65532
CMD ["/start.sh"]
