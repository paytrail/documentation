---
title: "Rest Interface"
draft: false
weight: 5
---

{{% notice note %}}REST interface does not support payment page bypass.{{% /notice %}}

Paytrail payment REST interface can be used to create a payment with a server-to-server request and thus limits usage less than the form interface. With the REST interface, the payment is created in advance by sending payment data as an _XML_ or _JSON_ message over _HTTPS_. Service returns the response message in the corresponding format.

We provide a PHP class that implements this interface. The interface is described more closely in the following chapters.

When using the form interface the payment data is sent from a customer's browser to Paytrail service, but when using the REST interface customer's server sends the payment data to Paytrail service in _XML_ or _JSON_ format. The response message is returned in the same format.

When using the REST interface, the data that is sent to the payment service must always be UTF-8 encoded.

{{< figure src="payment-json-en.png" title="Payment creation with the REST interface" alt="Payment creation with the REST interface" >}}

When using the REST service, always include the following headers:

**Content-Type**

Sent message type. The message can be sent either in XML or JSON format. Corresponding types are `application/xml` and `application/json`.

**X-Verkkomaksut-Api-Version**

Interface version. The current REST interface version is `1`. Each request sent to the interface must be verified with Basic authentication (Authorization header). Basic authentication sends the Merchant ID as a username and the Merchant secret as a password.
