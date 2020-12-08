---
title: "Querying Payment Details"
draft: false
weight: 4
---

### Route

{{< notice note >}}Merchant API payment details feature is not available for demo merchant (13466).{{< /notice >}}

```http
GET /merchant/v1/payments/:id HTTP/1.1
```

Returns payment details.

### Parameters

- `id` (`string`, **required**): Payment whose details are requested (customer's payment identification code without hyphen).

### Request

```http
GET /merchant/v1/payments/176456276154 HTTP/1.1
Timestamp: 2012-12-31T12:00:00+0200
Content-MD5: <base64 encoded 24 characters>
Authorization: PaytrailMerchantAPI <merchant id>:<base64 encoded 44 characters>
```

### Response

#### Headers

```http
HTTP/1.1 200 OK
Content-Type: application/json
```

#### Body

```json
{
    "id": "176456276154",
    "referenceNumber": "10034",
    "orderNumber": "ORDER-2",
    "createdAt": "2015-01-02T12:00:03+00:00",
    "status": "paid",
    "paymentMethodId": 2,
    "payerName": "Teppo Teikäläinen",
    "amounts": {
        "original": 10000,
        "charged": 10000,
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
    "paymentServiceProvider": "Paytrail",
    "paymentServiceType": "collecting",
    "settlementId": "1234567",
    "refunds": [
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
    ]
}
```

#### Possible payment status transitions

All possible status changes are listed [here][status-changes].

{{< figure src="/images/payment-status-transitions.svg" caption="**Payment status transitions.**" >}}

### Resource Specific Error Messages

- `invalid-consumer-payment-id` (**Code:** `404`) Invalid consumer payment ID. Check the consumer payment ID. You can check the value from Merchant Panel.


[status-changes]: {{< ref "payments/status-changes" >}}
