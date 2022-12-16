ARG TAG=latest
FROM nextcloud:$TAG

RUN set -ex; \
    \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        ffmpeg \
        vim \
    ; \
    rm -rf /var/lib/apt/lists/*;
