---
title: "E2 Interface"
draft: false
---

This is how a website communicates with the payment gateway with E2 interface. When using the form interface, the payment data is created as a form on the website. The consumer sends this form to the payment service. The payment is then completed in the browser as an immediate result of the customer's actions.

{{< figure src="/images/form-interface.svg" alt="Creating a Payment via the Form Interface" >}}

## Supported Libraries

We maintain open-source libraries to facilitate integrating to our E2 interface. These libraries are licensed with the permissive **MIT** license. If you encounter any problems using the package, please report them to us in GitHub. You can also participate in the package development by submitting us pull requests.

If you would rather build your own integration, see the chapters in this section for more details.

### PHP

Composer package `paytrail/e2-module` helps you to embed Paytrail E2 form on your dynamically rendered website using the **Symfony** or **Laravel** frameworks, for example. You can import the package to your project like so:

```sh
composer require paytrail/e2-module
```

The package requires **PHP 7.2** or newer. The detailed documentation is available on [**GitHub**][e2-gh] and [**Packagist**][e2-packagist].

### JavaScript

React package `@paytrail/react-paytrail-e2` outputs a component wrapping the `<form>` element used for E2 interface payments. The detailed documentation is available on [**GitHub**][e2-react] and [**NPM**][e2-npm].

You can import the package to your project with NPM or Yarn like so:

```sh
# Yarn
yarn add @paytrail/react-paytrail-e2

# NPM
npm install --save @paytrail/react-paytrail-e2
```

[e2-gh]: https://github.com/paytrail/e2-module
[e2-packagist]: https://packagist.org/packages/paytrail/e2-module
[e2-react]: https://github.com/paytrail/react-paytrail-e2
[e2-npm]: https://www.npmjs.com/package/@paytrail/react-paytrail-e2
