---
title: Sales Channel Fields
draft: false
weight: 1
---

The list below describes the fields that should be sent to Paytrail’s payment service. If the maximum lengths are exceeded, the payment will not be accepted. Supported character sets are **UTF-8** or **ISO-8859-1**. Character sets cannot be mixed.

{{% notice note %}}No value for field should contain “|”. Pipe characters should be replaced by another character before the data is sent to Paytrail’s payment service. If special characters have to be used in the return address, we recommend encoding the return address URL (e.g. function urlencode() in PHP). For example, the pipe character must be replaced with a string “%C7”.{{% /notice %}}

Required fields are marked with an asterisk (*).

#### `CHANNEL_ID (*)`
**Type:** `Number[11]`

Channel ID is an identifier given to the payment channel by Paytrail. Channel ID contains only numbers.

#### `ORDER_NUMBER (*)`
**Type:** `String[64]`

Order number is a unique string for order.

#### `CURRENCY (*)`
**Type:** `String[3]`

Currency of the payment. The only allowed value is `EUR`.

#### `RETURN_ADDRESS (*)`
**Type:** `String[255]`

After a successful payment, the customer will be redirected to the return address.

#### `CANCEL_ADDRESS (*)`
**Type:** `String[255]`

After cancelled or unsuccessful payment customer will be redirected to the cancel address.

#### `NOTIFY_ADDRESS (*)`
**Type:** `String[255]`

**We recommend using this.**

After the payment is marked as successful, Paytrail will call the notify address and send the same GET parameters as when directing customer to `RETURN_ADDRESS` after a successful payment.

#### `VERSION (*)`
**Type:** `Number[2]`

Version of payment interface. Channel interface is `1`.

#### `CULTURE`
**Type:** `String[5]`

Culture affects the default language of Paytrail’s payment service page as well as the format of the displayed sum. Possible values are `fi_FI` (default), `sv_SE` and `en_US`.

#### `PRESELECTED_METHOD`
**Type:** `Number[2]`

If the payment method selection is done in the web shop, the payment method is delivered in this field. Paytrail's service can be bypassed when preselected payment method is delivered. Use requires an additional agreement with Paytrail.

See [**payment method IDs**][payment-method-ids] for all the values. 

[payment-method-ids]: {{< ref "payment-methods/values" >}}

#### `AUTHCODE (*)`
**Type:** `String[32]`

Calculated with the MD5 algorithm. With `AUTHCODE` we prevent the abuse of payments. Value is calculated from a string that contains all the information from the order and channel’s secret.

#### `CONTACT_TELNO`
**Type:** `String[64]`

Contact's telephone number.

#### `CONTACT_CELLNO`
**Type:** `String[64]`

Contact's cellphone number.

#### `CONTACT_EMAIL (*)`
**Type:** `String[255]`

Contact's email.

#### `CONTACT_FIRSTNAME (*)`
**Type:** `String[64]`

Contact's first name.

#### `CONTACT_LASTNAME (*)`
**Type:** `String[64]`

Contact's last name.

#### `CONTACT_COMPANY`
**Type:** `String[128]`

Contact's company name.

#### `CONTACT_ADDR_STREET (*)`
**Type:** `String[128]`

Contact's street address.

#### `CONTACT_ADDR_ZIP (*)`
**Type:** `Number[16]`

Contact address' ZIP code.

#### `CONTACT_ADDR_CITY (*)`
**Type:** `String[64]`

Contact address' city.

#### `CONTACT_ADDR_COUNTRY (*)`
**Type:** `String[2]`

Contact address' country. The value follows the _ISO-3166-1_ standard and it contains two letters. For example, Finland is `FI` and Sweden is `SE`. It does not matter if the value is in lower or upper case.

#### `INCLUDE_VAT (*)`
**Type:** `0 | 1`

Signals whether the prices in item rows include VAT or not. Value `1` means that VAT is included in given prices, value `0` means that given VAT has to be added to price. If your products are saved including VAT in your web shop, use value `1`. If products are saved without VAT, use value `0`.

#### `ITEMS (*)`
**Type:** `Number[8]`

Amount of item rows.

### Product Rows

Products in the payment bundle can be sent with the recurring fields described below.

#### `ITEM_TITLE[X] (*)`
**Type:** `String[255]`

Free-formatted name for the product.

#### `ITEM_AMOUNT[X] (*)`
**Type:** `Float[10]`

If the order includes several of the same products this field can be used to determine amount of them. This means that identical products do not need their own rows.

#### `ITEM_PRICE[X] (*)`
**Type:** `Float[10]`

Price of the product. If `INCLUDE_VAT` is `0`, value of this field is price without VAT. Otherwise, value of this field is price including VAT. Price has to be always positive. Discounts for products can be sent with the `ITEM_DISCOUNT[X]` field.

#### `ITEM_TAX[X] (*)`
**Type:** `Float[10]`

VAT percent used for products.

#### `ITEM_MERCHANT_ID[X] (*)`
**Type:** `Number[8]`

One payment can contain products from several merchants. Every item row has to contain merchant ID of the product’s merchant.

#### `ITEM_CP[X] (*)`
**Type:** `Float[10]`

Payment channel may have several commission classes. Every product can have their own commission class. This allows different prices for premium merchants or smaller commission class for more expensive products. Paytrail will deliver commission class IDs to payment channel. Commission class IDs are defined in the contract between Paytrail and payment channel.

#### `ITEM_NO[X]`
**Type:** `String[16]`

Optional product number that is displayed in the Merchant’s Panel with the product. Using this field may help find the right product.

#### `ITEM_DISCOUNT[X]`
**Type:** `Float[10]`

If product has a discount, this defines the discount percentage. The value can be between `0–100`. Default value is 0.

#### `ITEM_TYPE[X]`
**Type:** `Number[2]`

Type can be defined for every item row. Type `1` (default) means normal product, `2` shipping, and `3` handling.

## Supported Payment Methods

* **1** _Nordea_
* **2** _Osuuspankki_
* **3** _Danske Bank_
* **5** _Ålandsbanken_
* **6** _Handelsbanken_
* **10** _S-Pankki_
* **50** _Aktia_
* **51** _POP Pankki_
* **52** _Säästöpankki_
* **53** _Visa (Nets)_
* **54** _MasterCard (Nets)_
* **61** _Oma Säästöpankki_
