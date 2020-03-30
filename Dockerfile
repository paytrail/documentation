FROM registry.gitlab.com/pages/hugo/hugo_extended:latest AS build

RUN apk update && apk add --no-cache build-base git

WORKDIR /src
COPY . .
RUN make build

FROM nginx:1.17-alpine

COPY conf/nginx.conf /etc/nginx
COPY conf/default.conf /etc/nginx/conf.d
COPY --from=build /src/public/ /usr/share/nginx/html

RUN chown -R nginx:nginx /var/cache/nginx

USER nginx
EXPOSE 8080

HEALTHCHECK CMD wget -q -O /dev/null http://localhost:8080 || exit 1
