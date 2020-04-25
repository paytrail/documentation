---
title: "Handling of Payment Information"
draft: false
weight: 2
---

After the customer has paid for the order, they will be redirected to the address defined in the field `RETURN_ADDRESS`. If the payment was cancelled or unsuccessful, the customer will be directed to the address defined in the field `CANCEL_ADDRESS`.

The field `NOTIFY_ADDRESS` can also be used. This address is called automatically when Paytrail confirms the payment. Typically the notify address is called right before redirecting to the return address. However, it is possible that customer will not come back to Paytrail's service after the payment. In these cases the payment will be confirmed with a delay of one bank day when the notify address will be called by Paytrail. The call for notify address contains the same `GET` parameters that are used when redirecting to return address.

{{% notice note %}}Payment status query services provided by payment method providers are NOT used to confirm channel payments as paid.{{% /notice %}}

GET parameters used when redirecting to return and cancel addresses and when calling notify addresses are described below. The payment’s validity has to be checked using the GET parameters.

### Product Rows

#### `ORDER_NUMBER`
This is the same order number that was sent to Paytrail by the sales channel. The order number will be used to individualize each payment.

#### `TIMESTAMP`
Timestamp created by Paytrail. This is used for calculating the `RETURN_AUTHCODE`. Timestamps are in UNIX format.

#### `PAID`
Value created by Paytrail. This is returned only with a successful payment.

#### `RETURN_AUTHCODE`
The sales channel compares this against the value they have calculated. If the value matches, payment information has been transferred correctly. The value matches even if the payment is cancelled or unsuccessful.

### Calculating the `RETURN_AUTHCODE`

The value is calculated as follows:

1. Create a string by combining the field's order number, timestamp, payment's paid value and merchant secret in this order. Insert a pipe character (`|`) between the fields. In case of an unsuccessful payment, the payment's paid value will not be returned and it is not to be included in the string.
2. Calculate the value using an MD5 hash function on the created string.
3. The value is a 32 byte hexadecimal string. Replace lower case letters with uppercase letters.

**Example of calculating the `RETURN_AUTHCODE`:**

The `RETURN_AUTHCODE` is calculated as described below.

- **Order number:** `123456`
- **Payment Sign:** `F4SDGF23FS`
- **Timestamp:** `1176557554`
- **Channel Secret:**

```plain
12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678
```

- **Created String:**

```plain
123456|1176557554|F4SDGF23FS|12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678
```

Calculated value in upper case: `7C597D787D71EFBBEC68275B5B9D13EF`

If the calculated value matches the value of `RETURN_AUTHCODE`, payment return is valid.
