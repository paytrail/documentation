FROM alpine:3.11 AS build

LABEL description="Docker image for documentation made with Hugo static site generator."
LABEL maintainer="Paytrail <tekniikka@paytrail.com>"

ARG HUGO_VERSION=0.66.0
ENV HUGO_VERSION=${HUGO_VERSION}

RUN apk update \
    && apk add --no-cache ca-certificates libc6-compat libstdc++ git

RUN wget https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz -P /tmp/ \
    && tar -xf /tmp/hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz -C /tmp \
    && mv /tmp/hugo /usr/bin/hugo

WORKDIR /data
COPY . .
RUN hugo

FROM nginx:1.17-alpine

COPY --from=build /data/public/ /usr/share/nginx/html
