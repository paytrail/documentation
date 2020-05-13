---
title: Validating the Fields
draft: false
weight: 2
---

### Field Validation

Following list describes the accepted types for fields and their maximum length in parentheses.

#### `MERCHANT_ID`
Numeric string. (11)

#### `CURRENCY`
Only `EUR` accepted. (3)

#### `URL_SUCCESS`
Valid URL including http(s). URLs that do not include any dots (e.g. <http://localhost>) are currently not supported. (2048)

#### `URL_CANCEL`
Valid URL including http(s). URLs that do not include any dots (e.g. <http://localhost>) are currently not supported. (2048)

#### `ORDER_NUMBER`
`0-9, a-z, A-Z and ()[]{}*+-_,`. As regular expression `/^[0-9a-zA-Z()[]{}*+-_,.]{1,64}$/`. (64)

#### `AMOUNT`
Float between `0.65–499999.99` (10)

#### `PARAMS_IN`
`0-9, A-Z, [],_`. (4096)

#### `PARAMS_OUT`
`0-9, A-Z, [],_`. (255)

#### `ALG`
`1`. (2)

#### `AUTHCODE`
`0-9, A-Z`. (64)

#### `URL_NOTIFY`
Valid URL including http(s). URLs that do not include any dots (e.g. <http://localhost>) are currently not supported. (2048)

#### `PARAMS_OUT_NOTIFY`
`0-9`, `A-Z`, `[],_`. (255)

#### `LOCALE`
`fi_FI`, `sv_SE`, and `en_US`. As regular expression `/^[a-z]{1,2}[_][A-Z]{1,2}$/`. (5)

#### `REFERENCE_NUMBER`
Alphanumeric, either numeric value complying Finnish reference number standard or numeric Finnish reference number in international RF format (e.g. 1232 or RF111232). (20)

#### `PAYMENT_METHODS`
`0-9` and `,` (64)

#### `VAT_IS_INCLUDED`
`0`, `1`. (1)

#### `MSG_SETTLEMENT_PAYER`
Unicode alphabets and `()[]{}*+-_,.\"'`. As regular expression `/^[pL-0-9- \"',()[]{}*+-_,.]*$/u`. (255)

#### `MSG_SETTLEMENT_MERCHANT`
Unicode alphabets and `()[]{}*+-_,.\"'`. See regular expression from `MSG_SETTLEMENT_PAYER`. (255)

#### `MSG_UI_PAYMENT_METHOD`
Unicode alphabets and `()[]{}*+-_,.\"'`. See regular expression from `MSG_SETTLEMENT_PAYER`. (255)

#### `MSG_UI_MERCHANT_PANEL`
Unicode alphabets and `()[]{}*+-_,.\"'`. See regular expression from `MSG_SETTLEMENT_PAYER`. (255)

#### `PAYER_PERSON_FIRSTNAME`
Unicode alphabets and `()[]{}*+-_,:&!?@#$£=*;~/\"'`. As regular expression `/^[pL-0-9- \"',()[]{}*/+-_,.:&!?@#$£=*;~]*$/u`. (64)

#### `PAYER_PERSON_LASTNAME`
Unicode alphabets and `()[]{}*+-_,:&!?@#$£=*;~/\"'`. See regular expression from `PAYER_PERSON_FIRSTNAME`. (64)

#### `PAYER_PERSON_EMAIL`
`example@domain.org`, max length for `example` is 64. (255)

#### `PAYER_PERSON_PHONE`
`0-9`, `+-`. (64)

#### `PAYER_PERSON_ADDR_STREET`
Unicode alphabets. As regular expression `/^[\pL-0-9- \"\',. ]*$/u`. (128)

#### `PAYER_PERSON_ADDR_POSTAL_CODE`
`0-9`, `a-z`, `A-Z`. (16)

#### `PAYER_PERSON_ADDR_TOWN`
Unicode alphabets and `()[]{}*+-_,:&!?@#$£=*;~/\"'`. See regular expression from `PAYER_PERSON_FIRSTNAME`. (64)

#### `PAYER_PERSON_ADDR_COUNTRY`
`a-z`, `A-Z`. (2)

#### `PAYER_COMPANY_NAME`
Unicode alphabets and `()[]{}*+-_,:&!?@#$£=*;~/\"'`. See regular expression from `PAYER_PERSON_FIRSTNAME`. (128)

#### `ITEM_TITLE`
Unicode alphabets and `()[]{}*+-_,:&!?@#$£=*;~/\"'`. See regular expression from `PAYER_PERSON_FIRSTNAME`. (255)

#### `ITEM_ID`
`0-9`. (16)

#### `ITEM_QUANTITY`
Floating point number. (10)

#### `ITEM_UNIT_PRICE`
Floating point number. between `0–499 999.99`. (10)

#### `ITEM_VAT_PERCENT`
Floating point number. between `0-100`. (10)

#### `ITEM_DISCOUNT_PERCENT`
Floating point number. (10)

#### `ITEM_TYPE`
`1`, `2`, and `3`. (1)

#### `EXPIRATION_FOR_PAYMENT_CREATION`
_ISO-8601_ notation datetime with time zone. For example, `yyyy-mm-ddThh:mm:ss+-hh:mm` (`2018-08-18T22:09:17+02:00`). (25)
