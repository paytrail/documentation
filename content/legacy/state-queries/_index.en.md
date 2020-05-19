---
title: "Payment Status Queries"
draft: false
weight: 6
---

The status of an unique payment can be checked with an HTML `<form>`.

Webshop developers can implement a button next to an order to allow checking of the status of the payment for any order directly from Paytrail's service. This way the merchant can be sure whether the payment was successfully completed in case the information has not reached the webshop otherwise. This kind of situation can occur for example when customer closes the browser before returning to the webshop and the payment cannot be confirmed as paid with payment status query services provided by the payment method provider.

### Example Form

```html
<form action="https://payment.paytrail.com/check-payment" method="post">
    <input name="MERCHANT_ID" type="hidden" value="..." />
    <input name="ORDER_NUMBER" type="hidden" value="..." />
    <input name="AUTHCODE" type="hidden" value="..." />
    <input name="VERSION" type="hidden" value="..." />
    <input name="CULTURE" type="hidden" value="..." />
    <input name="submit" type="submit" value="Check payment status" />
</form>
```

### Fields

#### `MERCHANT_ID (*)`
**Type:** `Number[11]`

Merchant ID is sent to the merchant after registration.

#### `ORDER_NUMBER (*)`
**Type:** `String[50]`

This is the same order number that was generated in the webshop and sent to the Payment Gateway.

#### `AUTHCODE (*)`
**Type:** `String[32]`

The request `AUTHCODE`. The calculation of the `AUTHCODE` is described later.

#### `VERSION (*)`
**Type:** `Number[1]`

The current version value is `2`.

#### `CULTURE`
**Type:** `String[8]`

The service is available in Finnish, Swedish and English. The valid values for this field are `fi_FI`, `sv_SE` and `en_US`.
