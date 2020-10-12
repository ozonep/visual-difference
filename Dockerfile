FROM alpine:3 as builder

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" > /etc/apk/repositories \
        && echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
        && echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
        && echo "http://dl-cdn.alpinelinux.org/alpine/v3.12/main" >> /etc/apk/repositories \
        && apk upgrade -U -a \
        && apk add bash make gcc g++ \
        && rm -rf /var/cache/* \
        && mkdir /var/cache/apk

COPY /flip/. /flip
WORKDIR /flip
RUN g++ FLIP.cpp -o flip -static


FROM alpine:3

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" > /etc/apk/repositories \
        && echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
        && echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
        && echo "http://dl-cdn.alpinelinux.org/alpine/v3.12/main" >> /etc/apk/repositories \
        && apk upgrade -U -a \
        && apk add dssim \
        && rm -rf /var/cache/* \
        && mkdir /var/cache/apk

COPY --from=builder /flip/flip /usr/bin/flip
CMD ["/bin/sh"]
