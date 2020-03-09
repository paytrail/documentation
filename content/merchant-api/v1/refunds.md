---
title: "Refunds"
draft: false
weight: 4
---

### Creating a Refund

#### Request

```http
POST /merchant/v1/payments/:orderNumber/refunds
```

Refunds are created using order numbers as identifiers. Merchants must use unique order numbers for Paytrail Merchant API to be able to link each refund to a single payment. The customer will be sent an email upon successful refund creation. Successful refund creation will return **HTTP status `202`** and refund location (link with a refund token). See section [General HTTP responses][responses].

#### Parameters

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

#### Return Codes

{{< table >}}
    <thead>
        <tr>
            <th>Code string and HTTP code</th>
            <th>Description</th>
            <th>Workaround</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>HTTP 202</td>
            <td>Successful refund request, refund was created</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>invalid-refund-rows (HTTP 400)</td>
            <td>The amount of rows to refund is invalid</td>
            <td>Check that you have at least one and less than the maximum amount of refund rows in your
                request</td>
        </tr>
        <tr>
            <td>invalid-amount (HTTP 400)</td>
            <td>A row sum is invalid</td>
            <td>Check that all refund rows have sums and that the sums conform to requirements</td>
        </tr>
        <tr>
            <td>invalid-vat-percent (HTTP 400)</td>
            <td>A VAT percent is invalid</td>
            <td>Check that all refund rows have VAT percents for E1 or E2 payments and that they conform to
                requirements</td>
        </tr>
        <tr>
            <td>invalid-description (HTTP 400)</td>
            <td>Description is too long</td>
            <td>Check that none of your descriptions is longer than the maximum length</td>
        </tr>
        <tr>
            <td>invalid-notify-url (HTTP 400)</td>
            <td>Notify URL is not a valid URL</td>
            <td>Check your notify URLs</td>
        </tr>
        <tr>
            <td>invalid-key (HTTP 400)</td>
            <td>An unknown key was encountered</td>
            <td>Check that your refund rows don't contain any extra keys</td>
        </tr>
        <tr>
            <td>missing-email (HTTP 400)</td>
            <td>
                There was no email given for S1 payment refund request (email is mandatory for bank and Collector
                refunds)
            </td>
            <td>Add customer's email address to the refund request</td>
        </tr>
        <tr>
            <td>invalid-interface (HTTP 400)</td>
            <td>Payments with older simple interface version 1 or 3 can't be refunded</td>
            <td>Use our newer payment interface so that you can create refunds in the future</td>
        </tr>
        <tr>
            <td>nonunique-payment-identifier (HTTP 400)</td>
            <td>Multiple payments could be found for the same order number</td>
            <td>Make sure your order numbers are unique</td>
        </tr>
        <tr>
            <td>payment-not-found (HTTP 404)</td>
            <td>No payment was found with given order number</td>
            <td>Check that your order number matches a payment made through our system</td>
        </tr>
        <tr>
            <td>payment-interface-type-does-not-support-refunding (HTTP 405)</td>
            <td>Refund request was made against a payment of unsupported interface type</td>
            <td>Check that the refund request was made against a payment made via Paytrail and not via a
                third party payment service</td>
        </tr>
        <tr>
            <td>payment-method-does-not-support-refunding (HTTP 405)</td>
            <td>Refund request was made against a payment of unsupported payment method</td>
            <td>Check that the refund request was made for a payment made with method which supports
                refunding</td>
        </tr>
        <tr>
            <td>payment-status-does-not-support-refunding (HTTP 405)</td>
            <td>Payment was in invalid state for refund to be made</td>
            <td>Check that the payment is in successfully completed state</td>
        </tr>
    </tbody>
{{< /table >}}

### Refund Details

#### Route

Merchant API refund details feature is not available for demo merchant (13466).

```http
GET /merchant/v1/refunds/:id
```

Returns refund details.

#### Parameters

- `id` (`string`, **required**) Refund token whose details are requested.

#### Request

```http
GET /merchant/v1/refunds/DA2OTA4NWVmYTRiMDUyMWI4OGNkNjkxNzBh HTTP/1.1
Timestamp: 2012-12-31T12:00:00+0200
Content-MD5: <base64 encoded 24 characters>
Authorization: PaytrailMerchantAPI <merchant id>:<base64 encoded 44 characters>
```

#### Response

##### Headers

```http
HTTP/1.1 200 OK
Content-Type: application/json
```

##### Body

```json
HTTP/1.1 200 OK
Content-Type: application/json
{
    "id": "DA2OTA4NWVmYTRiMDUyMWI4OGNkNjkxNzBh",
    "createdAt": "2015-01-02T14:00:02+00:00",
    "status": "created",
    "paymentId": "176456276154",
    "updatedAt": "2015-01-02T14:00:03+00:00",
    "originalAmount": -2000,
    "settledAmount": -2100,
    "merchantFees": {
        "transactionFee": -100
    },
    "currency": "EUR",
    "settlementId": "1234567"
}
```

#### Resource Specific Error Messages

- `invalid-refund-token` (**Code:** `404`) Invalid refund token. Check refund token. You can check the value from Merchant's Panel.

### Cancelling the Refund

#### Request

```http
DELETE /merchant/v1/refunds/:refundToken
```

The customer will be notified of a successful refund cancellation by email. DELETE is not allowed for card refunds. Response in case of card refund is 405.

#### Return Codes

- **HTTP 204:** Refund was cancelled successfully.
- **HTTP 404:** Refund was not found with given token. Check that you gave a non-empty token that points to an existing refund.
- **HTTP 405:** Refund cannot be cancelled from its current state. Check refund's status from Merchant's Panel. Note that `DELETE` is not allowed for card refunds. Response in case of card refund is **405**.


