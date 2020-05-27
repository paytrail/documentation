---
title: "Fields for the Interface"
draft: false
weight: 1
---

### Fields

Following form describes fields to be sent to payment gateway.

Payment gateway address is: <https://payment.paytrail.com/e2>

Supported character sets are **UTF-8** and **ISO-8859-1**. These character sets cannot be mixed.

Required fields are marked with an asterisk **(*)**. Some optional columns have default values which are used if no value is provided in payment data.

{{% notice note %}} Values may not contain '|' characters. These values must be removed or replaced by other character before sending to Paytrail service. If you need to use '|' in URLs, we recommend having URL parameter values encoded. Especially '|' must be replaced with string %7C. {{% /notice %}}

{{% notice warning %}} Payment total is defined using AMOUNT or at least one order row ITEM_UNIT_PRICE. It is possible to use both but we strongly recommend not to use AMOUNT when order rows are provided. {{% /notice %}}

#### `MERCHANT_ID (*)`
Merchant identification number given by Paytrail. For testing use `13466`.

#### `CURRENCY`
`EUR` is the only accepted value and default.

#### `URL_SUCCESS (*)`
URL where the customer is redirected after successful payment. `PARAMS_OUT` are added to `URL_SUCCESS`.

#### `URL_CANCEL (*)`
URL where customer is redirected after failed or cancelled payment. `PARAMS_OUT` are added to `URL_CANCEL`.

#### `ORDER_NUMBER (*)`
Used to identify one transaction.

#### `AMOUNT (*)`
Price is given in euros and cents without currency. Decimals are separated with a dot. Must contain **two decimals**. Interface accepts values between **0.65–499 999.99 €**. There may be payment method specific limitations smaller than the maximum amount.

#### `PARAMS_IN (*)`
Comma separated list of fields used in `AUTHCODE` calculation. Only values listed in this field are shown in payment data.

#### `PARAMS_OUT (*)`
Comma separated list of fields used in return `AUTHCODE` calculation. Only values listed in this field are returned as a part of `URL_SUCCESS` / `URL_CANCEL`. Has to contain values `PAYMENT_ID`, `TIMESTAMP` and `STATUS`.

#### `ALG`
Algorithm used in `AUTHCODE` calculation. Defaults to `1` (_SHA-256_).

#### `AUTHCODE (*)`
Calculated by joining all fields listed in `PARAMS_IN`. Fields are joined by placing the `|` (pipe) character between each two fields. `AUTHCODE` is formed from this string by calculating a sum using the algorithm from field `ALG`. This sum is converted to its 64-character hexadecimal form and lowercase letters are capitalized.

See example of calculating the correct value [**here.**][authcode]

#### `URL_NOTIFY`
URL to be called when the payment has been marked as paid. This URL is called with parameters defined in `PARAMS_OUT_NOTIFY` when the payment is marked as paid. `PARAMS_OUT_NOTIFY` are added to `URL_CANCEL`.

#### `PARAMS_OUT_NOTIFY`
**Not yet available.** Comma separated list of fields used in notify `RETURN_AUTHCODE` calculation. Only values listed in this field are returned as a part of `URL_NOTIFY`. If not included to payment data `PARAMS_OUT` is used as a part of `URL_NOTIFY`.

#### `LOCALE`
The default language of payment method selection page. Available locales are `fi_FI` (default), `sv_SE` and `en_US`.

#### `REFERENCE_NUMBER`
Reference number to be delivered to payment method provider's service. Given value is used only if user selected payment method is configured as interface (i.e. own direct agreement with payment method provider), otherwise the reference number is generated automatically by Paytrail.

Reference number must comply against Finnish reference number standard or be Finnish reference number in international RF format (e.g. 1232 or RF111232). For Osuuspankki, Ålandsbanken and S-Pankki RF formatted reference numbers are converted to numeric Finnish reference number format.

Single settlements are always made in the Finnish national reference standard. Paytrail does not create settlements using the RF reference standard.

#### `PAYMENT_METHODS`
Comma separated list of payment methods visible at payment method selection page. If only one is set the payment method page is bypassed and payer is directed to payment method provider page. Use requires agreement on use with Paytrail.

#### `VAT_IS_INCLUDED`
Whether VAT is included in prices given in `ITEM` records. This field is only used with `ITEM` records. If brought without, an error message is shown.

Available values are:

* `1` (VAT is included, default)
* `0` (VAT is not included).

If `VAT_IS_INCLUDED = 0`, payment service will calculate the sum to be charged from the customer based on the `ITEM_UNIT_PRICE`, `ITEM_VAT_PERCENT`, `ITEM_QUANTITY`, and `ITEM_DISCOUNT_PERCENT` values. This may lead to rounding differences between the web shop and the payment service. Please note that the calculation is done using two decimals.

If using the _Collector_ payment method, the value must be `1`. Collector will not be available if the value is `0`.

#### `MSG_SETTLEMENT_PAYER`
Message to consumers bank statement or credit card bill if supported by payment method.

#### `MSG_SETTLEMENT_MERCHANT`
**Not yet available.** Message to merchants bank statement if supported by payment method.

#### `MSG_UI_PAYMENT_METHOD`
Message shown in payment method provider page. Currently this is supported by Osuuspankki, Visa (Nets), MasterCard (Nets), American Express (Nets) and Diners Club (Nets). Not all payment methods support showing the message.

#### `MSG_UI_MERCHANT_PANEL`
Message shown in Paytrail Merchant's Panel.

#### `EXPIRATION_FOR_PAYMENT_CREATION`
Sets time when payment possibility is going to be expired for consumer. Payment can't be done if consumer enters to payment page after given expiration time. Time is validated when entering payment page and payment is created. Expired time will cause payment not to be created and not to be shown in merchant portal. Consumer will get error message if payment was expired. This does not disallow consumer from staying on payment page or being redirected to payment methods or completing payments after being able to get to payment page. Default is ISO-8601 notation datetime with time zone (yyyy-mm-ddThh:mm:ss+-hh:mm).

### Payer Information

Payer information can be brought to Paytrail service using the following fields.

#### `PAYER_PERSON_FIRSTNAME`
Payer's first name.

#### `PAYER_PERSON_LASTNAME`
Payer's last name.

#### `PAYER_PERSON_EMAIL`
Payer's email. Email is validated, no MX validation.

#### `PAYER_PERSON_PHONE`
Payer's telephone number.

#### `PAYER_PERSON_ADDR_STREET`
Payer's street address.

#### `PAYER_PERSON_ADDR_POSTAL_CODE`
Payer's postal code.

#### `PAYER_PERSON_ADDR_TOWN`
Payer's town.

#### `PAYER_PERSON_ADDR_COUNTRY`
Payer's country. _ISO-3166-2_ formatted.

#### `PAYER_COMPANY_NAME`
Payer's company.

### Product Information

Order rows can be brought to Paytrail service using the following repetitive fields. First order item row is brought with index 0 (for example name of the first product in field `ITEM_TITLE[0]`). Number of the order rows can not exceed **500**.

Required fields when product rows are included in the data are `ITEM_TITLE`, `ITEM_UNIT_PRICE`, and `ITEM_VAT_PERCENT`. These are marked with an asterisk `(*)`.

Total sum of the product prices must be between **0.65 – 499 999.99 €**. There may be payment method specific limitations smaller than the maximum amount.

#### `ITEM_TITLE[N] (*)`
Free field for the product name.

#### `ITEM_ID[N]`
Optional product ID.

#### `ITEM_QUANTITY[N]`
Optional quantity of products. Default is `1`. If a decimal number such as `0.5` is used, the Collector payment method will be hidden.

#### `ITEM_UNIT_PRICE[N] (*)`
The price for a single product with **up to two decimals**.

If `VAT_IS_INCLUDED = 0`, this is price excluding VAT. Price may be negative value if discount is given.

#### `ITEM_VAT_PERCENT[N] (*)`
VAT percent used for product.

#### `ITEM_DISCOUNT_PERCENT[N]`
Optional item discount. Percent is a number between `0–100`. Default is `0`.

#### `ITEM_TYPE[N]`
Optional type of the product or its costs. Available values `1` (normal, default), `2` (shipment cost) `3` (handling cost).

[authcode]: {{< ref "payments/e2-interface/authcode" >}}
