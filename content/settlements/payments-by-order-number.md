---
title: "Querying Payments by Order number"
draft: false
weight: 3
---

### Route

{{< notice note >}}Merchant API payments by order number feature is not available for demo merchant (13466).{{< /notice >}}

```http
GET /merchant/v1/payments?order_number=<order_number> HTTP/1.1
```

Returns all matching payments in array of JSON objects.

### Parameters

- `order_number` (`string`, **required**): Payment(s) whose details are requested.

### Request

```http
GET /merchant/v1/payments?order_number=ORDER-2 HTTP/1.1
Timestamp: 2020-04-30T12:00:00+0200
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

##### With one matching payment

```json
[
    {
        "id": "176456276154",
        "referenceNumber": "10034",
        "orderNumber": "ORDER-2",
        "createdAt": "2015-01-02T12:00:03+00:00",
        "status": "paid",
        "paymentMethodId": 2
    }
]
```

##### With multiple matching payments

```json
[
    {
        "id": "176456276154",
        "referenceNumber": "10034",
        "orderNumber": "ORDER-2",
        "createdAt": "2015-01-02T12:00:03+00:00",
        "status": "paid",
        "paymentMethodId": 2
    },
    {
        "id": "176456277000",
        "referenceNumber": "10070",
        "orderNumber": "ORDER-2",
        "createdAt": "2020-01-31T12:00:03+00:00",
        "status": "paid",
        "paymentMethodId": 3
    }
]
```

### Resource Specific Error Messages

- `invalid-order-number` (**Code:** `404`) Invalid order number. Check the order number. You can check the value from Merchant's Panel.

