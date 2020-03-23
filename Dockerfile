FROM alpine:3.11 AS build

LABEL description="Docker image for documentation made with Hugo static site generator."
LABEL maintainer="Paytrail <tekniikka@paytrail.com>"

ARG HUGO_VERSION=0.68.1
ENV HUGO_VERSION=${HUGO_VERSION}

RUN apk update \
    && apk add --no-cache build-base gcc gcc-doc abuild binutils binutils-doc ca-certificates libc6-compat libstdc++ git cmake cmake-doc extra-cmake-modules extra-cmake-modules-doc

RUN wget https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz -P /tmp/ \
    && tar -xf /tmp/hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz -C /tmp \
    && mv /tmp/hugo /usr/bin/hugo

WORKDIR /data
COPY . .
RUN make build

FROM nginx:1.17-alpine

COPY conf/nginx.conf /etc/nginx
COPY conf/default.conf /etc/nginx/conf.d
COPY --from=build /data/public/ /usr/share/nginx/html

USER nginx
EXPOSE 8080

HEALTHCHECK CMD wget -q -O /dev/null http://localhost:8080 || exit 1
