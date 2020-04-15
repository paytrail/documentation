---
title: "PHP"
draft: false
---

When the payment service is integrated to an application developed in PHP, the easiest way to implement the payment service is to use our module, which connects to Paytrail payment service JSON interface.

**Example: Using the payment service PHP class**

```php
<?php

require_once "Paytrail_Module_Rest.php";

// An object is created to model all payment return URLs
$urlset = new Paytrail_Module_Rest_Urlset(
    "https://www.demoshop.com/sv/success", // return URL for successful payment
    "https://www.demoshop.com/sv/failure", // return URL for failed payment
    "https://www.demoshop.com/sv/notify",  // URL for payment confirmation from Paytrail server
    ""  // pending url is not in use
);

// An object is created to model payer's data
$contact = new Paytrail_Module_Rest_Contact(
    "Test",                             // first name
    "Person",                           // surname
    "test.person@democompany.com",      // email address
    "Test street 1",                    // street address
    "12340",                            // postal code
    "Helsinki",                         // post office
    "FI",                               // country (ISO-3166)
    "040123456",                        // telephone number
    "",                                 // mobile phone number
    "Demo Company Ltd"                  // company name
);

// Payment creation
$orderNumber = "1";                     // Use distinguished order number
$payment = new Paytrail_Module_Rest_Payment_E1($orderNumber, $urlset, $contact);

// Adding one or more product rows to the payment
$payment->addProduct(
    "Test product", // product title
    "01234",        // product code
    "1.00",         // product quantity
    "19.90",        // product price (per piece)
    "23.00",        // Tax percentage
    "0.00",         // Discount percentage
    Paytrail_Module_Rest_Product::TYPE_NORMAL // Product type
);

// Changing payment default settings
// Changing payment method selection page language into English here
// The default language is Finnish. See other options from PHP class
$payment->setLocale("en_US");

// Sending payment to Paytrail service and handling possible errors
$module = new Paytrail_Module_Rest(13466, "");
try {
    $result = $module->processPayment($payment);
}
catch (Paytrail_Exception $e) {
    // processing the error
    // Error description available $e->getMessage()
    die("Error in creating payment to Paytrail service");
}

// Using the URL Paytrail returned for the desired payment method
// User is immediately directed to the received address
header("Location: {$result->getUrl()}");
```

**Example: Using the payment service PHP class without contact and product data**

```php
<?php

require_once "Paytrail_Module_Rest.php";

// An object is created to model all payment return addresses
$urlset = new Paytrail_Module_Rest_Urlset(
    "https://www.demoshop.com/sv/success", // return address for successful payment
    "https://www.demoshop.com/sv/failure", // return address for failed payment
    "https://www.demoshop.com/sv/notify",  // address for payment confirmation from Paytrail server
    ""  // pending url not in use
);

// Payment creation
$orderNumber = "1";                     // Use distinguished order number
$price = 99.00;                         // Total  (incl. VAT)
$payment = new Paytrail_Module_Rest_Payment_S1($orderNumber, $urlset, $price);

// Changing payment default settings
// Changing payment method selection page language into English here
// The default language is Finnish. See other options from PHP class
$payment->setLocale("en_US");

// Sending payment to Paytrail service and handling possible errors
$module = new Paytrail_Module_Rest(13466, "");
try {
    $result = $module->processPayment($payment);
}
catch (Paytrail_Exception $e) {
    // processing the error
    // Error description available $e->getMessage()
    die("Error in creating payment to Paytrail service");
}

// Using the URL Paytrail returned for the desired payment method
// User is immediately directed to the received address
header("Location: {$result->getUrl()}");
```

**Example: Confirming payment receipt with PHP class**

```php
require_once "Paytrail_Module_Rest.php";

$module = new Paytrail_Module_Rest(13466, "");
if ($module->confirmPayment($_GET["ORDER_NUMBER"], $_GET["TIMESTAMP"], $_GET["PAID"], $_GET["METHOD"], $_GET["RETURN_AUTHCODE"])) {
    // Payment receipt is valid
    // If needed, the used payment method can be found from the variable $_GET["METHOD"]
    // and order number for the payment from the variable $_GET["ORDER_NUMBER"]
} else {
    // Payment receipt was not valid, possible payment fraud attempt
}
```
