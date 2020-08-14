---
title: Fields for the Interface
weight: 2
---

The S1 interface is functionally similar to the E1 interface but it has fewer fields to send.

The payment gateway address is the same with E1: <https://payment.paytrail.com>

### Fields

#### `MERCHANT_ID (*)`
**Type:** `Number[11]`

Merchant ID is the merchant identification number given by Paytrail. Merchant ID consists of digits only and it can be found from material sent to merchant by Paytrail.

#### `ORDER_NUMBER (*)`
**Type**: `String[64]`

Order number is used to identify one transaction from another in the website software.

#### `AMOUNT (*)`
**Type**: `Float[10]`

Price is given in euros and cents. Price is given without currency type and decimals are separated with a dot. Price must contain two decimals.

**Example:** `15.50`. Minimum price accepted by the service is **0.65 €**.

#### `REFERENCE_NUMBER`
**Type**: `Number[50]`

By default, the reference number is generated automatically. For payment methods which are used as an interface, the reference number can be given in this field to be delivered to bank's service instead of the automatically generated one.

#### `ORDER_DESCRIPTION`
**Type**: `String[65000]`

Any additional written information can be sent to the Payment Gateway. It can be used to back up order information like customer address, product information, etc. Order description is only visible through Merchant's Panel.

#### `CURRENCY (*)`
**Type**: `String[3]`

Only EUR is accepted for Finnish banks and credit cards.

#### `RETURN_ADDRESS (*)`
**Type:** `String[2048]`

URL where customer is redirected after successful payment.

#### `CANCEL_ADDRESS (*)`
**Type:** `String[2048]`

URL where customer is redirected after failed or cancelled payment.

#### `PENDING_ADDRESS`
**Type:** `String[2048]`

Currently not in use.

#### `NOTIFY_ADDRESS`
**Type**: String[2048]

URL to be called when the payment has been marked as paid. This URL is called with same GET parameters as `RETURN_ADDRESS` when the payment is marked as paid. Note that the `NOTIFY_ADDRESS` request is done by Paytrail server and so customer's browser session is not available in that call. The `NOTIFY_ADDRESS` request is normally done within a couple of minutes from completing the payment.

#### `TYPE (*)`
**Type**: `String[3]`

Interface version. Newest versions are S1 and E1.

#### `CULTURE`
**Type**: `String[5]`

Culture affects on default language and how amounts are shown on payment method selection page. Available cultures are `fi_FI` (default), `sv_SE` and `en_US`.

#### `PRESELECTED_METHOD`
**Type:** `Number[2]`

If payment method selection is done in the website, payment method is delivered in this field. Check the available payment methods from [**this**][methods] page.

#### `MODE`
**Type:** `Number[1]`

Paytrail's service can be bypassed when preselected payment method is delivered (`PRESELECTED_METHOD`). Use requires agreement on use with Paytrail.

Available values are:

* **1** Normal service
* **2** Bypassing payment method selection page

#### `VISIBLE_METHODS`
**Type**: `String[64]`

This can be used to decide what payment methods are shown on the payment page. Payment method values are to be brought separated with comma.

#### `GROUP`
**Type**: `String[16]`

Currently not in use.

### Calculating the `AUTHCODE`

This example shows how to use the gateway service without additional payment information. In most cases the additional payment information should be used. This form is placed in the website by the payment method selection. The form shows the payment button currently in use and moves customer to payment service payment selection page when clicked. All fields are listed in this example, including optional unnecessary fields for better clarity. They can be removed from form. Please note that in `AUTHCODE` calculation all fields, including optional parameters must always be used!

```html
<form action="https://payment.paytrail.com/" method="post">
    <input name="MERCHANT_ID" type="hidden" value="13466">
    <input name="AMOUNT" type="hidden" value="99.90">
    <input name="ORDER_NUMBER" type="hidden" value="123456">
    <input name="REFERENCE_NUMBER" type="hidden" value="">
    <input name="ORDER_DESCRIPTION" type="hidden" value="Testitilaus">
    <input name="CURRENCY" type="hidden" value="EUR">
    <input name="RETURN_ADDRESS" type="hidden" value="http://www.esimerkki.fi/success">
    <input name="CANCEL_ADDRESS" type="hidden" value="http://www.esimerkki.fi/cancel">
    <input name="PENDING_ADDRESS" type="hidden" value="">
    <input name="NOTIFY_ADDRESS" type="hidden" value="http://www.esimerkki.fi/notify">
    <input name="TYPE" type="hidden" value="S1">
    <input name="CULTURE" type="hidden" value="fi_FI">
    <input name="PRESELECTED_METHOD" type="hidden" value="">
    <input name="MODE" type="hidden" value="1">
    <input name="VISIBLE_METHODS" type="hidden" value="">
    <input name="GROUP" type="hidden" value="">
    <input name="AUTHCODE" type="hidden" value="270729B19016F94BE5263CA5DE95E330">
    <input type="submit" value="Siirry maksamaan">
</form>
```

The string to be used for `AUTHCODE` calculation is formed by joining the values from `<input>` fields above.

```plain
6pKF4jkv97zmqBJ3ZL8gUw5DfT2NMQ|13466|99.90|123456||Testitilaus|EUR|http://www.esimerkki.fi/success|http://www.esimerkki.fi/cancel||http://www.esimerkki.fi/notify|S1|fi_FI||1||
```

MD5 sum is counted from this string and converted to uppercase. 

* **UTF-8:** `270729B19016F94BE5263CA5DE95E330`

Please note that this example did not include any characters that are handled differently in charsets **UTF-8** and **ISO-8859-1**. Because of this, the `AUTHCODE` is the same irrelevant of the charset is used.

[methods]: {{< ref "payment-methods/values" >}}
