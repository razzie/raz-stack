ARG TAG=latest
FROM nextcloud:$TAG

RUN set -ex; \
    apt-get update; \
    apt-get install -y --no-install-recommends ffmpeg ghostscript vim; \
    rm -rf /var/lib/apt/lists/*;

RUN sed -i 's/\(^ *<policy.*rights="\)\([^"]*\)\(".*PDF.*\/>\)/\1read|write\3/1' \
    /etc/ImageMagick-6/policy.xml
