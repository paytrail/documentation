---
title: "State Query in HTML"
date: 2020-03-08T13:54:00+02:00
lastmod: 2020-03-08T13:54:00+02:00
draft: false
weight: 1
---

The state of an unique payment can be checked with an HTML `<form>`.

Webshop developers can implement a button next to an order to allow checking of the state of the payment for any order directly from Paytrail's service. This way the merchant can be sure whether the payment was successfully completed in case the information has not reached the webshop otherwise. This kind of situation can occur for example when customer closes the browser before returning to the webshop and the payment cannot be confirmed as paid with payment status query services provided by the payment method provider.

{{< table caption="Form Field Description" >}}
    <thead>
        <tr>
            <th>Variable name</th>
            <th>Description</th>
            <th>Format</th>
            <th>Max length</th>
            <th>Required/Optional</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>MERCHANT_ID</td>
            <td>Merchant ID is sent to the merchant after registration.</td>
            <td>N</td>
            <td>11</td>
            <td>R</td>
        </tr>
        <tr>
            <td>ORDER_NUMBER</td>
            <td>This is the same order number that was generated in the webshop and sent to the Payment
                Gateway.</td>
            <td>AN</td>
            <td>50</td>
            <td>R</td>
        </tr>
        <tr>
            <td>AUTHCODE</td>
            <td>The request AUTHCODE. The calculation of the AUTHCODE is described later.</td>
            <td>AN</td>
            <td>32</td>
            <td>R</td>
        </tr>
        <tr>
            <td>VERSION</td>
            <td>The current version value is "2".</td>
            <td>N</td>
            <td>1</td>
            <td>R</td>
        </tr>
        <tr>
            <td>CULTURE</td>
            <td>The service is available in Finnish, Swedish and English. The valid values for this field
                are "fi_FI", "sv_SE" and "en_US".</td>
            <td>AN</td>
            <td>8</td>
            <td>O</td>
        </tr>
    </tbody>
{{< /table >}}

**Example: The State Query HTML Form**

```html
<form action="https://payment.paytrail.com/check-payment" method="post">
    <input name="MERCHANT_ID" type="hidden" value="..." />
    <input name="ORDER_NUMBER" type="hidden" value="..." />
    <input name="AUTHCODE" type="hidden" value="..." />
    <input name="VERSION" type="hidden" value="..." />
    <input name="CULTURE" type="hidden" value="..." />
    <input name="submit" type="submit" value="Check payment state" />
</form>
```