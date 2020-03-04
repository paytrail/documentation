# Paytrail Integration Guide

This repository holds the source code for the Paytrail integration guide.

## Building

To build the project locally, you either need _Hugo_ or _Docker_ to be installed. In this section, we document the Docker usage. If necessary, read the official [Hugo documentation][hugodocs] for getting started without Docker.

Project is bundled with `Dockerfile` and `docker-compose.yml` for building it without dependencies.

To build the image and launch a development container:

```sh
docker-compose up --build -d
open http://localhost:1313
```

To build a _production-like_ image and launch an _nginx_ server:

```sh
docker build -t paytrail/documentation .
docker run --rm -dit --name hugo-nginx -p 8080:80 paytrail/documentation:latest
open http://localhost:8080
```

## Contributing

Documentation is placed in the `content/` subdirectory. Modify it, check the results from browser, and open a new pull request for the maintainers.

[hugodocs]: https://gohugo.io/getting-started/
