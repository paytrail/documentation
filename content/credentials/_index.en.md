---
title: "Test Credentials"
description: "Use the test credentials to test the payment flow."
icon: "ti-lock"
draft: false
type: docs
weight: 6
---

**Paytrail Payment Service** is testable using merchant ID `13466` and merchant secret `6pKF4jkv97zmqBJ3ZL8gUw5DfT2NMQ`. These test credentials work with [form interface][form], [REST interface][rest] and payment method selection page embedding.

[form]: {{< ref "payments" >}}
[rest]: {{< ref "rest-interface" >}}

**Shopify** gateway is testable using merchant ID `13466` and Shopify token `d3d86c09e781a00dda469e420166623f67a618e6`.

The test credentials for the Finnish banks and credit cards are listed below. They can be used with the test credentials to test the complete payment process without making any real payments.

{{< notice warning >}}Payment methods **MobilePay**, **Jousto** and **Collector** are not available for the test merchant, and can't be tested.{{< /notice >}}

{{< notice note >}}**Osuuspankki** does not currently have working test credentials and cannot be tested.{{< /notice >}}

{{< notice note >}}Paytrail sets a minimum amount of **0,65 €** for test payment. Payments with amount below will give `System error - unknown error` message on payment page.{{< /notice >}}

### Nordea
Require no credentials, you can return accepted or failed payment.

### Danske Bank
Use your own user ID for testing. Payments will not be charged on your bank account.

### Ålandsbanken
- **User ID:** `12345678`
- **ID code:** `1234`
- **Security code:** Any four digits
  
{{% notice note %}}Ålandsbanken test environment accepts only http User-Agent `Mozilla/5.0(Unknown;Linuxx86_64)AppleWebKit/534.34(KHTML,likeGecko) AABDemoTest/1.00 Safari/534.34` in order payment to success.{{% /notice %}}

### Handelsbanken
- **User ID:** System fills it for you.
- **ID code:** System fills it for you.

### Aktia
- **User ID:** `12345678`
- **Password:** `123456`
- **Security code:** `1234`

### POP Pankki
- **User ID:** Bank's web site will provide these for you.
- **Password:** Bank's web site will provide these for you.
- **Security code:** Bank's web site will provide these for you.

### Säästöpankki
- **User ID:** Bank's web site will provide these for you.
- **Password:** Bank's web site will provide these for you.
- **Security code:** Bank's web site will provide these for you.

### S-Pankki
- **User ID:** `12345678`
- **Password:** `9999`
- **Security code:** `1234`

### Visa
- **Card Number:** `4925000000000004`
- **Expiry:** Later than current date
- **CVC:** Any 3 digits

### MasterCard
- **Card Number:** `5413000000000000`
- **Expiry:** Later than current date
- **CVC:** Any 3 digits

### American Express
- **Card Number:** `375700000000002`
- **Expiry:** Later than current date
- **CVC:** Any 3 digits

Card transaction errors can be simulated by setting the payment amount in following way.

The amount ranges `0.01` to `0.99` and `1.01` to `4.99` will always make the credit card to return a response code that is not OK. These ranges will return their decimal parts as the response code, e.g. the amount `1.52` triggers the response code **52**. Paytrail considers the payments that receive an error code as failed payments.

### Oma Säästöpankki
- **User ID:** Bank's web site will provide these for you.
- **Password:** Bank's web site will provide these for you.
- **Security code:** Bank's web site will provide these for you.
