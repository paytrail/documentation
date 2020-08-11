---
title: "Payment Methods in Checkout"
description: "Display payment methods in the checkout instead of Paytrail's payment page."
icon: ti-gallery
draft: false
type: docs
weight: 3
---

This selection introduces payment method specific settings. Field `PAYMENT_METHODS` (only available in the [E2 interface][e2])) for selecting and hiding methods and a list of special payment method specific restrictions can be found [here][payment-methods].

It is possible to bypass the Paytrail payment method selection page and implement the payment method selection directly to the checkout page on the website by providing a single payment method value in the `PAYMENT_METHODS` field. The customer is then directed from the website to the payment method they selected.

Bypassing the payment method page allows you to implement the payment method selection to match the look and feel of the website. Good alternatives for implementing the payment method selection are a dropdown menu or separate images for each payment method.
Payment page bypass is a premium feature (contact our customer service team for more information) that enables the selection of the payment method already on the website. When using bypass, the customer is directed to the selected payment service without visibly passing through Paytrail’s service.

[Download payment method logos and banner ↓ (_129 KB, ZIP_)](https://cdn2.hubspot.net/hubfs/335946/Files/Verkkomaksupainikkeet-logot-ja-bannerit.zip)

[e2]: {{< ref "payments/e2-interface/fields" >}}

[payment-methods]: {[< ref "payment-methods/values/" >]}