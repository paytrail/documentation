---
title: "Payment Creation"
draft: false
---

Paytrail payment service REST interface allows for creating a payment in advance with a simple HTTP POST request, which sends the payment data as an _XML_ or _JSON_ message. The request returns an order number, payment ID (_token_) and URL address for making a payment. In a typical case, a webshop creates a payment with the REST interface at the end of an order process, and redirects the customer to the returned URL.

### Service URL

Service URL is <https://payment.paytrail.com/api-payment/create>

### Request Parameters

The root name of the sent _XML_ message is `<payment>`. The parameters for creating a payment are as follows:

- `orderNumber` (all characters[64], required) \
Order number. Order number is a string of characters identifying the customer's purchase.

- `referenceNumber` (number[22], optional) \
Reference number to be sent to payment method provider's service. Given value is used only if user selected payment method is configured as interface (i.e. own direct agreement with payment method provider), otherwise the reference number is generated automatically by Paytrail.

- `description` (all characters[65 000], optional) \
Any data about the order in text format can be sent to the payment system. The most usual pieces of data are customer name and contact information and order product information. They are shown in the Merchant's Panel in payment details.

- `currency` (upper case[3], required) \
Payment currency. Value must be EUR for Finnish banks, otherwise the payment will not be accepted.

- `locale` (all characters[5], optional) \
Localisation defines default language for the payment method selection page and presentation format for the sums. Available localisations are `fi_FI` , `sv_SE` and `en_US`. The default localisation is `fi_FI`.

- `price` (decimal number[10], optional) \
  Payment total. Send either exact payment data (`orderDetails`) or the payment total to the service. If you send only the payment total price, (_Klarna_ and _Collector_) invoice and instalment payment methods are not available and order details cannot be shown in the Merchant's Panel. We recommend using `orderDetails` record whenever it is possible. The value of price must be greater or equal than `0.65`.

- `urlSet` (required)

  - `success` (all characters[2048], required) \
    User is redirected to this URL after a successful payment to Paytrail.
  - `failure` (all characters[2048], required) \
    User is redirected to this URL after a cancelled or failed payment.
  - `notification` (all characters[2048], required) \
    Paytrail makes a request to this URL when the payment is marked as successful. The address is requested with the same GET parameters as the success address was when the payment was made. Notification request is typically executed within a few minutes from the payment.

- `orderDetails` (optional) \
Either `orderDetails` or payment sum price has to be specified. `orderDetails` record contains payer details and detailed order rows. We recommend using the `orderDetails` record whenever it is possible. If the `orderDetails` record is not supplied, invoice and instalment payment methods are not available and payer and order row details are not available in the Merchant's Panel. Payment method fees can only be used when the orderDetails record is used. Without orderDetails record the order details cannot be shown on the payment method selection page.

  - `includeVat` (0/1, required) \
  VAT included field shows if the product row prices include value added tax. Value `1` means that VAT is included in the shown price, and `0` that it will be added. Therefore, use `1`, if the prices in your webshop include value added tax and `0` if the prices do not include value added tax. If Collector payment method is used, then the value should be `1`, or the payment method is hidden from the payment method selection page.

  - `contact` (required)

    - `firstName` (all characters [64], required) \
      Customer's first name.
    - `lastName` (all characters [64], required) \
      Customer's surname.
    - `companyName` (all characters[128], optional) \
      Company name.
    - `email` (all characters[255], required) \
      Customer's email address.
    - `telephone` (all characters[64], optional) \
      Customer's telephone number.
    - `mobile` (all characters[64], optional) \
      Customer's mobile number.
    - `address` (required)
      - `street` (all characters [64], required) \
        Customer's street address.
      - `postalCode` (all characters[16], required) \
        Customer's postal code.
      - `postalOffice` (all characters[64], required) \
        Customer's post office.
      - `country` (capital letters[2], required) \
        Customer's country. The data is sent in **ISO-3166-1** format. For example, Finnish is `FI` and Swedish is `SE`. The data is used to verify credit history, and is thus required.

  - `products` (required)
    - `product` (recurring element [1,500])
      - `title` (all characters[255], required) \
        Product name in free format. The product title is shown in the Merchant's Panel and on Klarna service invoices on a product row. Product details are shown also on the payment method selection page.
      - `code` (all characters[16], optional) \
        Optional product number.
      - `amount` (decimal number[10], required) \
        If an order has several same products, you can enter the number of products here instead of having separate rows for each. Usually this field contains the value `1`. If Collector payment method is used, the value should be an integer. If a decimal such as `0.5` is used, Collector payment method is hidden from the payment method selection page.
      - `price` (decimal number[10], required) \
        Price for one product. If the field payment.orderDetails.includeVat = 0, the price excludes VAT. If the value is 1, the price includes VAT. The price can also be negative if you want to add discounts to the service. However, the total amount of the product rows must always be at least 0.65.
      - `vat` (decimal number[10], required) \
        Tax percentage for a product.
      - `discount` (decimal number[10], optional) \
        If you have reduced the product price, you can show the discount percentage as a figure between 0 and 100 in this field. Default is 0.
      - `type` (integer[1], optional) \
        A type can be specified for the product row. `1` = normal product row, `2` = shipping, `3` = handling. `1` can be used for all rows, but shipping and handling costs cannot be differentiated from the other rows. Default is `1`.
### Response

The service responds to request in the same format (_XML_ or _JSON_) as it was received. Return record root element is also called payment and it contains the following records:

- `orderNumber` (all characters[64]) \
  The order number sent on the request is returned as such.
- `token` (lower and upper case and numbers[64]) \
  Token is 64 characters long, specifying identifier for the payment, which is valid for 14 days or until the payment has been made. Token is needed as such with the payment method selection page embedding.
- `url` (all characters) \
  Address to which the customer is directed for making the payment. The URL also includes the token, which is used as a payment identifier.

### Examples

{{% notice note %}}The example XML and JSON messages have been wrapped and indented to make the message more readable. Messages returned by the interface do not contain such formatting.{{% /notice %}}

**Example: Payment creation with the REST interface – XML request**

```xml
<?xml version="1.0" encoding="UTF-8"?>
<payment>
  <orderNumber>12345678</orderNumber>
  <currency>EUR</currency>
  <locale>fi_FI</locale>
  <urlSet>
    <success>https://www.esimerkkikauppa.fi/sv/success</success>
    <failure>https://www.esimerkkikauppa.fi/sv/failure</failure>
    <pending></pending>
    <notification>https://www.esimerkkikauppa.fi/sv/notify</notification>
  </urlSet>
  <orderDetails>
    <includeVat>1</includeVat>
    <contact>
      <telephone>041234567</telephone>
      <mobile>041234567</mobile>
      <email>tester@esimerkkikauppa.fi</email>
      <firstName>Simon</firstName>
      <lastName>Seller</lastName>
      <companyName></companyName>
      <address>
        <street>Test street 1</street>
        <postalCode>12340</postalCode>
        <postalOffice>Helsinki</postalOffice>
        <country>FI</country>
      </address>
    </contact>
    <products>
      <product>
        <title>Example product</title>
        <code>XX-123</code>
        <amount>1.00</amount>
        <price>99.00</price>
        <vat>23.00</vat>
        <discount>0.00</discount>
        <type>1</type>
      </product>
      <product>
        <title>Example product 2</title>
        <code>XX-456</code>
        <amount>2.50</amount>
        <price>19.90</price>
        <vat>23.00</vat>
        <discount>0.00</discount>
        <type>1</type>
      </product>
    </products>
  </orderDetails>
</payment>
```

**Example: Payment creation with the REST interface – XML response**

```xml
<?xml version="1.0" encoding="UTF-8"?>
<payment>
  <orderNumber>12345678</orderNumber>
  <token>[SECRET TOKEN STRING GENERATED BY API]</token>
  <url>https://payment.paytrail.com/payment/load/token/[SECRET TOKEN STRING GENERATED BY API]</url>
</payment>
```

**Example: Payment creation with the REST interface – JSON request**

```json
{
  "orderNumber": "12345678",
  "currency": "EUR",
  "locale": "fi_FI",
  "urlSet": {
    "success": "https://www.esimerkkikauppa.fi/sv/success",
    "failure": "https://www.esimerkkikauppa.fi/sv/failure",
    "pending": "",
    "notification": "https://www.esimerkkikauppa.fi/sv/success"
  },
  "orderDetails": {
    "includeVat": "1",
    "contact": {
      "telephone": "041234567",
      "mobile": "041234567",
      "email": "tester@esimerkkikauppa.fi",
      "firstName": "Simon",
      "lastName": "Seller",
      "companyName": "",
      "address": {
        "street": "Test street 1",
        "postalCode": "12340",
        "postalOffice": "Helsinki",
        "country": "FI"
      }
    },
    "products": [
      {
        "title": "Example product",
        "code": "XX-123",
        "amount": "1.00",
        "price": "99.00",
        "vat": "23.00",
        "discount": "0.00",
        "type": "1"
      },
      {
        "title": "Example product 2",
        "code": "XX-456",
        "amount": "2.50",
        "price": "19.90",
        "vat": "23.00",
        "discount": "0.00",
        "type": "1"
      }
    ]
  }
}
```

**Example: Payment creation with the REST interface – JSON response**

```json
{
  "orderNumber": "12345678",
  "token": "[SECRET TOKEN STRING GENERATED BY API]",
  "url": "https://payment.paytrail.com/payment/load/token/[SECRET TOKEN STRING GENRATED BY API]"
}
```

**Example: Payment creation with the REST interface – XML request (light version)**

{{% notice note %}}This example describes the interface usage without orderDetails. Please note that the orderDetails record is recommended whenever it is possible. Without the orderDetails record, payment subscriber details and specified product rows cannot be shown in the Merchant's Panel and invoice and instalment payment methods are not supported. In addition, payment method fees are available only when using the orderDetails record.{{% /notice %}}

```xml
<?xml version="1.0" encoding="UTF-8"?>
<payment>
  <orderNumber>12345678</orderNumber>
  <currency>EUR</currency>
  <locale>fi_FI</locale>
  <urlSet>
    <success>https://www.esimerkkikauppa.fi/sv/success</success>
    <failure>https://www.esimerkkikauppa.fi/sv/failure</failure>
    <pending></pending>
    <notification>https://www.esimerkkikauppa.fi/sv/notify</notification>
  </urlSet>
  <price>99.00</price>
</payment>
```
