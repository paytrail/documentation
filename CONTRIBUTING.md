# How to Contribute

> **IMPORTANT:** Before contributing to this project, read and agree with our [code of conduct](CODE_OF_CONDUCT.md).

## Building the Project

To build the project locally, you either need **Hugo** or **Docker** to be installed. In this section, we document the Docker usage. If necessary, read the official [Hugo documentation][hugodocs] for getting started without Docker.

Fork and clone the project from GitHub. Current theme is included in the project as a sub-module which must be fetched as well.

```sh
# Replace the <USERNAME> with your GitHub account name after forking.
git clone git@github.com:<USERNAME>/documentation.git
cd documentation && git submodule update --init --recursive --remote
```

Project is bundled with `Dockerfile` and `docker-compose.yml` for building it without dependencies.

To build the image and launch a development container:

```sh
docker-compose up --build -d
open http://localhost:1313
```

To build a _production-like_ image and launch an **nginx** server serving the static content:

```sh
docker build -t paytrail/documentation .
docker run --rm -dit --name hugo-nginx -p 8080:80 paytrail/documentation:latest
open http://localhost:8080
```

Documentation is placed in the `content/` subdirectory. Modify it, check the results from browser, and open a new pull request for the maintainers.

## Deploying

For previewing the changes in a public network, you can create a test deployment to [**Netlify**][netlify].

1. Install Netlify's CLI tool with `brew install netlify-cli`
2. In project root, run `make deploy-staging` to preview changes in a staging environment
3. In project root, run `make deploy-prod` to publish changes to production

[hugodocs]: https://gohugo.io/getting-started/
[netlify]: https://app.netlify.com/
