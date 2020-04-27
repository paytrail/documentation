---
title: "Sales Channels for Marketplaces"
description: "Allow purchasing different products from different merchants in a single payment."
icon: "ti-shopping-cart-full"
draft: false
---

### Channel Description

The sales channel enables purchasing different products from different merchants in a single payment via Paytrail's service. Each merchant in the sales channel must have a sales channel agreement with Paytrail.

The channel provider can define a formula for taking a commission from every product in the channel. This formula is included in the agreement between the channel provider and Paytrail and must be used by the channel provider.

Paytrail charges its own commission for every payment made via the channel. This commission is also defined in the agreement between Paytrail and the channel provider. The channel provider is responsible for ensuring that the combined commissions do not exceed the total payment amount.

Merchants using a sales channel can review their payments in the Merchant's Panel. Each merchant can only see their own products sold in a single purchase bundle.

### Interface Description

The Sales Channel URL is <https://payment.paytrail.com/channel-payment>

The purchase bundle is sent to the service as a `POST` query. When a payment is completed, the customer will be redirected back to the return address defined by the payment channel. The parameters used to determine that payment has been successful are also sent to the return address.

### Limitations

Currently, the Sales Channel feature has following limitations.

* Refunds can not be processed through the Paytrail system.
* Only bank buttons and _Visa/MasterCard_ are available as payment methods (_Collector_ and _MobilePay_ are unavailable).
