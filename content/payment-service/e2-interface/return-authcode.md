---
title: "RETURN_AUTHCODE calculation"
date: 2020-03-05T14:08:24+02:00
lastmod: 2020-03-05T14:08:24+02:00
draft: false
weight: 4
---

{{< table caption="Example of calculation" >}}
    <tbody>
        <tr>
            <td>ORDER_NUMBER</td>
            <td>ORDER-12345</td>
        </tr>
        <tr>
            <td>PAYMENT_ID</td>
            <td>123456789012</td>
        </tr>
        <tr>
            <td>AMOUNT</td>
            <td>200.00</td>
        </tr>
        <tr>
            <td>TIMESTAMP</td>
            <td>1491896573</td>
        </tr>
        <tr>
            <td>STATUS</td>
            <td>PAID</td>
        </tr>
        <tr>
            <td>Merchant authentication hash</td>
            <td>6pKF4jkv97zmqBJ3ZL8gUw5DfT2NMQ</td>
        </tr>
    </tbody>
</table>
{{< /table >}}

Combining these fields using the `|` character as separator, the following string is formed:

```plain
ORDER-12345|123456789012|200.00|1491896573|PAID|6pKF4jkv97zmqBJ3ZL8gUw5DfT2NMQ
```

Calculating the **SHA-256** hash of this string, we get (note uppercase): 

```plain
86CC6A9B9433D3AC1D8D1B8D21ED87DA3ABE2E980D3F826D1901FEF0925F5D03
```

If the calculated value equals the one received from the Payment Gateway (`RETURN_AUTHCODE`), the receipt is correct.
