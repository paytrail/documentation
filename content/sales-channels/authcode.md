---
title: Calculating the AUTHCODE for Sales Channel Payment
draft: false
weight: 3
---

The `AUTHCODE` for the channel payment is calculated as follows:

1. Combine all the fields in the same order they appear at the form.
2. Insert pipe character (`|`) between the fields. If some field is not sent, insert a blank string (`''`) in its place. This will result in two or more pipe characters next to each other. The first field of the string has to be the channel secret
3. Calculate the **MD5** hash from this value. The value will be a 32-byte hexadecimal string.
4. Transform all the letters to uppercase.

{{% notice note %}}In this example character set UTF-8 is used. Paytrail supports character sets UTF-8 and ISO-8859-1. Calculation for AUTHCODE has to be done using same character set that is used when sending the form to Paytrail. Paytrail’s service will detect the used character set and use the same character set when calculating the AUTHCODE.{{% /notice %}}

Assume we have the following values for `AUTHCODE` calculation:

* **CHANNEL_SECRET:** `12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678`
* **CHANNEL_ID**: `123`
* **ORDER_NUMBER:** `12345678`
* **CURRENCY:** `EUR`
* **RETURN_ADDRESS:** <https://www.example.com/ok>
* **CANCEL_ADDRESS:** <https://www.example.com/cancel>
* **NOTIFY_ADDRESS:** <https://www.example.com/notify>
* **VERSION:** `1`
* **CULTURE:** `fi_FI`
* **PRESELECTED_METHOD:** `1`
* **CONTACT_TELNO:** `+01234567890`
* **CONTACT_CELLNO:** `+35812345678`
* **CONTACT_EMAIL:** `example@example.com`
* **CONTACT_FIRSTNAME:** `Jane`
* **CONTACT_LASTNAME:** `Doe`
* **CONTACT_COMPANY:** `Test Ltd`
* **CONTACT_ADDR_STREET:** `Test Street 1`
* **CONTACT_ADDR_ZIP:** `43210`
* **CONTACT_ADDR_CITY:** `Helsinki`
* **CONTACT_ADDR_COUNTRY:** `FI`
* **INCLUDE_VAT:** `1`
* **ITEMS:** `1`
* **ITEM_TITLE[0]:** `Example product 1`
* **ITEM_NO[0]:** `12345`
* **ITEM_AMOUNT[0]:** `1`
* **ITEM_PRICE[0]:** `10.00`
* **ITEM_TAX[0]:** `22.00`
* **ITEM_MERCHANT_ID[0]:** `13466`
* **ITEM_CP[0]:** `1`
* **ITEM_DISCOUNT[0]:** `0`
* **ITEM_TYPE[0]:** `1`

The string used to calculate `AUTHCODE` is created by combining fields above.

```plain
12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678|123|12345678|EUR|https://www.example.com/ok|https://www.example.com/cancel|https://www.example.com/notify|1|fi_FI|1|+01234567890|+35812345678|example@example.com|Jane|Doe|Test Ltd|Test Street 1|43210|Helsinki|FI|1|1|Example product 1|12345|1|10.00|22.00|13466|1|0|1
```

**MD5** hash is computed from this string (note uppercase):

```plain
64F47F0DA8D38955E0DB8CC5A9D154AA
```
