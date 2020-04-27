---
title: "Testing the Sales Channel"
draft: false
weight: 4
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
