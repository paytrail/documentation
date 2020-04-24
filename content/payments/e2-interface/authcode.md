---
title: "Calculating the Payment AUTHCODE"
draft: false
weight: 3
---

`AUTHCODE` is calculated by joining all fields listed in `PARAMS_IN`. Fields are joined by placing the `|` character (pipe, vertical bar) between each two fields. `AUTHCODE` is formed from this string by calculating a sum using algorithm from `ALG` field. This sum is converted to its 64 character hexadecimal form and lowercase letters are capitalized.

### Using All the Fields

This example covers sending payment information in the most complete form. This form is placed in the web shop by the payment method selection. The form shows the payment button currently in use and moves customer to payment service payment selection page when clicked. All fields are listed in this example, including optional unnecessary fields for better clarity. They can be removed from the form.

```html
<form action="https://payment.paytrail.com/e2" method="post">
    <input name="MERCHANT_ID" type="hidden" value="13466">
    <input name="URL_SUCCESS" type="hidden" value="http://www.example.com/success">
    <input name="URL_CANCEL" type="hidden" value="http://www.example.com/cancel">
    <input name="ORDER_NUMBER" type="hidden" value="123456">
    <input name="PARAMS_IN" type="hidden" value="MERCHANT_ID,URL_SUCCESS,URL_CANCEL,ORDER_NUMBER,PARAMS_IN,PARAMS_OUT,ITEM_TITLE[0],ITEM_ID[0],ITEM_QUANTITY[0],ITEM_UNIT_PRICE[0],ITEM_VAT_PERCENT[0],ITEM_DISCOUNT_PERCENT[0],ITEM_TYPE[0],ITEM_TITLE[1],ITEM_ID[1],ITEM_QUANTITY[1],ITEM_UNIT_PRICE[1],ITEM_VAT_PERCENT[1],ITEM_DISCOUNT_PERCENT[1],ITEM_TYPE[1],MSG_UI_MERCHANT_PANEL,URL_NOTIFY,LOCALE,CURRENCY,REFERENCE_NUMBER,PAYMENT_METHODS,PAYER_PERSON_PHONE,PAYER_PERSON_EMAIL,PAYER_PERSON_FIRSTNAME,PAYER_PERSON_LASTNAME,PAYER_COMPANY_NAME,PAYER_PERSON_ADDR_STREET,PAYER_PERSON_ADDR_POSTAL_CODE,PAYER_PERSON_ADDR_TOWN,PAYER_PERSON_ADDR_COUNTRY,VAT_IS_INCLUDED,ALG">
    <input name="PARAMS_OUT" type="hidden" value="ORDER_NUMBER,PAYMENT_ID,AMOUNT,CURRENCY,PAYMENT_METHOD,TIMESTAMP,STATUS">
    <input name="ITEM_TITLE[0]" type="hidden" value="Product 101">
    <input name="ITEM_ID[0]" type="hidden" value="101">
    <input name="ITEM_QUANTITY[0]" type="hidden" value="2">
    <input name="ITEM_UNIT_PRICE[0]" type="hidden" value="300.00">
    <input name="ITEM_VAT_PERCENT[0]" type="hidden" value="15.00">
    <input name="ITEM_DISCOUNT_PERCENT[0]" type="hidden" value="50">
    <input name="ITEM_TYPE[0]" type="hidden" value="1">
    <input name="ITEM_TITLE[1]" type="hidden" value="Product 202">
    <input name="ITEM_ID[1]" type="hidden" value="202">
    <input name="ITEM_QUANTITY[1]" type="hidden" value="4">
    <input name="ITEM_UNIT_PRICE[1]" type="hidden" value="12.50">
    <input name="ITEM_VAT_PERCENT[1]" type="hidden" value="0">
    <input name="ITEM_DISCOUNT_PERCENT[1]" type="hidden" value="0">
    <input name="ITEM_TYPE[1]" type="hidden" value="1">
    <input name="MSG_UI_MERCHANT_PANEL" type="hidden" value="Order 123456">
    <input name="URL_NOTIFY" type="hidden" value="http://www.example.com/notify">
    <input name="LOCALE" type="hidden" value="en_US">
    <input name="CURRENCY" type="hidden" value="EUR">
    <input name="REFERENCE_NUMBER" type="hidden" value="">
    <input name="PAYMENT_METHODS" type="hidden" value="">
    <input name="PAYER_PERSON_PHONE" type="hidden" value="01234567890">
    <input name="PAYER_PERSON_EMAIL" type="hidden" value="john.doe@example.com">
    <input name="PAYER_PERSON_FIRSTNAME" type="hidden" value="John">
    <input name="PAYER_PERSON_LASTNAME" type="hidden" value="Doe">
    <input name="PAYER_COMPANY_NAME" type="hidden" value="Test company">
    <input name="PAYER_PERSON_ADDR_STREET" type="hidden" value="Test street 1">
    <input name="PAYER_PERSON_ADDR_POSTAL_CODE" type="hidden" value="608009">
    <input name="PAYER_PERSON_ADDR_TOWN" type="hidden" value="Test town">
    <input name="PAYER_PERSON_ADDR_COUNTRY" type="hidden" value="AA">
    <input name="VAT_IS_INCLUDED" type="hidden" value="1">
    <input name="ALG" type="hidden" value="1">
    <input name="AUTHCODE" type="hidden" value="EAC78AB322614BB98F43FFF2EF55E71075DDC79634EA728C9C842EFF8E0AC0C9">
  <input type="submit" value="Pay here">
</form>
```

#### `MERCHANT AUTHENTICATION HASH`
`6pKF4jkv97zmqBJ3ZL8gUw5DfT2NMQ`

#### `MERCHANT_ID`
`13466`

#### `URL_SUCCESS`
<http://www.example.com/success>

#### `URL_CANCEL`
<http://www.example.com/cancel>

#### `ORDER_NUMBER`
`123456`

#### `PARAMS_IN`
`MERCHANT_ID,URL_SUCCESS,URL_CANCEL,ORDER_NUMBER,PARAMS_IN,PARAMS_OUT,ITEM_TITLE[0],ITEM_ID[0],ITEM_QUANTITY[0],ITEM_UNIT_PRICE[0],ITEM_VAT_PERCENT[0],ITEM_DISCOUNT_PERCENT[0],ITEM_TYPE[0],ITEM_TITLE[1],ITEM_ID[1],ITEM_QUANTITY[1],ITEM_UNIT_PRICE[1],ITEM_VAT_PERCENT[1],ITEM_DISCOUNT_PERCENT[1],ITEM_TYPE[1],MSG_UI_MERCHANT_PANEL,URL_NOTIFY,LOCALE,CURRENCY,REFERENCE_NUMBER,PAYMENT_METHODS,PAYER_PERSON_PHONE,PAYER_PERSON_EMAIL,PAYER_PERSON_FIRSTNAME,PAYER_PERSON_LASTNAME,PAYER_COMPANY_NAME,PAYER_PERSON_ADDR_STREET,PAYER_PERSON_ADDR_POSTAL_CODE,PAYER_PERSON_ADDR_TOWN,PAYER_PERSON_ADDR_COUNTRY,VAT_IS_INCLUDED,ALG`

#### `PARAMS_OUT`
`ORDER_NUMBER,PAYMENT_ID,AMOUNT,CURRENCY,PAYMENT_METHOD,TIMESTAMP,STATUS`

#### `ITEM_TITLE`
Product 101

#### `ITEM_ID`
Product 101

#### `ITEM_QUANTITY`
`2`

#### `ITEM_UNIT_PRICE`
`300.00`

#### `ITEM_VAT_PERCENT`
`15.00`

#### `ITEM_DISCOUNT_PERCENT`
`50`

#### `ITEM_TYPE`
`1`

#### `ITEM_TITLE`
Product 101

#### `ITEM_ID`
`202`

#### `ITEM_QUANTITY`
`4`

#### `ITEM_UNIT_PRICE`
12.50

#### `ITEM_VAT_PERCENT`
`0`

#### `ITEM_DISCOUNT_PERCENT`
`0`

#### `ITEM_TYPE`
`1`

#### `MSG_UI_MERCHANT_PANEL`
Order 123456

#### `URL_NOTIFY`
<http://www.example.com/notify>

#### `LOCALE`
`en_US`

#### `CURRENCY`
`EUR`

#### `REFERENCE_NUMBER`
`REF-0001`

#### `PAYMENT_METHODS`
`1`

#### `PAYER_PERSON_PHONE`
`01234567890`

#### `PAYER_PERSON_EMAIL`
`john.doe@example.com`

#### `PAYER_PERSON_FIRSTNAME`
John

#### `PAYER_PERSON_LASTNAME`
Doe

#### `PAYER_COMPANY_NAME`
Test company

#### `PAYER_PERSON_ADDR_STREET`
Test street 1

#### `PAYER_PERSON_ADDR_POSTAL_CODE`
608009

#### `PAYER_PERSON_ADDR_TOWN`
Test town

#### `PAYER_PERSON_ADDR_COUNTRY`
`AA`

#### `VAT_IS_INCLUDED`
`1`

#### `ALG`
`1`

#### `AUTHCODE`
`EAC78AB322614BB98F43FFF2EF55E71075DDC79634EA728C9C842EFF8E0AC0C9`

### Calculation Formula

Now the string to be used for `AUTHCODE` calculation is formed by joining the fields above:

```plain
6pKF4jkv97zmqBJ3ZL8gUw5DfT2NMQ|13466|http://www.example.com/success|http://www.example.com/cancel|123456|MERCHANT_ID,URL_SUCCESS,URL_CANCEL,ORDER_NUMBER,PARAMS_IN,PARAMS_OUT,ITEM_TITLE[0],ITEM_ID[0],ITEM_QUANTITY[0],ITEM_UNIT_PRICE[0],ITEM_VAT_PERCENT[0],ITEM_DISCOUNT_PERCENT[0],ITEM_TYPE[0],ITEM_TITLE[1],ITEM_ID[1],ITEM_QUANTITY[1],ITEM_UNIT_PRICE[1],ITEM_VAT_PERCENT[1],ITEM_DISCOUNT_PERCENT[1],ITEM_TYPE[1],MSG_UI_MERCHANT_PANEL,URL_NOTIFY,LOCALE,CURRENCY,REFERENCE_NUMBER,PAYMENT_METHODS,PAYER_PERSON_PHONE,PAYER_PERSON_EMAIL,PAYER_PERSON_FIRSTNAME,PAYER_PERSON_LASTNAME,PAYER_COMPANY_NAME,PAYER_PERSON_ADDR_STREET,PAYER_PERSON_ADDR_POSTAL_CODE,PAYER_PERSON_ADDR_TOWN,PAYER_PERSON_ADDR_COUNTRY,VAT_IS_INCLUDED,ALG|ORDER_NUMBER,PAYMENT_ID,AMOUNT,CURRENCY,PAYMENT_METHOD,TIMESTAMP,STATUS|Product 101|101|2|300.00|15.00|50|1|Product 202|202|4|12.50|0|0|1|Order 123456|http://www.example.com/notify|en_US|EUR|||01234567890|john.doe@example.com|John|Doe|Test company|Test street 1|608009|Test town|AA|1|1
```

**SHA-256** sum is counted from this string (note uppercase):

```plain
EAC78AB322614BB98F43FFF2EF55E71075DDC79634EA728C9C842EFF8E0AC0C9
```

### Using Only the Required Fields

```html
<form action="https://payment.paytrail.com/e2" method="post">
  <input name="MERCHANT_ID" type="hidden" value="13466">
  <input name="URL_SUCCESS" type="hidden" value="http://www.example.com/success">
  <input name="URL_CANCEL" type="hidden" value="http://www.example.com/cancel">
  <input name="ORDER_NUMBER" type="hidden" value="123456">
  <input name="PARAMS_IN" type="hidden" value="MERCHANT_ID,URL_SUCCESS,URL_CANCEL,ORDER_NUMBER,PARAMS_IN,PARAMS_OUT,AMOUNT">
  <input name="PARAMS_OUT" type="hidden" value="PAYMENT_ID,TIMESTAMP,STATUS">
  <input name="AMOUNT" type="hidden" value="350.00">
  <input name="AUTHCODE" type="hidden" value="BBDF8997A56F97DC0A46C99C88C2EEF9D541AAD59CFF2695D0DD9AF474086D71">
  <input type="submit" value="Pay here">
</form>
```

#### `MERCHANT AUTHENTICATION HASH`
`6pKF4jkv97zmqBJ3ZL8gUw5DfT2NMQ`

#### `MERCHANT_ID`
`13466`

#### `URL_SUCCESS`
<http://www.example.com/success>

#### `URL_CANCEL`
<http://www.example.com/cancel>

#### `ORDER_NUMBER`
`123456`

#### `PARAMS_IN`
`MERCHANT_ID,URL_SUCCESS,URL_CANCEL,ORDER_NUMBER,PARAMS_IN,PARAMS_OUT,AMOUNT`

#### `PARAMS_OUT`
`PAYMENT_ID,TIMESTAMP,STATUS`

#### `AMOUNT`
`350.00`

#### `AUTHCODE`
`BBDF8997A56F97DC0A46C99C88C2EEF9D541AAD59CFF2695D0DD9AF474086D71`

Now the string to be used for `AUTHCODE` calculation is formed by joining the fields above:

```plain
6pKF4jkv97zmqBJ3ZL8gUw5DfT2NMQ|13466|http://www.example.com/success|http://www.example.com/cancel|123456|MERCHANT_ID,URL_SUCCESS,URL_CANCEL,ORDER_NUMBER,PARAMS_IN,PARAMS_OUT,AMOUNT|PAYMENT_ID,TIMESTAMP,STATUS|350.00
```

**SHA-256** sum is counted from this string (note uppercase): 

```plain
BBDF8997A56F97DC0A46C99C88C2EEF9D541AAD59CFF2695D0DD9AF474086D71
```
