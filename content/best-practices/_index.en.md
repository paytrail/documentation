---
title: "Best Practices"
description: "Don't know where to begin? Follow our guide for integrating Paytrail to your shop seamlessly."
icon: "ti-wand"
draft: false
type: docs
weight: 1
---

### Introduction

We aim to make integrating to Paytrail services as easy as possible for merchants. Choices made during the technical implementation have a radical impact on the user experience towards the merchant and the consumer.

In this document, we explain the **best practices** for integrating our payment service so that merchants can take full advantage of it from the first day.

This guide is also available in Finnish as a [**presentation**](https://app.seidat.com/presentation/shared/5DoJ4FM7F27b7fXGz/0/0).

### Paytrail 101: Optimized Integration

* Use collecting settlements and handle refunds through Paytrail
* Use payment page bypass to improve merchant's payment conversion
* Bring extended information about the consumer for Paytrail to enable using all the payment methods
* Use **Merchant API** for creating refunds directly from the webshop management portal and modifying the settlement materials to satisfy your financial systems

### Payment Methods

We recommend choosing **E2** as the primary interface for payments due to its security and better features. E2 is our latest and greatest interface and the most flexible one in terms of developing integrations. Among other things E2 interface allows bypassing the payment page and defining custom return values.

#### Important Fields

**Make a note of the following essential fields in the E2 interface.**

* `ORDER_NUMBER` (_required_) for targeting payments
* `PARAMS_IN` (_required_) for defining the data passed into Paytrail systems
* `PARAMS_OUT` (_required_) for defining the data passed in return to the webshop
* `REFERENCE_NUMBER` (_optional_) for providing your reference number in single settlements
* `URL_NOTIFY` (_optional_) for enabling real-time payment confirmations and notifications
* `PAYMENT_METHODS` (_optional_) for bypassing the payment page and hiding payment methods

**We also recommend using the following optional fields.**

* `LOCALE` for defining the default language of the payment page
* `VAT_IS_INCLUDED = 1` supported with all payment methods
* `PAYER_*` fields contain payer information such as name, address and email, and should be used to enable all the payment methods and Sales Rescue features
* `ITEM_*` fields contain the required product details to enable all the payment methods

#### Use Payment Page Bypass

We encourage you to use the payment page bypass to remove an additional step from the payment process. Usually, our payment service redirects the consumer to the payment page for selecting a payment method. Using the bypass allows the merchant to display the payment methods in their shop or service aligning the purchasing process with the merchant's brand and improving the conversion.

### Refunds

We recommend using **Merchant API** for initiating refunds from the webshop management portal for all payment methods. Our API supports initiating and cancelling both partial and full refunds.

Note that you can initiate a refund with any amount greater than zero and less or equal than the paid amount. You should also keep in mind the included VAT of the original payment.

Passing the **Notify URL** allows you to receive a confirmation when the refund has been completed or cancelled.

### Settlements

Daily settlements delivered via the **Merchant API** contain payments and refunds as single rows. You can search the settlements through REST endpoints in JSON format. The settlement data contains payments, refunds, and transaction fees.

For example, the following HTTP request returns settlement IDs from the given period.

```http
GET /merchant/v1/settlements?fromDate=from&toDate=to
```

The following HTTP request returns full settlement details with the given settlement ID.

```http
GET /merchant/v1/settlements/:id
```

You can also use the Merchant API in your bookkeeping. The payment is created in Paytrail so that we use the invoice number as the order number (`ORDER_NUMBER`). Settlement data is fetched from the Merchant API and modified to match the settlement material provided by the bank (`ORDER_NUMBER` = reference number from the bank). You may then pass the amended bank materials into the financial software. The settlement with the reference is booked into another account and excluded from the bookkeeping.

### Documentation

Full specifications and materials are available here in the Paytrail integration guide and our website. You can also use the commercial descriptions of our service with your business.
