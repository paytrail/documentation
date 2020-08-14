---
title: "Creating Payments"
description: "Find out how to integrate our payment service."
icon: "ti-credit-card"
draft: false
type: docs
weight: 2
---

Payment service integration is done by either implementing a payment button, or by embedding a selection of payment methods in a website to enable the immediate payment of an order. The information of completed payment is instantly relayed back to the website.

When using the [E2 interface][e2], the payment data is created as a form on the web applications page. The consumer sends this form to the payment service. The payment is then completed in the web browser as an immediate result of the customer's actions.

{{< figure src="/images/payment_method_page_desktop.png" caption="**Screenshot of the Payment Method Page on Desktop.**" width="75%" >}}

{{< figure src="/images/payment_method_page_mobile.png" caption="**Screenshot of the Payment Method Page on Mobile.**" width="50%" >}}

Payment page bypass option for the E2 interface allows bypassing the Paytrail payment page and can be used to implement bank payment buttons directly on a website.

[Embedding][embedding] the payment method page can be used together to display the payment method selection directly on a website. Implementing the embedded payment method selection page is done by adding a short _JavaScript_ call to the page.

[e2]: {{< ref "payments/e2-interface" >}}
[embedding]: {{< ref "legacy/embedding" >}}
