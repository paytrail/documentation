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
  
#### Calculation Formula

```rb
base64_encode(
    hmac_sha256_binary(
        :requestMethod + "\n" +
            :url + "\n" +
            "PaytrailMerchantAPI " + :merchantId + "\n" +
            :timestamp + "\n" +
            :base64ContentMd5,
        :merchantSecret
    )
)
```

#### Example Signature Calculation for Refund Creation

- **API Key (Merchant ID):** `13466`
- **Merchant Secret:** `6pKF4jkv97zmqBJ3ZL8gUw5DfT2NMQ`
- **Timestamp:** `2020-03-09T12:00:00+0200`
- **Order Number:**	`15153`
- **URL:** `/merchant/v1/payments/15153/refunds`
- **Method:** `POST`
- **Content:**

```json
{
    "email": "john.doe@mycustomer.com",
    "notifyUrl": "https://example.com/notify",
    "rows": [
        {
            "amount": 1599,
            "description": "Long sleeve shirt",
            "vatPercent": 2400
        }
    ]
}
```

Note that there are no newlines before or after first and last curly braces. Newline character here is `\n`.

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
