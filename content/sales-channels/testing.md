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

See [**here**][authcode] on calculating the `AUTHCODE`.

```html
<form action="https://payment.paytrail.com/channel-payment" method="post">
    <input name="CHANNEL_ID" value="123">
    <input name="ORDER_NUMBER" value="12345678">
    <input name="CURRENCY" value="EUR">
    <input name="RETURN_ADDRESS" value="https://www.example.com/ok">
    <input name="CANCEL_ADDRESS" value="https://www.example.com/cancel">
    <input name="NOTIFY_ADDRESS" value="https://www.example.com/notify">
    <input name="VERSION" value="1">
    <input name="CULTURE" value="fi_FI">
    <input name="PRESELECTED_METHOD" value="1">
    <input name="CONTACT_TELNO" value="+01234567890">
    <input name="CONTACT_CELLNO" value="+35812345678">
    <input name="CONTACT_EMAIL" value="example@example.com">
    <input name="CONTACT_FIRSTNAME" value="Jane">
    <input name="CONTACT_LASTNAME" value="Doe">
    <input name="CONTACT_COMPANY" value="Test Ltd">
    <input name="CONTACT_ADDR_STREET" value="Test Street 1">
    <input name="CONTACT_ADDR_ZIP" value="43210">
    <input name="CONTACT_ADDR_CITY" value="Helsinki">
    <input name="CONTACT_ADDR_COUNTRY" value="FI">
    <input name="INCLUDE_VAT" value="1" />
    <input name="ITEMS" value="1">
    <input name="ITEM_TITLE[0]" value="Example product 1">
    <input name="ITEM_NO[0]" value="12345">
    <input name="ITEM_AMOUNT[0]" value="1">
    <input name="ITEM_PRICE[0]" value="10.00">
    <input name="ITEM_TAX[0]" value="22.00">
    <input name="ITEM_MERCHANT_ID[0]" value="13466">
    <input name="ITEM_CP[0]" value="1">
    <input name="ITEM_DISCOUNT[0]" value="0">
    <input name="ITEM_TYPE[0]" value="1">
    <input name="AUTHCODE" value="64F47F0DA8D38955E0DB8CC5A9D154AA">
    <input type="image" src="https://ssl.paytrail.com/logo/payhere_fin.jpg">
</form>
```

[authcode]: {{< ref "sales-channels/authcode.md" >}}
