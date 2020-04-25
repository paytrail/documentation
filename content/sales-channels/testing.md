---
title: "Testing the Sales Channel"
draft: false
weight: 3
---

The sales channel can be tested with the ID and channel secret shown below.

- **Channel ID:** `123`
- **Channel Secret:** `12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678`

{{% notice note %}}Additionally, all sent products must use merchant ID 13466 and channel commission class ID 1 when testing.{{% /notice %}}

Below is an example of a form submit that sends payment order to Paytrail’s payment service.

```html
<form action="https://payment.paytrail.com/channel-payment" method="post">
    <input name="CHANNEL_ID" value="123">
    <input name="ORDER_NUMBER" value="12345678">
    <input name="CURRENCY" value="EUR">
    <input name="RETURN_ADDRESS" value="https://www.example.com/ok">
    <input name="CANCEL_ADDRESS" value="https://www.example.com/cancel">
    <input name="NOTIFY_ADDRESS" value="https://www.example.com/notify">
    <input name="VERSION" value="1">
    <!-- CULTURE is optional -->
    <!-- PRESELECTED_METHOD is optional -->

    <!-- CONTACT_TELNO is optional -->
    <!-- CONTACT_CELLNO is optional -->
    <input name="CONTACT_EMAIL" value="example@example.com">
    <input name="CONTACT_FIRSTNAME" value="Jane">
    <input name="CONTACT_LASTNAME" value="Doe">

    <!-- CONTACT_COMPANY is optional -->
    <input name="CONTACT_ADDR_STREET" value="Teststreet 1">
    <input name="CONTACT_ADDR_ZIP" value="43210">
    <input name="CONTACT_ADDR_CITY" value="Helsinki">
    <input name="CONTACT_ADDR_COUNTRY" value="FI">
    <input name="INCLUDE_VAT" value="1" />
    <input name="ITEMS" value="1">

    <input name="ITEM_TITLE[0]" value="Example product 1">

    <!-- ITEM_NO is optional -->
    <input name="ITEM_AMOUNT[0]" value="1">
    <input name="ITEM_PRICE[0]" value="10.00">
    <input name="ITEM_TAX[0]" value="22.00">
    <input name="ITEM_MERCHANT_ID[0]" value="13466">
    <input name="ITEM_CP[0]" value="1">

    <!-- ITEM_DISCOUNT is optional -->
    <!-- ITEM_TYPE is optional -->
    <input name="AUTHCODE" value="D40ABA779948475B9F8E59EAB0EB7A9B">
    <input type="image" src="https://ssl.paytrail.com/logo/payhere_fin.jpg">
</form>
```

The last field `AUTHCODE` is calculated as follows:

1. Combine all the fields in the same order they appear at the form.
2. Insert pipe character (`|`) between the fields. If some field is not sent, insert a blank string (`''`) in its place. This will result in two or more pipe characters next to each other. The first field of the string has to be the channel secret. `AUTHCODE` will be created from this string with MD5 function. The value will be a 32 byte hexadecimal string.
3. Replace lower case letters with upper case letters.

{{% notice note %}}In this example character set UTF-8 is used. Paytrail supports character sets UTF-8 and ISO-8859-1. Calculation for AUTHCODE has to be done using same character set that is used when sending the form to Paytrail. Paytrail’s service will detect the used character set and use the same character set when calculating the AUTHCODE.{{% /notice %}}

In the example above the values of fields are as described below.

* **Channel secret:** `12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678`
* **Channel ID**: `123`
* **Order number:** `12345678`
* **Currency:** `EUR`
* **Return address (Successful payment):** <https://www.example.com/ok>
* **Return address (Cancelled payment):** <https://www.example.com/cancel>
* **Notify address:** <https://www.example.com/notify>
* **Interface version:** `1`
* **Culture code:** `fi_FI`
* **Preselected method for the payment page bypass:** `1`
* **Contact's telephone number:** `+01234567890`
* **Contact's cellphone number:** `+35812345678`
* **Contact's email address:** `example@example.com`
* **Contact's first name:** _Jane_
* **Contact's last name:** _Doe_
* **Contact's company:** _Test Ltd_
* **Contact's street address:** _Test Street 1_
* **Contact's zip code:** _43210_
* **Contact's city:** _Helsinki_
* **Contact's country:** FI
* **VAT included:** `1`
* **Amount of items:** `2`
* **Product #1**
  * **Name:** _Example product 1_
  * **Number:** `12345`
  * **Amount:** `1`
  * **Price:** `10.00`
  * **Tax percent:** `22.00`
  * **Merchant ID:** `13466`
  * **Channel commission class ID:** `1`
  * **Discount:** `0`
  * **Type:** `1`
* **Product #2**
  * **Name:** _Example product 2_
  * **Number:** `12345`
  * **Amount:** `2`
  * **Price:** `5.00`
  * **Tax percent:** `22.00`
  * **Merchant ID:** `13466`
  * **Channel commission class ID:** `1`
  * **Discount:** `20.00`
  * **Type:** `1`

The string used to calculate `AUTHCODE` is created by combining fields above.

```plain
12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678|123|12345678|EUR|https://www.example.com/ok|https://www.example.com/cancel|https://www.example.com/notify|1|fi_FI|||+35812345678||example@example.com|Jane|Doe|Test Ltd|Teststreet 1|43210|Helsinki|FI|1|2|Example product 1|12345|1|10.00|22.00|13466|1|0|1|Example product 2|12346|2|5.00|22.00|13466|1|20.00|1
```

MD5 hash value in upper case is `4FA11FF0D41C30B6F3A8AAEB814FD325`.
