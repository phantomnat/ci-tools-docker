FROM alpine:3.13

COPY src/ /
RUN apk add --no-cache bash curl \
  && chmod +x /install.sh /entrypoint.sh \
  && /install.sh

ENTRYPOINT ["/entrypoint.sh"]
