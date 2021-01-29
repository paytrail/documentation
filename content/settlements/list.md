---
title: Listing Settlements
draft: false
weight: 1
---

### Request

Returns settlements created between selected time span.

```http
GET /merchant/v1/settlements?fromDate=from&toDate=to HTTP/1.1
```

### Parameters

#### `fromDate`
**Type:** `Date[YYYY-MM-DD]`

Required. Invalid date format or invalid time span will return an empty response (HTTP 404 and `invalid-date-format error`).

#### `toDate`
**Type:** `Date[YYYY-MM-DD]`

Required. Invalid date format or invalid time span will return an empty response (HTTP 404 and `invalid-date-format` error).

### Return Values

#### `id`
**Type:** `String[64]`

#### `referenceNumber`
**Type:** `Integer[32]`

#### `settledAmount`
**Type:** `Integer[50000000]`

The amount settled to the merchant. Amount is in the currency's smallest unit (e.g. in cents for euros).

#### `settledAt`
**Type:** Timestamp

The exact time the settlement was paid to merchant's bank account. Can be `null` if not yet paid.

#### `currency`
**Type:** `String[3]`

ISO 3-letter symbol in uppercase for settlement currency (e.g. `EUR`).

#### Request

```http
GET /merchant/v1/settlements?fromDate=2015-01-01&toDate=2015-02-01 HTTP/1.1
Timestamp: 2012-12-31T12:00:00+0200
Content-MD5: <base64 encoded 24 characters>
Authorization: PaytrailMerchantAPI <merchant id>:<base64 encoded 44 characters>
```

#### Response

**Headers:**

```http
HTTP/1.1 200 OK
Content-Type: application/json
```

**Body:**

```json
[
    {
        "id": "1234567",
        "referenceNumber": "123456123456",
        "settledAt": "2015-03-05",
        "settledAmount": 6685,
        "currency": "EUR"
    }
]
```

#### Resource Specific Error Codes

##### `invalid-date-range (404)`
Invalid date range. Check that date range is not over two months.

##### `invalid-date-format (404)`
Invalid date format. Check that date format is correct (`YYYY-MM-DD`).
