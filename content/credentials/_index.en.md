---
title: "Test Credentials"
date: 2020-03-05T09:21:40+02:00
lastmod: 2020-03-05T09:21:40+02:00
description: "Try Paytrail with a test merchant before buying."
icon: "ti-lock"
draft: false
type: docs
---

The Payment Service is testable using merchant ID `13466` and merchant secret `6pKF4jkv97zmqBJ3ZL8gUw5DfT2NMQ`. These test credentials work with form interface, REST interface and payment method selection page embedding.

Shopify gateway is testable using merchant ID `13466` and Shopify token `d3d86c09e781a00dda469e420166623f67a618e6`.

The test credentials for the Finnish banks and credit cards are listed below. They can be used with the test credentials to test the complete payment process without making any real payments.

```plain
Nordea
  ID: 123456
  Password: 1234

Osuuspankki
  User ID: 123456
  Password: 7890
  Keynumber: Any number

Danske Bank
  Use your own user ID for testing. Payments will not be charged on your bank account.

Ålandsbanken
  User ID: 12345678
  ID code: 1234

Handelsbanken
  User ID: System fills it for you
  ID code: System fills it for you

Aktia
  User ID: 12345678
  Password: 123456
  Security code: 1234

POP Pankki
  User ID: Bank's web site will provide these for you
  Password: Bank's web site will provide these for you
  Security code: Bank's web site will provide these for you

Säästöpankki
  User ID: Bank's web site will provide these for you
  Password: Bank's web site will provide these for you
  Security code: Bank's web site will provide these for you

S-Pankki
  User ID: 12345678
  Password: 9999
  Security code: 1234

Visa
  Card number: 4925000000000004
  Expiry: > today
  CVC: any 3 digits

MasterCard
  Card number: 5413000000000000
  Expiry: > today
  CVC: any 3 digits

American Express
  Card number: 375700000000002
  Expiry: > today
  CVC: any 3 digits

  Card transaction errors can be simulated by setting the payment amount in following way.
  The amount ranges 0.01 to 0.99 and 1.01 to 4.99 will always make the credit card to return a response code that is not OK.
  These ranges will return their decimal parts as the response code, e.g. the amount 1.52 triggers the response code 52.
  Paytrail will consider the payments that receive an error code as failed payments.

Oma Säästöpankki
   User ID: Bank's web site will provide these for you
   Password: Bank's web site will provide these for you
   Security code: Bank's web site will provide these for you

  Remember that Paytrail also sets a minimum limit for payment amount that is 0,65 €.
```
