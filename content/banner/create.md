---
title: "Creating a Link to the Banner"
draft: false
weight: 1
---

- The URL of the image is <https://img.paytrail.com/index.svm>
- Add the `GET` parameters `id`, `type`, `cols`, `text` and `auth`
  - `id` is the Merchant ID (e.g. `13466`)
  - `type` accepts the following values: `vertical` and `horizontal`
  - `cols` defines the number of columns to use. The parameter accepts values from 2 to 20.
  - `text` defines if the banner info text should be displayed. The text currently says _"Suomen Verkkomaksut on nyt Paytrail"_. The text is available in Finnish only. The text is displayed at the bottom of a vertical banner or the right hand edge of a horizontal one. If the parameter is not used, the text is not displayed. Values are `0` (text not displayed) and `1` (text is displayed).
  - `auth` is used to authenticate the merchant. Calculate as follows:
    - Form a string by combining the merchant ID and the merchant secret, e.g. `134666pKF4jkv97zmqBJ3ZL8gUw5DfT2NMQ`.
    - Calculate an MD5 sum using this string.
    - The `auth` parameter should be the first 16 characters of the MD5 sum

**Example: Creating the Banner URL**

The demo merchant has a merchant ID `13466` and a merchant secret `6pKF4jkv97zmqBJ3ZL8gUw5DfT2NMQ`, so to calculate the MD5 sum the following string is used: `134666pKF4jkv97zmqBJ3ZL8gUw5DfT2NMQ`.

The resulting MD5 sum is `f6483cce23771e8f9282cb6abbff9fe9`.

The first 16 characters are: `f6483cce23771e8f`.

To form a vertical image with 2 columns and the text _"Suomen Verkkomaksut on nyt Paytrail"_, The URL is: <https://img.paytrail.com/index.svm?id=13466&type=vertical&cols=2&text=1&auth=f6483cce23771e8f>
