---
title: Creating a Refund
draft: false
weight: 1
---

### Route

Refunds are created using order numbers as identifiers. Merchants must use unique order numbers for Paytrail Merchant API to be able to link each refund to a single payment. The customer will be sent an email upon successful refund creation. Successful refund creation will return **HTTP status `202`** and refund location (link with a refund token). See section [General HTTP responses][responses].

```http
POST /merchant/v1/payments/:orderNumber/refunds
```

### Parameters

- `email` (`string`, **optional**) \
  When specified, the given email will be used for the refund. Required if the payment was made through the S1 interface if payment is not paid using card (email is not required for card payments).
- `rows` (`array [1, 500]`, **required**)
  - `amount` (`integer`, **required**) \
    How much money to refund in cents (`>0–2000000`) with VAT included. The payment must have this much money left to refund, and for the right VAT percent, in case E1 or E2 interface with product rows was used.
  - `vatPercent` (`integer`, **required/not allowed**) \
    Which VAT percent to allocate the refund to, expressed in fractions of a hundred (0 – 10 000).
  - `description` (`string`, **optional**) \
    Description for the refund shown as product row name. This is visible to the customer as well.
- `notifyUrl` (`string`, **optional**) \
  A Valid webhook URL to call when a refund's status updates.

[responses]: {{< relref "merchant-api/v1/accessing#responses" >}}

### Return Codes

Successful refund request and refund creation will be responded with **HTTP 202** response. In case of errors, we return a string and a code explained below.

#### `invalid-refund-rows (HTTP 400)`
The amount of rows to refund is invalid. Check that you have at least one and less than the maximum amount of refund rows in your request.

#### `invalid-amount (HTTP 400)`
A row sum is invalid. Check that all refund rows have sums and that the sums conform to requirements.

#### `invalid-vat-percent (HTTP 400)`
A VAT percent is invalid. Check that all refund rows have VAT percents for E1 or E2 payments and that they conform to requirements.

#### `invalid-description (HTTP 400)`
Description is too long. Check that none of your descriptions is longer than the maximum length.

#### `invalid-notify-url (HTTP 400)`
Notify URL is not a valid URL. Check your notify URLs.

#### `invalid-key (HTTP 400)`
An unknown key was encountered. Check that your refund rows don't contain any extra keys.

#### `missing-email (HTTP 400)`
There was no email given for S1 payment refund request (email is mandatory for bank and Collector refunds). Add customer's email address to the refund request.

#### `invalid-interface (HTTP 400)`
Payments with older simple interface version 1 or 3 can't be refunded. Use our newer payment interface so that you can create refunds in the future.

#### `nonunique-payment-identifier (HTTP 400)`
Multiple payments could be found for the same order number. Make sure your order numbers are unique.

#### `payment-not-found (HTTP 404)`
No payment was found with given order number. Check that your order number matches a payment made through our system.

#### `payment-interface-type-does-not-support-refunding (HTTP 405)`
Refund request was made against a payment of unsupported interface type. Check that the refund request was made against a payment made via Paytrail and not via a third party payment service.

#### `payment-method-does-not-support-refunding (HTTP 405)`
Refund request was made against a payment of unsupported payment method Check that the refund request was made for a payment made with method which supports refunding.

#### `payment-status-does-not-support-refunding (HTTP 405)`
Payment was in invalid state for refund to be made. Check that the payment is in successfully completed state.