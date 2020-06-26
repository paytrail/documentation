# How to Contribute

> **IMPORTANT:** Before contributing to this project, read and agree with our [code of conduct](CODE_OF_CONDUCT.md).

* [How to Contribute](#how-to-contribute)
  * [Building the Project](#building-the-project)
  * [Creating and Modifying the Content](#creating-and-modifying-the-content)
    * [Structure](#structure)
    * [Pages](#pages)
    * [Assets](#assets)
    * [YAML Headers](#yaml-headers)
    * [Formatting](#formatting)
    * [Search](#search)
  * [Submitting a Pull Request](#submitting-a-pull-request)

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
docker run --rm -dit --name hugo-nginx -p 8080:8080 paytrail/documentation:latest
open http://localhost:8080
```

## Creating and Modifying the Content

### Structure

Documentation pages are placed in the `content/` subdirectory as Markdown (`*.md`) files. The URL structure mimics the directory paths, so for example [E2 interface validation guide][e2-validation] is found under `content/payments/e2-interface/validation.md`.

To create a new page, either use the `hugo new` command within the Docker container or create the file manually.

### Pages

Hugo [content sections][content] assume the page markdown is either in the directory index file or a standalone Markdown file. You can either create a `/section/_index.md` file or `/section.md` file directly. We recommend using index files as top-level pages and the rest as their child pages.

Besides standard pages, selected pages may appear as _root pages_ on the main page with a title, icon, and short description.

### Assets

Static assets like images should be placed under the `static/` directory. The build will copy these files to the site root. In production these are served from a fast CDN (e.g. Netlify uses Amazon CloudFront).

### YAML Headers

Each page should contain a valid YAML metadata block or header which looks like this:

```yaml
# Standard Page
title: My Cool Page
draft: false
weight: 1

# Root page
title: "Frequently Asked Questions"
description: "Ask anything from us!"
icon: "ti-credit-card"
draft: false
type: docs
weight: 5
```

The following YAML keys are supported.

- `title` – title shown for each page with a HTML header tag
- `description` – description shown in the main page under the icon
- `icon` – a valid [Themify][themify] icon code shown in the main page
- `draft` – value `true` ensures the page is not visible in the production build (for convenience, the page is visible when developing locally and in pull request preview deployments)
- `type` – when set to `docs` the page is displayed on the main page as a box with title, icon, and description
- `weight` – defines the order of pages in the page tree, lower weight ranks the page higher

### Formatting

Hugo supports [shortcodes][shortcodes] which you can use to enhance your Markdown in addition to standard syntax. The included theme may also provide their own shortcodes which you should get familiar with. Hugo documentation has more information about creating your own shortcodes if necessary.

**Example Shortcodes**

Shortcodes are wrapped in double curly braces and `<>`. Hugo parses these when building the site and displays an error in the browser if the used shortcode can't be parsed.

For example, you can create Markdown links like so:

```md
[Neat]({{< ref "blog/neat.md" >}})
[Who]({{< relref "about.md#who" >}})
```

Another use case for shortcodes is placing images (figures) on the page like so:

```md
{{< figure src="/images/awesome.png" alt="Paytrail is Awesome" width="75%" >}
```

The `figure` shortcode accepts width and height as parameters which can be adjusted to align the figure with the content.

### Search

The main page includes a dynamic search widget which queries pages from an index. The index is constructed on build and favours keywords found in the content body. We recommend thinking one or more essential keywords which visitors could use while searching the content and adding these to the Markdown.

## Submitting a Pull Request

Whenever a new pull request is opened to this repository, Netlify creates a preview deployment from it. In addition to general build errors, Netlify checks for header rules, mixed content (HTTPS referencing HTTP), and redirect errors. Before handing the pull request over for a review make sure all the checks pass. Reviewers use the preview deployment to judge if changes should be integrated to the site.

The production site mirrors the **master** branch and there are no special release branches or tags for this.

[hugodocs]: https://gohugo.io/getting-started/
[netlify]: https://app.netlify.com/
[e2-validation]: https://docs.paytrail.com/payments/e2-interface/validation/
[content]: https://gohugo.io/content-management/organization/
[shortcodes]: https://gohugo.io/content-management/shortcodes/
[themify]: https://themify.me/themify-icons
