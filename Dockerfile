FROM alpine:3.5

ENV SSR_URL https://github.com/shadowsocksr/shadowsocksr/archive/manyuser.zip
ENV SERVER_ADDR 0.0.0.0
ENV SERVER_PORT 80
ENV PASSWORD S9fg8#6dfsD
ENV METHOD chacha20-ietf
ENV PROTOCOL auth_aes128_md5
ENV OBFS tls1.2_ticket_auth

RUN set -ex \
    && apk --update add --no-cache libsodium py-pip \
    && pip --no-cache-dir install $SSR_URL \
    && rm -rf /var/cache/apk

WORKDIR /usr/bin/

ENTRYPOINT [ "ssserver" ]
CMD [ "-s", "$SERVER_ADDR", "-p", "$SERVER_PORT", "-k", "$PASSWORD", "-m", "$METHOD", "-o", "$OBFS", "-O", "$PROTOCOL" ]
