---
title: "Settlements"
description: "Settlements can be created easily via Paytrail Merchant API."
icon: "ti-money"
draft: false
type: docs
weight: 5
---

{{< notice warning >}}Merchant API settlements feature is not available for demo merchant (13466).{{< /notice >}}

{{< notice note >}}An agreement modification is required to enable settlements via Merchant API.{{< /notice >}}

### Request

```http
GET /merchant/v1/settlements?fromDate=from&toDate=to
```

Returns settlements created between selected timespan.

### Parameters

- `from` (date [YYYY-MM-DD], **required**) Invalid date format or invalid time span will return empty response (404 and `invalid-date-format error`)
- `to` (date [YYYY-MM-DD], **required**) Invalid date format or invalid time span will return empty response (404 and `invalid-date-format` error).

{{< table caption="Structure and detailed information on returned values" >}}
    <thead>
        <tr>
            <th>Parameter name</th>
            <th>Datatype</th>
            <th>Format</th>
            <th>Occurence</th>
            <th>Max length/value</th>
            <th>Value contains</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>&nbsp;</td>
            <td>array</td>
            <td>&nbsp;</td>
            <td>1</td>
            <td>&nbsp;</td>
            <td>This is the main level array that contains all found settlement objects</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>hash</td>
            <td>&nbsp;</td>
            <td>0-N</td>
            <td>&nbsp;</td>
            <td>A settlement object</td>
        </tr>
        <tr>
            <td>id</td>
            <td>string</td>
            <td>&nbsp;</td>
            <td>1</td>
            <td>64</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>referenceNumber</td>
            <td>number</td>
            <td>&nbsp;</td>
            <td>1</td>
            <td>32</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>settledAmount</td>
            <td>number</td>
            <td>&nbsp;</td>
            <td>1</td>
            <td>50000000</td>
            <td>How much money was settled to merchant? Amount is in the currency's smallest unit. e.g. in
                Euro cents</td>
        </tr>
        <tr>
            <td>settledAt</td>
            <td>date</td>
            <td>timestamp</td>
            <td>1</td>
            <td>null / date</td>
            <td>When the settlement was paid to merchant's bank account. Can be null if it's not yet paid.
            </td>
        </tr>
        <tr>
            <td>currency</td>
            <td>string</td>
            <td>&nbsp;</td>
            <td>1</td>
            <td>3</td>
            <td>ISO 3 letter symbol for settlement currency e.g. "EUR"</td>
        </tr>
    </tbody>
{{< /table >}}

#### Request

```http
GET /merchant/v1/settlements?fromDate=2015-01-01&amp;toDate=2015-02-01 HTTP/1.1
Timestamp: 2012-12-31T12:00:00+0200
Content-MD5: <base64 encoded 24 characters>
Authorization: PaytrailMerchantAPI <merchant id>: <base64 encoded 44 characters>
```

#### Response

##### Headers

```http
HTTP/1.1 200 OK
Content-Type: application/json
```

##### Body

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

- `invalid-date-range` (Code: `404`) Invalid date range. Check that date range is not over two months.
- `invalid-date-format` (Code: `404`) Invalid date format. Check that date format is correct (_YYYY-MM-DD_).

### Settlement Details

#### Request

Merchant API settlement details feature is not available for demo merchant (13466).

```http
GET /merchant/v1/settlements/:id
```

Returns settlement details.

#### Parameters

- `id` (`string`, **mandatory**) Settlement whose details are requested.

{{< table caption="Structure and detailed information on returned values" >}}
    <thead>
        <tr>
            <th>Parameter name</th>
            <th>Datatype</th>
            <th>Format</th>
            <th>Occurence</th>
            <th>Max length/value</th>
            <th>Value contains</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>&nbsp;</td>
            <td>hash</td>
            <td>&nbsp;</td>
            <td>1</td>
            <td>&nbsp;</td>
            <td>A settlement object</td>
        </tr>
        <tr>
            <td>id</td>
            <td>string</td>
            <td>&nbsp;</td>
            <td>1</td>
            <td>64</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>referenceNumber</td>
            <td>number</td>
            <td>&nbsp;</td>
            <td>1</td>
            <td>32</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>settledAmount</td>
            <td>number</td>
            <td>&nbsp;</td>
            <td>1</td>
            <td>50000000</td>
            <td>How much money was settled to merchant? Amount is in the currency's smallest unit. e.g. in
                Euro cents</td>
        </tr>
        <tr>
            <td>settledAt</td>
            <td>date</td>
            <td>timestamp</td>
            <td>1</td>
            <td>null / date</td>
            <td>When the settlement was paid to merchant's bank account. Can be null if it's not yet paid.
            </td>
        </tr>
        <tr>
            <td>currency</td>
            <td>string</td>
            <td>&nbsp;</td>
            <td>1</td>
            <td>3</td>
            <td>ISO 3 letter symbol for settlement currency e.g. "EUR"</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>array</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>This is the main level array that contains all found payment objects</td>
        </tr>
        <tr>
            <td>payments</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>1-N</td>
            <td>&nbsp;</td>
            <td>a payment object</td>
        </tr>
        <tr>
            <td>id</td>
            <td>number</td>
            <td>&nbsp;</td>
            <td>1</td>
            <td>12</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>referenceNumber</td>
            <td>number</td>
            <td>&nbsp;</td>
            <td>1</td>
            <td>32</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>orderNumber</td>
            <td>string</td>
            <td>&nbsp;</td>
            <td>1</td>
            <td>64</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>createdAt</td>
            <td>date</td>
            <td>timestamp</td>
            <td>1</td>
            <td>date</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>status</td>
            <td>string</td>
            <td>&nbsp;</td>
            <td>1</td>
            <td>&nbsp;</td>
            <td>
                Possible values:
                "waiting payment",
                "paid",
                "cancelled",
                "waiting acceptance"
            </td>
        </tr>
        <tr>
            <td>paymentMethodId</td>
            <td>number</td>
            <td>&nbsp;</td>
            <td>1</td>
            <td>&nbsp;</td>
            <td>Payment method id, see available methods from <a class="link" href="ch04s04.html"
                    title="4.4.&nbsp;Selection and visibility of payment methods">selection and visibility
                    of payment methods</a></td>
        </tr>
        <tr>
            <td>payerName</td>
            <td>string</td>
            <td>&nbsp;</td>
            <td>1</td>
            <td>32</td>
            <td>Payer name, only available for bank payments</td>
        </tr>
        <tr>
            <td>amounts</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>1</td>
            <td>&nbsp;</td>
            <td>Payment amounts object</td>
        </tr>
        <tr>
            <td>original</td>
            <td>number</td>
            <td>&nbsp;</td>
            <td>1</td>
            <td>50000000</td>
            <td>Amount provided in payment data from web shop</td>
        </tr>
        <tr>
            <td>charged</td>
            <td>number</td>
            <td>&nbsp;</td>
            <td>1</td>
            <td>50000000</td>
            <td>Charged amount</td>
        </tr>
        <tr>
            <td>settled</td>
            <td>number</td>
            <td>&nbsp;</td>
            <td>1</td>
            <td>50000000</td>
            <td>Amount settled to merchant</td>
        </tr>
        <tr>
            <td>currency</td>
            <td>string</td>
            <td>&nbsp;</td>
            <td>1</td>
            <td>3</td>
            <td>ISO 3 letter symbol for settlement currency e.g. "EUR"</td>
        </tr>
        <tr>
            <td>consumerFees</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>1</td>
            <td>&nbsp;</td>
            <td>Payment consumer fees object</td>
        </tr>
        <tr>
            <td>paymentMethod</td>
            <td>number</td>
            <td>&nbsp;</td>
            <td>1</td>
            <td>50000000</td>
            <td>Payment method fee</td>
        </tr>
        <tr>
            <td>currency</td>
            <td>string</td>
            <td>&nbsp;</td>
            <td>1</td>
            <td>3</td>
            <td>ISO 3 letter symbol for settlement currency e.g. "EUR"</td>
        </tr>
        <tr>
            <td>merchantFees</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>1</td>
            <td>&nbsp;</td>
            <td>Payment merchant fees object</td>
        </tr>
        <tr>
            <td>transaction</td>
            <td>number</td>
            <td>&nbsp;</td>
            <td>1</td>
            <td>50000000</td>
            <td>Transaction fee</td>
        </tr>
        <tr>
            <td>provision</td>
            <td>number</td>
            <td>&nbsp;</td>
            <td>1</td>
            <td>50000000</td>
            <td>Provision</td>
        </tr>
        <tr>
            <td>currency</td>
            <td>string</td>
            <td>&nbsp;</td>
            <td>1</td>
            <td>3</td>
            <td>ISO 3 letter symbol for settlement currency e.g. "EUR"</td>
        </tr>
        <tr>
            <td>paymentServiceProvider</td>
            <td>string</td>
            <td>&nbsp;</td>
            <td>1</td>
            <td>&nbsp;</td>
            <td>
                Possible values:
                "Paytrail"
            </td>
        </tr>
        <tr>
            <td>paymentServiceType</td>
            <td>string</td>
            <td>&nbsp;</td>
            <td>1</td>
            <td>&nbsp;</td>
            <td>
                Possible values:
                "collecting",
                "direct"
            </td>
        </tr>
        <tr>
            <td>refunds</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>0-N</td>
            <td>&nbsp;</td>
            <td>A refund object (refunds linked to payment)</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>array</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>This is the main level array that contains all found refund objects</td>
        </tr>
        <tr>
            <td>id</td>
            <td>string</td>
            <td>&nbsp;</td>
            <td>1</td>
            <td>64</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>createdAt</td>
            <td>date</td>
            <td>timestamp</td>
            <td>1</td>
            <td>date</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>status</td>
            <td>string</td>
            <td>&nbsp;</td>
            <td>1</td>
            <td>&nbsp;</td>
            <td>
                Possible values:
                "created",
                "completed",
                "cancelled"
            </td>
        </tr>
        <tr>
            <td>paymentId</td>
            <td>number</td>
            <td>&nbsp;</td>
            <td>1</td>
            <td>12</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>updatedAt</td>
            <td>date</td>
            <td>timestamp</td>
            <td>1</td>
            <td>null / date</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>originalAmount</td>
            <td>number</td>
            <td>&nbsp;</td>
            <td>1</td>
            <td>50000000</td>
            <td>Original fee</td>
        </tr>
        <tr>
            <td>settledAmount</td>
            <td>number</td>
            <td>&nbsp;</td>
            <td>1</td>
            <td>50000000</td>
            <td>Amount settled to merchant</td>
        </tr>
        <tr>
            <td>merchantFees</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>1</td>
            <td>&nbsp;</td>
            <td>Payment merchant fees object</td>
        </tr>
        <tr>
            <td>transactionFee</td>
            <td>number</td>
            <td>&nbsp;</td>
            <td>1</td>
            <td>50000000</td>
            <td>Transaction fee</td>
        </tr>
        <tr>
            <td>currency</td>
            <td>string</td>
            <td>&nbsp;</td>
            <td>1</td>
            <td>3</td>
            <td>ISO 3 letter symbol for settlement currency e.g. "EUR"</td>
        </tr>
        <tr>
            <td>settlementId</td>
            <td>string</td>
            <td>&nbsp;</td>
            <td>1</td>
            <td>64</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>refunds</td>
            <td>string</td>
            <td>&nbsp;</td>
            <td>0-N</td>
            <td>&nbsp;</td>
            <td>A refund object (refunds linked to settlement)</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>array</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>This is the main level array that contains all found refund objects</td>
        </tr>
        <tr>
            <td>id</td>
            <td>string</td>
            <td>&nbsp;</td>
            <td>1</td>
            <td>64</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>createdAt</td>
            <td>date</td>
            <td>timestamp</td>
            <td>1</td>
            <td>date</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>status</td>
            <td>string</td>
            <td>&nbsp;</td>
            <td>1</td>
            <td>&nbsp;</td>
            <td>
                Possible values:
                "created",
                "completed",
                "cancelled"
            </td>
        </tr>
        <tr>
            <td>paymentId</td>
            <td>number</td>
            <td>&nbsp;</td>
            <td>1</td>
            <td>12</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>updatedAt</td>
            <td>date</td>
            <td>timestamp</td>
            <td>1</td>
            <td>null / date</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>originalAmount</td>
            <td>number</td>
            <td>&nbsp;</td>
            <td>1</td>
            <td>50000000</td>
            <td>Original fee</td>
        </tr>
        <tr>
            <td>settledAmount</td>
            <td>number</td>
            <td>&nbsp;</td>
            <td>1</td>
            <td>50000000</td>
            <td>Amount settled to merchant</td>
        </tr>
        <tr>
            <td>merchantFees</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>1</td>
            <td>&nbsp;</td>
            <td>Payment merchant fees object</td>
        </tr>
        <tr>
            <td>transactionFee</td>
            <td>number</td>
            <td>&nbsp;</td>
            <td>1</td>
            <td>50000000</td>
            <td>Transaction fee</td>
        </tr>
        <tr>
            <td>currency</td>
            <td>string</td>
            <td>&nbsp;</td>
            <td>1</td>
            <td>3</td>
            <td>ISO 3 letter symbol for settlement currency e.g. "EUR"</td>
        </tr>
        <tr>
            <td>settlementId</td>
            <td>string</td>
            <td>&nbsp;</td>
            <td>1</td>
            <td>64</td>
            <td>&nbsp;</td>
        </tr>
    </tbody>
</table>
{{< /table >}}

#### Request

```http
GET /merchant/v1/settlements/123451234512345 HTTP/1.1
Timestamp: 2012-12-31T12:00:00+0200
Content-MD5: <base64 encoded 24 characters>
Authorization: PaytrailMerchantAPI <merchant id>: <base64 encoded 44 characters>
```

#### Response

```http
HTTP/1.1 200 OK
Content-Type: application/json
```

```json
{
    "id": "1234567",
    "referenceNumber": "123456123456",
    "settledAt": "2015-03-05"
    "settledAmount": 6865,
    "currency": "EUR",
    "payments": [
        {
            "id": "176456276154",
            "referenceNumber": "10034",
            "orderNumber": "ORDER-2",
            "createdAt": "2015-01-02T12:00:03+00:00",
            "status": "paid",
            "paymentMethodId": 2,
            "payerName": "Teppo Teik\u00e4l\u00e4inen",
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
                    "status": "settlement linked",
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
        {
            "id": "GbLhiDev1rNh3SnfjJVvevRExTPq15stFrVsqWKm",
            "createdAt": "2015-01-01T14:14:09+00:00",
            "status": "completed",
            "paymentId": "92736276154",
            "updatedAt": "2015-01-01T14:18:08+00:00",
            "originalAmount": -3000,
            "settledAmount": -3100,
            "merchantFees": {
                "transactionFee": -100
            },
            "currency": "EUR",
            "settlementId": "1234567"
        }
    ],
}
```

#### Resource Specific Error Messages

- `invalid-settlement-id` (**Code:** `404`) Invalid ID. Check settlement ID format.
