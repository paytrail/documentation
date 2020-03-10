---
title: "Testing the Sales Channel"
draft: false
weight: 3
---

The sales channel can be tested with the ID and channel secret shown below.

- **Channel ID:** `123`
- **Channel Secret:**

```plain
12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678
```

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

{{< table >}}
<thead>
    <tr>
        <th>Field</th>
        <th>Value</th>
    </tr>
</thead>
<tbody>
    <tr>
        <td>Channel secret</td>
        <td>
            <pre>
12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678</pre
            >
        </td>
    </tr>
    <tr>
        <td>Channel ID</td>
        <td>123</td>
    </tr>
    <tr>
        <td>Order number</td>
        <td>12345678</td>
    </tr>
    <tr>
        <td>Currency</td>
        <td>EUR</td>
    </tr>
    <tr>
        <td>Return address / Successful payment</td>
        <td>https://www.example.com/ok</td>
    </tr>
    <tr>
        <td>Return address / Cancelled payment</td>
        <td>https://www.example.com/cancel</td>
    </tr>
    <tr>
        <td>Notify address</td>
        <td>https://www.example.com/notify</td>
    </tr>
    <tr>
        <td>Interface version</td>
        <td>1</td>
    </tr>
    <tr>
        <td>Culture code</td>
        <td>fi_FI</td>
    </tr>
    <tr>
        <td>Preselected method for Payment page bypass</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>Payer’s telephone number</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>Payer’s cellphone number</td>
        <td>+35812345678</td>
    </tr>
    <tr>
        <td>Payer’s email address</td>
        <td>example@example.com</td>
    </tr>
    <tr>
        <td>Payer’s first name</td>
        <td>Jane</td>
    </tr>
    <tr>
        <td>Payer’s last name</td>
        <td>Doe</td>
    </tr>
    <tr>
        <td>Payer’s company</td>
        <td>Test Ltd</td>
    </tr>
    <tr>
        <td>Payer’s street address</td>
        <td>Teststreet 1</td>
    </tr>
    <tr>
        <td>Payer’s zip code</td>
        <td>43210</td>
    </tr>
    <tr>
        <td>Payer’s city</td>
        <td>Helsinki</td>
    </tr>
    <tr>
        <td>Payer’s country</td>
        <td>FI</td>
    </tr>
    <tr>
        <td>Is VAT is included in price?</td>
        <td>1</td>
    </tr>
    <tr>
        <td>Amount of items</td>
        <td>2</td>
    </tr>
    <tr>
        <td>Product #1 name</td>
        <td>Example product 1</td>
    </tr>
    <tr>
        <td>Product #1 number</td>
        <td>12345</td>
    </tr>
    <tr>
        <td>Product #1 amount</td>
        <td>1</td>
    </tr>
    <tr>
        <td>Product #1 price</td>
        <td>10.00</td>
    </tr>
    <tr>
        <td>Product #1 tax percent</td>
        <td>22.00</td>
    </tr>
    <tr>
        <td>Product #1 merchant ID</td>
        <td>13466</td>
    </tr>
    <tr>
        <td>Product #1 channel commission class ID</td>
        <td>1</td>
    </tr>
    <tr>
        <td>Product #1 discount</td>
        <td>0</td>
    </tr>
    <tr>
        <td>Product #1 type</td>
        <td>1</td>
    </tr>
    <tr>
        <td>Product #2 name</td>
        <td>Example product 2</td>
    </tr>
    <tr>
        <td>Product #2 number</td>
        <td>12345</td>
    </tr>
    <tr>
        <td>Product #2 amount</td>
        <td>2</td>
    </tr>
    <tr>
        <td>Product #2 price</td>
        <td>5.00</td>
    </tr>
    <tr>
        <td>Product #2 tax percent</td>
        <td>22.00</td>
    </tr>
    <tr>
        <td>Product #2 merchant ID</td>
        <td>13466</td>
    </tr>
    <tr>
        <td>Product #2 channel commission class ID</td>
        <td>1</td>
    </tr>
    <tr>
        <td>Product #2 discount</td>
        <td>20.00</td>
    </tr>
    <tr>
        <td>Product #2 type</td>
        <td>1</td>
    </tr>
</tbody>
{{< /table >}}

The string used to calculate `AUTHCODE` is created by combining fields above.

```plain
12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678|123|12345678|EUR|https://www.example.com/ok|https://www.example.com/cancel|https://www.example.com/notify|1|fi_FI|||+35812345678||example@example.com|Jane|Doe|Test Ltd|Teststreet 1|43210|Helsinki|FI|1|2|Example product 1|12345|1|10.00|22.00|13466|1|0|1|Example product 2|12346|2|5.00|22.00|13466|1|20.00|1
```

MD5 hash value in upper case is `4FA11FF0D41C30B6F3A8AAEB814FD325`.
