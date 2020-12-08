---
title: "Possible Status Changes"
draft: false
---

{{< figure src="/images/payment-status-transitions.svg" caption="**Payment status transitions.**" >}}

### `Waiting Payment => Paid`

### `Waiting Payment => Cancelled`

### `Cancelled => Waiting Payment`
If the customer returns to the payment in one way or the other.

### `Cancelled => Paid`
If the payer has first cancelled the payment for some reason, and our system later finds a charge from Bank statements or APIs. In this case a call will be made to the `URL_NOTIFY` address.s
