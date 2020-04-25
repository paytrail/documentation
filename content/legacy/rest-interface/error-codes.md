---
title: "Error Codes"
draft: false
---

The following fields are the error codes returned during an unsuccessful payment creation.

#### `invalid-content-type`
In the HTTP POST request the `Content-Type` header contains an incorrect type. Allowed types are `application/xml` for XML and `application/json` for JSON.

#### `invalid-data-xml`
Error in processing received XML data or XML invalid.

#### `invalid-data-json`
Error in processing received JSON data or JSON invalid.

#### `invalid-order-number`
Order number (`orderNumber`) missing or incorrect.

#### `invalid-reference-number`
Sent reference number (`referenceNumber`) incorrect. The reference number must conform to the reference number standard.

#### `invalid-reference-number-used`
Sent reference number (`referenceNumber`) incorrect. The reference number has been used for another payment.

#### `invalid-description,`
Order description (`description`) incorrect.

#### `invalid-url-set`
Required data structure `urlSet` not specified or incorrect.

#### `invalid-url-success`
Required return address for successful payment (`urlSet.success`) missing or incorrect.

#### `invalid-url-failure`
Required return address for failed payment (`urlSet.failure`) missing or incorrect.

#### `invalid-url-pending`
Return address for pending payment (`urlSet.pending`) incorrect.

#### `invalid-url-notification`
Notify address (`urlSet.notification`) missing or incorrect.

#### `invalid-currency`
Currency not specified or incorrect. Only `EUR` is supported.

#### `invalid-locale`
Localisation incorrect. Allowed options are `fi_FI`, `en_US` and `sv_SE`.

#### `missing-order-details-and-price`
Order details (`orderDetails`) or payment sum (`price`) must be specified. Your request did not contain either of them.

#### `order-details-and-price-defined`
Only one of the required records, either order details (`orderDetails`) or payment sum (`price`) needs to be specified. Your request includes both records.

#### `invalid-vat-mode`
VAT flag (`includeVat`) not specified or incorrect.

#### `invalid-contact`
Order details did not contain contact information (contact) or record was incorrect.

#### `invalid-contact-telephone`
Incorrect contact person's telephone number (`telephone`).

#### `invalid-contact-mobile`
Incorrect contact person's mobile phone number (`mobile`).

#### `invalid-contact-first-name`
Incorrect or missing contact person's first name (`firstName`).

#### `invalid-contact-last-name`
Incorrect or missing contact person's surname (`firstName`).

#### `invalid-contact-company-name`
Incorrect contact person's company name (`companyName`).

#### `invalid-contact-email`
Incorrect or missing contact person's email address (`email`).

#### `invalid-contact-address`
Incorrect or missing contact person's address record (`address`).

#### `invalid-contact-address`
Incorrect or missing contact person's address record street address (`street`).

#### `invalid-contact-postal-code`
Incorrect or missing contact person's address record postal code (`postalCode`).

#### `invalid-contact-postal-office`
Incorrect or missing contact person's address record post office (`postalOffice`).

#### `invalid-contact-country`
Incorrect or missing contact person's address record country (`country`).

#### `invalid-products`
Incorrect or missing product record (`products`).

#### `invalid-products-amount`
Incorrect number of product records in products record (`products`). There must be at least 1 product and at most 500 products.

#### `invalid-product-title`
Incorrect or missing product name (`title`) in product record.

#### `invalid-product-code`
Incorrect product code (`code`) in product record.

#### `invalid-product-amount`
Incorrect or missing number of products (`amount`) in product record.

#### `invalid-product-price`
Incorrect or missing product price (`price`) in product record.

#### `invalid-product-vat`
Incorrect or missing Value Added Tax (`vat`) in product record.

#### `invalid-product-discount`
Incorrect discount percentage (`discount`) in product record.

#### `invalid-product-type`
Incorrect product type (`type`) in product record.

#### `invalid-price`
Incorrect payment sum (`price`).

#### `invalid-total-price`
Product row total too low or too high.
