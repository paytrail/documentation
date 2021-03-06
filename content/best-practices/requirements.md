---
title: Payment Method Requirements
draft: false
weight: 2
---

A number of payment methods have strict requirements when posting a new payment to Paytrail. This page lists the payment method related information which you should consider when developing your integration.

***

### Collector

* VAT must be included in the price (`VAT_IS_INCLUDED = 1`).
* Item quantity (`ITEM_QUANTITY[N]`) should be an integer.
* Product details should be sent with the `ITEM_*` fields.
* Customer details should be sent with the `PAYER_PERSON_*` fields.
* Maximum payment total is **5000 €**.

### Jousto

* Payment total sum must be between **20–3000 €**.

### Paypal

* Only available as an interface.
* Requires own agreement with PayPal and is hidden until credentials are saved in Merchant's Panel.
