FROM alpine:latest AS build

LABEL description="Docker image for documentation made with Hugo static site generator."
LABEL maintainer="Paytrail <tekniikka@paytrail.com>"
FROM registry.gitlab.com/pages/hugo/hugo_extended:latest AS build

ARG HUGO_VERSION=latest
ENV HUGO_VERSION=${HUGO_VERSION}
RUN apk update && apk add --no-cache build-base git

RUN apk update \
    && apk add --no-cache build-base gcc gcc-doc abuild binutils binutils-doc ca-certificates libc6-compat libstdc++ git cmake cmake-doc extra-cmake-modules extra-cmake-modules-doc

RUN wget https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz -P /tmp/ \
    && tar -xf /tmp/hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz -C /tmp \
    && mv /tmp/hugo /usr/bin/hugo

WORKDIR /data
WORKDIR /src
COPY . .
RUN make build

FROM nginx:1.17-alpine

COPY conf/nginx.conf /etc/nginx
COPY conf/default.conf /etc/nginx/conf.d
COPY --from=build /data/public/ /usr/share/nginx/html
COPY --from=build /src/public/ /usr/share/nginx/html

RUN chown -R nginx:nginx /var/cache/nginx

USER nginx