---
title: "Accessing the Merchant API"
draft: false
weight: 2
---

## Authentication

API requests are authenticated through HTTP authentication. See _Authorization_ header description for details.

### Headers

- **Timestamp**: Request timestamp. Must be the same as what is used for signature calculation.
- **Content-MD5:** Base64 encoded MD5 sum for the request body contents. For GET requests content is always empty and content-MD5 is calculated of empty string.
- **Authorization:** Authentication details. Format is `PaytrailMerchantAPI <merchant id>:<signature>`. The value is a Base 64 encoding of binary SHA256 MAC of the request details using merchant secret as the secret key.
- **Refund-Origin** If using Payment ID from payment return parameters, this field is required and value is set to `internal`. Using Payment ID is recommended, since it's always unique value unlike order number.
  
#### Calculation Formula

$authenticationHash = base64_encode(
    hash_hmac(
        'sha256',
        implode("\n", [
            $method,
            $url,
            "PaytrailMerchantAPI {$merchantId}",
            $timestamp,
            $contentMd5,
        ]),
        $merchantSecret,
        true
    )
);

MD5 hash is calculated from content
```php
$contentMd5 = base64_encode(hash('md5', $content, true));
```
In case of `GET` and `POST` requests there is no content in message and `$content` is just empty string in content MD5 calculation.

#### Example Signature Calculation for Refund Creation

- **API Key (Merchant ID):** `13466`
- **Merchant Secret:** `6pKF4jkv97zmqBJ3ZL8gUw5DfT2NMQ`
- **Timestamp:** `2020-05-01T12:00:00+0300`
- **Order Number:**	`102402728626`
- **URL:** `https://api.paytrail.com/merchant/v1/payments/102402728626/refunds`
- **Method:** `POST`
- **Content MD5** `nYDNvmvsxI4ZxJL8OghRTw==` 
- **Content:**

```json
{"rows":[{"amount":1000,"description":"Test Product","vatPercent":2400}],"email":"customer@email.com","notifyUrl":"https:\/\/url.to.shop\/apiNotification\/"}
```

Calculated authentication hash in this case is `YqpU4WCsnBn7XLOqNd29bu/qfybVP4kIsbeOKOrSifU=`.

More detailed PHP example can be found from our [**examples**][examples-gh].

### Responses

The API has general responses that may be returned for all of the API queries.

- **HTTP 202:** Accepted + Location header indicating created resource + No content in body.
- **HTTP 204:** No content + No specific headers + No content in body.
- **HTTP 400:** Bad request (invalid JSON).
- **HTTP 403:** Forbidden (invalid API name or invalid signature). Error is shown also when merchant API is not activated for merchant id used in request.
- **HTTP 404:** Not found.
- **HTTP 405:** Method not allowed.
- **HTTP 503:** Service temporarily unavailable.

The response body is a JSON message when a status code `4xx` or `5xx` is returned.

#### `invalid-signature (HTTP 403)`
Signature is not valid. Check signature calculation.

#### `invalid-api-name (HTTP 403)`
API name is not valid. Check that API name is `PaytrailMerchantAPI`.

#### `merchant-inactive (HTTP 403)`
Merchant specified with the API key is inactive. Please contact customer support.

#### `refunds-not-enabled (HTTP 403)`
Merchant does not have refunds enabled. Please contact customer support.

#### `invalid-json (HTTP 400)`
JSON parsing failed. Check that JSON input is valid.

#### `service-unavailable (HTTP 503)`
Refunding service is currently unavailable. Please try again later.

### Example JSON Structure with Invalid API Name

```json
{
  "error": {
    "title": "invalid-api-name",
    "description": "API name is not valid",
    "workaround": "Check that API name is PaytrailMerchantAPI"
  }
}
```

[examples-gh]: https://github.com/paytrail/examples/blob/master/PHP/CalculateMerchantApiHash.php
