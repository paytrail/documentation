---
title: "Payment Service"
icon: "ti-file"
description: "Find out how to use Paytrail payment service through different interfaces."
icon: "ti-credit-card"
draft: false
type: docs
---

{{< figure src="payment-page.png" title="Figure: Payment Page" alt="Payment Page" >}}

Payment service integration is done by either implementing a payment button, or by embedding a selection of payment methods in a web shop to enable the immediate payment of an order. The information of completed payment is instantly relayed back to the web shop.

There are two integration types for implementing the Paytrail payment service.

With the REST interface the payment is created in advance by a XML or JSON request, and the interface responds with a payment token and a URL address. To complete the payment, the customer is redirected to the URL address. The REST interface can thus be used to send a payment link to the customer by e.g. email.

When using the FORM interface, the payment data is created as a form on the web applications page. The consumer sends this form to the payment service. The payment is then completed in the web browser as an immediate result of the customer's actions.

Payment page bypass option for FORM interface allows bypassing the Paytrail payment page and can be used to implement bank payment buttons directly in a web shop.

The payment method page embedding can be used together with either of these implementations to display the payment method selection directly in a web shop. Implementing the embedded payment method selection page is done by adding a short JavaScript call to the page.
