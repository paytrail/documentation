---
title: Fields for the Interface
weight: 2
---

Payment gateway address is: <https://payment.paytrail.com>

Supported character sets are **UTF-8** and **ISO-8859-1**. These character sets cannot be mixed.

Required fields are marked with an asterisk **(*)**.

{{< notice "note" >}}
Values may not contain "|" characters (pipe, vertical bar). These values must be removed or replaced by other character before sending to Paytrail service. If you need to use "|" in URLs, we recommend having URL parameter values encoded. Especially "|" must be replaced with string %7C.
{{< /notice >}}

{{< notice "note" >}}
It is not recommended to use REFERENCE_NUMBER field unless there is a justifiable requirement for it. Field allows to pass a webshop generated reference number for reference payment through Paytrail service. Field value is only used with payment methods which are used with merchant's own contracts using only technical implementation from Paytrail. With other payment methods (or when REFERENCE_NUMBER is omitted) Paytrail always generates reference number automatically.
{{< /notice >}}

### Fields

The following list describes the fields to be sent to the payment gateway using E1 interface.

#### `MERCHANT_ID (*)`
**Type:** `Number[11]`

Merchant ID is the merchant identification number given by Paytrail. Merchant ID consists of digits only and it can be found from material sent to merchant by Paytrail.

#### `ORDER_NUMBER (*)`
**Type:** `String[64]`

Order number is used to identify one transaction from another in the webshop software.

#### `REFERENCE_NUMBER`
**Type:** `Number[50]`

By default, the reference number is generated automatically. For payment methods which are used as an interface, the reference number can be given in this field to be delivered to bank's service instead of the automatically generated one.

#### `ORDER_DESCRIPTION`
**Type:** `String[65000]`

Any additional written information can be sent to Payment Gateway. It can be used to store order information like customer address, product information, etc. Order description is only visible through Merchant's Panel.

#### `CURRENCY (*)`
**Type:** `String[3]`

Currency. Only `EUR` is accepted for Finnish banks and credit cards.

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
**Type:** `String[2048]`

URL to be called when the payment has been marked as paid. This URL is called with same GET parameters as `RETURN_ADDRESS` when the payment is marked as paid. Note that `NOTIFY_ADDRESS` request is done by Paytrail server and thus customer's browser session does not exist in this request. `NOTIFY_ADDRESS` request is normally made within a couple of minutes from completing the payment.

#### `TYPE (*)`
**Type:** `String[3]`

Interface version. Newest versions are S1 and E1.

#### `CULTURE`
**Type:** `String[5]`

Culture affects the default language and how amounts are shown on payment method selection page. Available cultures are `fi_FI` (default), `sv_SE` and `en_US`.

#### `PRESELECTED_METHOD`
**Type:** `Number[2]`

If payment method selection is done in the webshop, payment method is delivered in this field. Check the available payment methods from [**this**][methods] page.

#### `MODE`
**Type:** `Number[1]`

Paytrail's service can be bypassed when preselected payment method is delivered (`PRESELECTED_METHOD`). Use requires agreement on use with Paytrail.

Available values are:

* **1** Normal service
* **2** Bypassing payment method selection page

#### `VISIBLE_METHODS`
**Type:** `String[64]`

This can be used to decide what payment methods are shown on the payment page. Payment method values are to be brought separated with comma. Values can be seen above in PRESELECTED_METHOD -section.

#### `GROUP`
**Type:** `String[16]`

Currently not in use.

#### `CONTACT_TELNO`
**Type:** `String[64]`

Payer's telephone number.

#### `CONTACT_CELLNO`
**Type:** `String[64]`

Payer cellphone number. The field is optional, but using Klarna requires this or payer telephone number. If neither is defined Klarna will be hidden.

#### `CONTACT_EMAIL (*)`
**Type:** `String[255]`

Payer's email.

#### `CONTACT_FIRSTNAME (*)`
**Type:** `String[64]`

Payer's first name.

#### `CONTACT_LASTNAME (*)`
**Type:** `String[64]`

Payer's last name.

#### `CONTACT_COMPANY`
**Type:** `String[128]`

Payer's company.

#### `CONTACT_ADDR_STREET (*)`
**Type:** `String[128]`

Payer's street address.

#### `CONTACT_ADDR_ZIP (*)`
**Type:** `String[16]`

Payer's postal code.

#### `CONTACT_ADDR_CITY (*)`
**Type:** `String[64]`

Payer's city.

#### `CONTACT_ADDR_COUNTRY (*)`
**Type:** `String[2]`

Payer home country. Data is given using **ISO-3166-1** standard values. For example, Finland is `FI` and Sweden is `SE`. These values are not case sensitive. This information is used for checking credit history and thus it is required.

#### `INCLUDE_VAT`
**Type:** `Number[1]`

Whether VAT is included in prices given in `ITEM` records. Value `1` indicates that VAT is included in given price. Value `0` indicates that price does not include VAT. Use the webshop native value to avoid rounding errors. That means, if product prices are saved without VAT in the webshop software, use `0` and if prices are saved with VAT, use `1`. If using the Collector payment method, the value **must** be `1`. Collector will not be available if the value is `0`.

#### `ITEMS (*)`
**Type:** `Number[3]`

Number of order rows. Corresponding product rows must be given in form.

### Product Information

In addition to these, order rows can be brought to Paytrail service using the following repetitive fields. First order item row is brought with index 0 (for example name of the first product in field `ITEM_TITLE[0]`). Number of item rows should match the value brought in field `ITEMS`.

#### `ITEM_TITLE[N]`
**Type**: `String[255]`

Free field for product name. Product name will be shown in Merchant's Panel and it is used in Klarna service as a name for product. Either the `ITEM_TITLE` or `ITEM_NO` is required.

#### `ITEM_NO[N]`
**Type**: `String[16]`

Optional product number. This is shown in Merchant's Panel with the product. This might help fixing the product rows to actual products. Either the `ITEM_TITLE` or `ITEM_NO` is required.

#### `ITEM_AMOUNT[N]`
**Type**: `Float[10]`

Number of products. Usually the value is `1` (_required_). If using the Collector payment method, this value must be a whole number. If a decimal number such as `0.5` is used, the Collector payment method will be hidden. `1.0` is accepted.

#### `ITEM_PRICE[N] (*)`
**Type**: `Float[10]`

The price for a single product. If `INCLUDE_VAT = 0`, this is price not including VAT. If `INCLUDE_VAT = 1`, this price includes VAT. Price may be negative value if a discount is given. Payment total must be positive. Total sum of the product prices must be at least 0.65 €.

#### `ITEM_TAX[N] (*)`
**Type**: `Float[10]`

Tax percent used for the product.

#### `ITEM_DISCOUNT[N]`
**Type**: `Float[10]`

If discount is given, this field can be used. Percent is a number between `0–100`. Default value is 0.

#### `ITEM_TYPE[N]`
**Type**: `Number[1]`

Type can be defined for each product row. Default type `1` means normal product row. Type `2` is used for shipment costs. Type `3` is used for handling costs.

### Calculating the `AUTHCODE`

This example shows how to send payment information in the most complete form using the interface version E1. We recommend using the Paytrail gateway as described here. This form is placed in the website by the payment method selection. The form shows the payment button currently in use and moves customer to payment service payment selection page when clicked. All fields are listed in this example, including optional unnecessary fields for better clarity. They can be removed from the form. Please note that in `AUTHCODE` calculation all fields, including optional parameters must always be used!

```html
<form action="https://payment.paytrail.com/" method="post">
    <input name="MERCHANT_ID" type="hidden" value="13466">
    <input name="ORDER_NUMBER" type="hidden" value="123456">
    <input name="REFERENCE_NUMBER" type="hidden" value="">
    <input name="ORDER_DESCRIPTION" type="hidden" value="Testitilaus">
    <input name="CURRENCY" type="hidden" value="EUR">
    <input name="RETURN_ADDRESS" type="hidden" value="http://www.esimerkki.fi/success">
    <input name="CANCEL_ADDRESS" type="hidden" value="http://www.esimerkki.fi/cancel">
    <input name="PENDING_ADDRESS" type="hidden" value="">
    <input name="NOTIFY_ADDRESS" type="hidden" value="http://www.esimerkki.fi/notify">
    <input name="TYPE" type="hidden" value="E1">
    <input name="CULTURE" type="hidden" value="fi_FI">
    <input name="PRESELECTED_METHOD" type="hidden" value="">
    <input name="MODE" type="hidden" value="1">
    <input name="VISIBLE_METHODS" type="hidden" value="">
    <input name="GROUP" type="hidden" value="">
    <input name="CONTACT_TELNO" type="hidden" value="0412345678">
    <input name="CONTACT_CELLNO" type="hidden" value="0412345678">
    <input name="CONTACT_EMAIL" type="hidden" value="esimerkki@esimerkki.fi">
    <input name="CONTACT_FIRSTNAME" type="hidden" value="Matti">
    <input name="CONTACT_LASTNAME" type="hidden" value="Meikäläinen">
    <input name="CONTACT_COMPANY" type="hidden" value="">
    <input name="CONTACT_ADDR_STREET" type="hidden" value="Testikatu 1">
    <input name="CONTACT_ADDR_ZIP" type="hidden" value="40500">
    <input name="CONTACT_ADDR_CITY" type="hidden" value="Jyväskylä">
    <input name="CONTACT_ADDR_COUNTRY" type="hidden" value="FI">
    <input name="INCLUDE_VAT" type="hidden" value="1" />
    <input name="ITEMS" type="hidden" value="2">
    <input name="ITEM_TITLE[0]" type="hidden" value="Product #101">
    <input name="ITEM_NO[0]" type="hidden" value="101">
    <input name="ITEM_AMOUNT[0]" type="hidden" value="1">
    <input name="ITEM_PRICE[0]" type="hidden" value="10.00">
    <input name="ITEM_TAX[0]" type="hidden" value="22.00">
    <input name="ITEM_DISCOUNT[0]" type="hidden" value="0">
    <input name="ITEM_TYPE[0]" type="hidden" value="1">
    <input name="ITEM_TITLE[1]" type="hidden" value="Product #202">
    <input name="ITEM_NO[1]" type="hidden" value="202">
    <input name="ITEM_AMOUNT[1]" type="hidden" value="2">
    <input name="ITEM_PRICE[1]" type="hidden" value="8.50">
    <input name="ITEM_TAX[1]" type="hidden" value="22.00">
    <input name="ITEM_DISCOUNT[1]" type="hidden" value="0">
    <input name="ITEM_TYPE[1]" type="hidden" value="1">
    <input name="AUTHCODE" type="hidden" value="B5565364D8765E54A944084C0E9057F8">
    <input type="submit" value="Pay here">
</form>
```

The string to be used for `AUTHCODE` calculation is formed by joining the values from `<input>` fields above.

```plain
6pKF4jkv97zmqBJ3ZL8gUw5DfT2NMQ|13466|123456||Testitilaus|EUR|http://www.esimerkki.fi/success|http://www.esimerkki.fi/cancel||http://www.esimerkki.fi/notify|E1|fi_FI||1|||0412345678|0412345678|esimerkki@esimerkki.fi|Matti|Meikäläinen||Testikatu 1|40500|Jyväskylä|FI|1|2|Product #101|101|1|10.00|22.00|0|1|Product #202|202|2|8.50|22.00|0|1
```

MD5 sums are counted from this string and converted to uppercase:

* **UTF-8:** `B5565364D8765E54A944084C0E9057F8`
* **ISO-8859-1:** `220CE506B90D1980F88E6522B525918C`

[methods]: {{< ref "payment-methods/values" >}}
