---
title: "Calculating RETURN_AUTHCODE"
draft: false
weight: 5
---

### Fields for the `RETURN_AUTHCODE`

#### `ORDER_NUMBER`
`ORDER-12345`

#### `PAYMENT_ID`
`123456789012`

#### `AMOUNT`
`200.00`

#### `TIMESTAMP`
`1491896573`

#### `STATUS`
`PAID`

#### `MERCHANT AUTHENTICATION HASH`
`6pKF4jkv97zmqBJ3ZL8gUw5DfT2NMQ`

### Calculation Formula

Combining these fields using the `|` character as separator, the following string is formed:

```plain
ORDER-12345|123456789012|200.00|1491896573|PAID|6pKF4jkv97zmqBJ3ZL8gUw5DfT2NMQ
```

Calculating the **SHA-256** hash of this string, we get (note uppercase): 

```plain
86CC6A9B9433D3AC1D8D1B8D21ED87DA3ABE2E980D3F826D1901FEF0925F5D03
```

If the calculated value equals the one received from the Payment Gateway (`RETURN_AUTHCODE`), the receipt is correct.
