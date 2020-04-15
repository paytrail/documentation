---
title: "Calculating the AUTHCODE for a State Query"
draft: false
---

`AUTHCODE` is calculated from a string which combines _Merchant Secret_, _Merchant ID_ and _Order Number_. All variables are separated by `&` (ampersand). Hash is calculated from this string using the MD5 algorithm, and the result is then transformed to a 32 character hexadecimal string and converted to upper case letters.

**Example: Calculating the `AUTHCODE`**

- Merchant Secret: `6pKF4jkv97zmqBJ3ZL8gUw5DfT2NMQ`
- Merchant ID: `13466`
- Order Number: `15153`

Combine the previous fields to: `6pKF4jkv97zmqBJ3ZL8gUw5DfT2NMQ&13466&15153`

Calculate the MD5 hash which results in `eea431ef1c0a17d0045ab2ac39d118cf`. Finally, convert letters to upper case to get `EEA431EF1C0A17D0045AB2AC39D118CF`.
