---
title: "Terminology"
description: "Don't get it? Don't sweat it. Check out the definitions from our glossary."
icon: "ti-book"
draft: false
type: docs
weight: 8
---

### General

**Payment** – On the _Merchant's_ website, the _Customer_ selects items and is sent to Paytrail's service to pay for them, creating a payment in Paytrail's service. The money goes from the Customer's account to one of Paytrail's accounts. Paytrail then transfers the money to the Merchant.

**Customer** – A consumer, the customer of a merchant, the person making a payment.

**Merchant** – A customer of Paytrail. Runs the web application in which the Paytrail services are used. The merchant sells a product or service online to its customers.

**Paytrail Payment Service** – Service that allows customers to pay for purchases to the Merchant. Includes all popular payment methods in Finland.

**Paytrail Sales Channel** – A channel where multiple merchants can sell their products in one location (like an online marketplace or mall). This allows the customer to buy from several different merchants and make only one payment.

**Paytrail Merchant API** – REST service for merchants where they can create and cancel refunds, opt to receive updates for any status changes of a refund and retrieve settlement, payment and refund details.

### Settlements

**Settlement** – The payment(s) made by the _Customer_ that Paytrail transfers to the _Merchant_ based on the settlement type selected. Settlements always have a _delay_.

**Aggregate Settlements** – Payments made during a set time period (bank day, calendar day, week, or month) that are paid out to the merchant as a single reference payment.

**Individual Settlements** – Each payment is paid out to the merchant as a reference payment. The reference is sent in the payment creation data.

**Settlement Delay** – Payments are paid out after a delay that depends on the payment method used. Typical delays are 1 banking day for bank button payments, 5 banking days for card payments, and 3 banking days for Collector Bank.
