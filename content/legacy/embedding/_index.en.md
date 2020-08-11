---
title: "Embedding"
draft: false
weight: 2
---

When Paytrail's service has been integrated using either the [REST interface][rest] or the [form interface][form], the payment process can be shortened and made easier from the customer’s point of view by embedding the payment method selection. The payment methods are available directly at the end of the website's checkout process instead of the customer being directed to Paytrail's payment page to select a payment method.

{{< figure src="/images/embedding.png" alt="Payment method selection page embedding" width="75%" >}}

Embedding the payment method selection page is easy to implement once the payment service has been first integrated with REST or form interface. It can be enabled by adding a small JavaScript code to the payment button page. We recommend adding the code to the end of the page before the closing body tag. In this case JavaScript is run last without slowing down page rendering.

This feature degrades gracefully: even if JavaScript is disabled by the customer's browser, the original payment button will still appear on the payment page just as it was shown before adding JavaScript code.

JavaScript interface offers two methods; one is used for the chosen payment interface. `initWithToken` request is used for the REST implementation and `initWithForm` request is used for the form interface implementation.

{{% notice note %}}Embedding the Payment method selection page widget uses jQuery in order to enable cross-browser compatibility. The module downloads jQuery library version 1.7 automatically from Google cloud services if jQuery is not available or jQuery version is unsupported. Required jQuery version is 1.4.3 or later.{{% /notice %}}

### Download

The widget version **1.0** can be downloaded [**here**][widget] (_18 KB, minified_).

[form]: {{< ref "payments" >}}
[rest]: {{< ref "rest-interface" >}}
[widget]: https://payment.paytrail.com/js/payment-widget-v1.0.min.js
