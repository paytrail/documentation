---
title: Querying the Refund Details
draft: false
weight: 2
---

{{% notice warning %}}Merchant API refund details feature is not available for demo merchant (13466).{{% /notice %}}

### Route

Returns refund details.

```http
GET /merchant/v1/refunds/:id HTTP/1.1
```

### Parameters

#### `id`
**Type:** `String`

Required. Refund token whose details are requested.

### Request

```http
GET /merchant/v1/refunds/DA2OTA4NWVmYTRiMDUyMWI4OGNkNjkxNzBh HTTP/1.1
Timestamp: 2012-12-31T12:00:00+0200
Content-MD5: <base64 encoded 24 characters>
Authorization: PaytrailMerchantAPI <merchant id>:<base64 encoded 44 characters>
```

### Response

**Headers:**

```http
HTTP/1.1 200 OK
Content-Type: application/json
```

**Body:**

```json
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

### Resource Specific Error Messages

#### `invalid-refund-token (404)`

Invalid refund token. Check refund token. You can check the value from Merchant's Panel.
