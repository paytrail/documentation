---
title: Querying Settlement Details
draft: false
weight: 2
---

### Route

Returns settlement details.

```http
GET /merchant/v1/settlements/:id HTTP/1.1
```

#### Request

```http
GET /merchant/v1/settlements/123451234512345 HTTP/1.1
Timestamp: 2012-12-31T12:00:00+0200
Content-MD5: <base64 encoded 24 characters>
Authorization: PaytrailMerchantAPI <merchant id>: <base64 encoded 44 characters>
```

#### Response

**Headers:**

```http
HTTP/1.1 200 OK
Content-Type: application/json
```

**Body:**

```js
// A settlement object
{
    "id": "123451234512345",
    "referenceNumber": "123456123456",
    // When the settlement was paid to merchant's bank account. Can be null if it's not yet paid.
    "settledAt": "2015-03-05",
    // How much money was settled to merchant? Amount is in the currency's smallest unit. e.g. in Euro cents
    "settledAmount": 6865,
    // ISO 3 letter symbol for settlement currency e.g. "EUR"
    "currency": "EUR",
    "payments": [
        // A payment object
        {
            "id": "176456276154",
            "referenceNumber": "10034",
            "orderNumber": "ORDER-2",
            "createdAt": "2015-01-02T12:00:03+00:00",
            // Possible values: "waiting payment", "paid", "cancelled", "waiting acceptance"
            "status": "paid",
            "paymentMethodId": 2,
            // Payer name, only available for bank payments
            "payerName": "John Doe",
            "amounts": {
                // Amount provided in payment data from web shop
                "original": 10000,
                // Charged amount
                "charged": 10000,
                // Amount settled to merchant
                "settled": 9965,
                "currency": "EUR"
            },
            "consumerFees": {
                "paymentMethod": 0,
                "currency": "EUR"
            },
            "merchantFees": {
                "transaction": -35,
                "provision": 0,
                "currency": "EUR"
            },
            // Possible values: "Paytrail"
            "paymentServiceProvider": "Paytrail",
            // Possible values: "collecting", "direct"
            "paymentServiceType": "collecting",
            "settlementId": "123451234512345",
            "refunds": [
                // refunds linked to payment
                {
                    "id": "DA2OTA4NWVmYTRiMDUyMWI4OGNkNjkxNzBh",
                    "createdAt": "2015-01-02T14:00:02+00:00",
                    // Possible values: "created", "completed", "cancelled"
                    "status": "completed",
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
            ]
        }
    ],
    "refunds": [
        // Refunds linked to settlement
        {
            "id": "GbLhiDev1rNh3SnfjJVvevRExTPq15stFrVsqWKm",
            "createdAt": "2015-01-01T14:14:09+00:00",
            // Possible values: "created", "completed", "cancelled"
            "status": "completed",
            "paymentId": "92736276154",
            "updatedAt": "2015-01-01T14:18:08+00:00",
            "originalAmount": -3000,
            "settledAmount": -3100,
            "merchantFees": {
                "transactionFee": -100
            },
            "currency": "EUR",
            "settlementId": "123451234512345"
        }
    ],
}
```

#### Resource Specific Error Messages

#####  `invalid-settlement-id (404)`
Invalid ID. Check settlement ID format.
