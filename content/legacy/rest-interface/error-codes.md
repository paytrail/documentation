---
title: "Error Codes"
draft: false
---

{{< table caption="Error codes in payment creation" >}}
    <thead>
        <tr>
            <th>Error code</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>invalid-content-type</td>
            <td>In HTTP POST request the Content-Type header contains an incorrect type. Allowed types are
                application/xml and application/json.</td>
        </tr>
        <tr>
            <td>invalid-data-xml</td>
            <td>Error in processing received XML data or XML invalid.</td>
        </tr>
        <tr>
            <td>invalid-data-json</td>
            <td>Error in processing received JSON data or JSON invalid.</td>
        </tr>
        <tr>
            <td>invalid-order-number</td>
            <td>Order number (orderNumber) missing or incorrect.</td>
        </tr>
        <tr>
            <td>invalid-reference-number</td>
            <td>Sent reference number (referenceNumber) incorrect. Reference number must conform to the
                reference number standard.</td>
        </tr>
        <tr>
            <td>invalid-reference-number-used</td>
            <td>Sent reference number (referenceNumber) incorrect. The reference number has been used for
                another payment.</td>
        </tr>
        <tr>
            <td>invalid-description</td>
            <td>Order description (description) incorrect.</td>
        </tr>
        <tr>
            <td>invalid-url-set</td>
            <td>Required data structure urlSet not specified or incorrect.</td>
        </tr>
        <tr>
            <td>invalid-url-success</td>
            <td>Required return address for successful payment (success) in data structure urlSet missing
                or incorrect.</td>
        </tr>
        <tr>
            <td>invalid-url-failure</td>
            <td>Required return address for failed payment (failure) in data structure urlSet missing or
                incorrect.</td>
        </tr>
        <tr>
            <td>invalid-url-pending</td>
            <td>Return address for pending payment (pending) in data structure urlSet incorrect.</td>
        </tr>
        <tr>
            <td>invalid-url-notification</td>
            <td>Notify address (notification) in data structure urlSet missing or incorrect.</td>
        </tr>
        <tr>
            <td>invalid-currency</td>
            <td>Currency not specified or incorrect. Only "EUR" is supported.</td>
        </tr>
        <tr>
            <td>invalid-locale</td>
            <td>Localisation incorrect. Allowed options are "fi_FI", "en_US" and "sv_SE".</td>
        </tr>
        <tr>
            <td>missing-order-details-and-price</td>
            <td>Order details (orderDetails) or payment sum (price) must be specified. Your request did not
                contain either of them.</td>
        </tr>
        <tr>
            <td>order-details-and-price-defined</td>
            <td>Only one of the required records, either order details (orderDetails) or payment sum
                (price) needs to be specified. Your request includes both records.</td>
        </tr>
        <tr>
            <td>invalid-vat-mode</td>
            <td>Including Value Added Tax (includeVat) not specified or incorrect.</td>
        </tr>
        <tr>
            <td>invalid-contact</td>
            <td>Order details did not contain contact information (contact) or record was incorrect.</td>
        </tr>
        <tr>
            <td>invalid-contact-telephone</td>
            <td>Incorrect contact person's telephone number (telephone).</td>
        </tr>
        <tr>
            <td>invalid-contact-mobile</td>
            <td>Incorrect contact person's mobile phone number (mobile).</td>
        </tr>
        <tr>
            <td>invalid-contact-first-name</td>
            <td>Incorrect or missing contact person's first name (firstName).</td>
        </tr>
        <tr>
            <td>invalid-contact-last-name</td>
            <td>Incorrect or missing contact person's surname (firstName).</td>
        </tr>
        <tr>
            <td>invalid-contact-company-name</td>
            <td>Incorrect contact person's company name (companyName).</td>
        </tr>
        <tr>
            <td>invalid-contact-email</td>
            <td>Incorrect or missing contact person's email address (email).</td>
        </tr>
        <tr>
            <td>invalid-contact-address</td>
            <td>Incorrect or missing contact person's address record (address).</td>
        </tr>
        <tr>
            <td>invalid-contact-address</td>
            <td>Incorrect or missing contact person's address record street address (street).</td>
        </tr>
        <tr>
            <td>invalid-contact-postal-code</td>
            <td>Incorrect or missing contact person's address record postal code (postalCode).</td>
        </tr>
        <tr>
            <td>invalid-contact-postal-office</td>
            <td>Incorrect or missing contact person's address record post office (postalOffice).</td>
        </tr>
        <tr>
            <td>invalid-contact-country</td>
            <td>Incorrect or missing contact person's address record country (country).</td>
        </tr>
        <tr>
            <td>invalid-products</td>
            <td>Incorrect or missing product record (products).</td>
        </tr>
        <tr>
            <td>invalid-products-amount</td>
            <td>Incorrect number of product records in products record (products). There must be at least 1
                product and at most 500 products.</td>
        </tr>
        <tr>
            <td>invalid-product-title</td>
            <td>Incorrect or missing product name (title) in product record.</td>
        </tr>
        <tr>
            <td>invalid-product-code</td>
            <td>Incorrect product code (code) in product record.</td>
        </tr>
        <tr>
            <td>invalid-product-amount</td>
            <td>Incorrect or missing number of products (amount) in product record.</td>
        </tr>
        <tr>
            <td>invalid-product-price</td>
            <td>Incorrect or missing product price (price) in product record.</td>
        </tr>
        <tr>
            <td>invalid-product-vat</td>
            <td>Incorrect or missing Value Added Tax (vat) in product record.</td>
        </tr>
        <tr>
            <td>invalid-product-discount</td>
            <td>Incorrect discount percentage (discount) in product record.</td>
        </tr>
        <tr>
            <td>invalid-product-type</td>
            <td>Incorrect product type (type) in product record.</td>
        </tr>
        <tr>
            <td>invalid-price</td>
            <td>Incorrect payment sum (price).</td>
        </tr>
        <tr>
            <td>invalid-total-price</td>
            <td>Product row total too low or too high.</td>
        </tr>
    </tbody>
</table>
{{< /table >}}
