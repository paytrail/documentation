---
title: "Embedding with the REST Interface"
date: 2020-03-08T13:08:44+02:00
lastmod: 2020-03-08T13:08:44+02:00
draft: false
weight: 2
---

### Signature

```ts
initWithToken(elementId: string, token: string, options: object)
```

- `elementId: string` \
ID value for the HTML element describing an optional view for moving to the payment selection. This element is replaced with the payment method selection page widget once the widget has been downloaded. If JavaScript is not enabled, the customer will see this optional view, which typically is a direct link (_"Pay here"_ button) to the payment method selection page.

- `token: string` \
The REST interface returns a token value, which is sent as a parameter to the request.

- `options: object` \
Options is a data structure, which allows adding extra parameters for the design and functionality of the payment method selection page widget. The parameters are described in [parameters][params].

**Example: Payment method selection page embedding with JSON interface**

```html
<p id="payment">
  <a href="https://payment.paytrail.com/payment/load/token/0123456789abcdefg">Go to payments</a>
</p>

<!--> content here -->

<script src="//payment.paytrail.com/js/payment-widget-v1.0.min.js"></script>
<script>
    SV.widget.initWithToken('payment', '0123456789abcdefg', {
        charset: 'ISO-8859-1'
    });
</script>
```

[params]: {{< ref "payment-service/embedding/parameters" >}}
