---
title: "Rest Interface"
draft: false
weight: 5
---

### Description

Paytrail payment REST interface can be used to create a payment with a server-to-server request and thus limits usage less than the form interface. With the REST interface, the payment is created in advance by sending payment data as an _XML_ or _JSON_ message over _HTTPS_. Service returns the response message in the corresponding format.

{{% notice warning %}}REST interface does not support payment page bypass.{{% /notice %}}

We offer a PHP package for creating payments with the REST interface easily. You can import the package to your project with **Composer** like so:

```sh
composer require paytrail/rest-module
```

The package requires **PHP 7.2** or newer. The detailed documentation is available on [**GitHub**][rest-gh] and [**Packagist**][rest-packagist].

If you encounter any problems using the package don't hesitate reporting them to us in GitHub. You can also participate in the package development by submitting us pull requests.

### Usage

When using the form interface the payment data is sent from a customer's browser to Paytrail service, but when using the REST interface customer's server sends the payment data to Paytrail service in _XML_ or _JSON_ format. The response message is returned in the same format.

When using the REST interface, the data that is sent to the payment service must always be UTF-8 encoded.

{{< figure src="/images/rest-interface.svg" alt="Creating a Payment via the REST interface" >}}

When using the REST service, always include the following headers:

**Content-Type**

Sent message type. The message can be sent either in XML or JSON format. Corresponding types are `application/xml` and `application/json`.

**X-Verkkomaksut-Api-Version**

Interface version. The current REST interface version is `1`. Each request sent to the interface must be verified with Basic authentication (Authorization header). Basic authentication sends the Merchant ID as a username and the Merchant secret as a password.

### Receiving the Payment Receipt

Payment receipt handling has been documented [**here**][receipt].

[receipt]: {{< ref "legacy/receipts" >}}

[rest-gh]: https://github.com/paytrail/rest-module
[rest-packagist]: https://packagist.org/packages/paytrail/rest-module
