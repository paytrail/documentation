---
title: Calculating the AUTHCODE
draft: false
weight: 3
---

The `AUTHCODE` for the channel payment is calculated as follows:

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
