---
title: "Fields to be sent to payment gateway"
date: 2020-03-05T14:08:24+02:00
lastmod: 2020-03-05T14:08:24+02:00
draft: false
---

Following form describes fields to be sent to payment gateway.

Payment gateway address is: <https://payment.paytrail.com/e2>

Supported character sets are **UTF-8** and **ISO-8859-1**. These character sets cannot be mixed.

Field necessity is marked in column _Required/Optional_. Some optional columns have default values which are used if no value is provided in payment data.

{{% notice note %}} Values may not contain '|' characters (pipe, vertical bar). These values must be removed or replaced by other character before sending to Paytrail service. If you need to use '|' in URLs, we recommend having URL parameter values encoded. Especially '|' must be replaced with string %7C. {{% /notice %}}

{{% notice warning %}} Payment total is defined using AMOUNT or at least one order row ITEM_UNIT_PRICE. It is possible to use both but we strongly recommend not to use AMOUNT when order rows are provided. {{% /notice %}}

{{< table caption="Fields to be sent to payment gateway with interface version E2" >}}
    <thead>
        <tr>
            <th>Field name</th>
            <th>Description</th>
            <th>Required/Optional</th>
            <th>Default value</th>
            <th>Notes</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>MERCHANT_ID</td>
            <td>Merchant ID is the merchant identification number given by Paytrail.</td>
            <td>R</td>
            <td>&nbsp;</td>
            <td>For testing use 13466.</td>
        </tr>
        <tr>
            <td>CURRENCY</td>
            <td>Currency.</td>
            <td>O</td>
            <td>EUR</td>
            <td>Only EUR is accepted.</td>
        </tr>
        <tr>
            <td>URL_SUCCESS</td>
            <td>URL where customer is redirected after successful payment.</td>
            <td>R</td>
            <td>&nbsp;</td>
            <td>PARAMS_OUT are added to URL_SUCCESS</td>
        </tr>
        <tr>
            <td>URL_CANCEL</td>
            <td>URL where customer is redirected after failed or cancelled payment.</td>
            <td>R</td>
            <td>&nbsp;</td>
            <td>PARAMS_OUT are added to URL_CANCEL</td>
        </tr>
        <tr>
            <td>ORDER_NUMBER</td>
            <td>Order number is used to identify one transaction.</td>
            <td>R</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>AMOUNT</td>
            <td>Price is given in euros and cents. Price is given without currency type and decimals are
                separated with a dot. Price must contain two decimals.</td>
            <td>R/-</td>
            <td>&nbsp;</td>
            <td>AMOUNT or minimum of one order row with ITEM_UNIT_PRICE is required to define payment
                total. Minimum
                price accepted by the service is 0.65€.</td>
        </tr>
        <tr>
            <td>PARAMS_IN</td>
            <td>Comma separated list of fields used in AUTHCODE calculation.</td>
            <td>R</td>
            <td>&nbsp;</td>
            <td>Only values listed in this field are shown in payment data.</td>
        </tr>
        <tr>
            <td>PARAMS_OUT</td>
            <td>Comma separated list of fields used in return AUTHCODE calculation.</td>
            <td>R</td>
            <td>&nbsp;</td>
            <td>Only values listed in this field are returned as a part of URL_SUCCESS/URL_CANCEL. Has to
                contain values PAYMENT_ID, TIMESTAMP and STATUS</td>
        </tr>
        <tr>
            <td>ALG</td>
            <td>Algorithm used in AUTHCODE calculation.</td>
            <td>O</td>
            <td>1</td>
            <td>Available values 1 = "SHA-256"</td>
        </tr>
        <tr>
            <td>AUTHCODE</td>
            <td>AUTHCODE</td>
            <td>R</td>
            <td>&nbsp;</td>
            <td>AUTHCODE is calculated by joining all fields listed in PARAMS_IN. Fields are joined by
                placing the
                "|" character (pipe, vertical bar) between each two fields. AUTHCODE is formed from this string by
                calculating a sum using the algorithm from field ALG. This sum is converted to its 64 character
                hexadecimal form and lowercase letters are capitalized.
            </td>
        </tr>
        <tr>
            <td>URL_NOTIFY</td>
            <td>URL to be called when the payment has been marked as paid. This URL is called with
                parameters
                defined in PARAMS_OUT_NOTIFY when the payment is marked as paid.</td>
            <td>O</td>
            <td>&nbsp;</td>
            <td>PARAMS_OUT_NOTIFY are added to URL_CANCEL</td>
        </tr>
        <tr>
            <td>PARAMS_OUT_NOTIFY (Not yet available)</td>
            <td>Comma separated list of fields used in notify RETURN_AUTHCODE calculation.</td>
            <td>O</td>
            <td>&nbsp;</td>
            <td>Only values listed in this field are returned as a part of
                URL_NOTIFY. If not included to payment data PARAMS_OUT is used as a part of URL_NOTIFY.</td>
        </tr>
        <tr>
            <td>LOCALE</td>
            <td>The default language of payment method selection page.</td>
            <td>O</td>
            <td>fi_FI</td>
            <td>Available locales are "fi_FI", "sv_SE" and "en_US". The default locale is "fi_FI".</td>
        </tr>
        <tr>
            <td>REFERENCE_NUMBER</td>
            <td>Reference number to be delivered to payment method provider's service.</td>
            <td>O</td>
            <td>&nbsp;</td>
            <td>
                <p>
                    Given value is used only if user selected payment method is configured as interface (i.e. own direct
                    agreement with payment method provider),
                    otherwise the reference number is generated automatically by Paytrail.
                </p>
                <p>
                    Reference number must comply against Finnish reference number standard or be Finnish reference
                    number in international RF format
                    (e.g. 1232 or RF111232). For Osuuspankki, Ålandsbanken and S-Pankki RF formatted reference numbers
                    are converted to numeric Finnish
                    reference number format.
                </p>
            </td>
        </tr>
        <tr>
            <td>PAYMENT_METHODS</td>
            <td>
                Comma separated list of payment methods visible at payment method selection page. If only one is set
                the payment method page is bypassed and payer is directed to payment method provider page.
                For more information, see <a class="link" href="ch04s04.html"
                    title="4.4.&nbsp;Selection and visibility of payment methods">Selection and visibility of payment
                    methods</a>
            </td>
            <td>O</td>
            <td>&nbsp;</td>
            <td>Use requires agreement on use with Paytrail.</td>
        </tr>
        <tr>
            <td>VAT_IS_INCLUDED</td>
            <td>Whether VAT is included in prices given in ITEM records.</td>
            <td>O</td>
            <td>1</td>
            <td>
                <p>
                    Available values 1 = VAT is included, 0 = VAT is not included.
                    This field is only used with ITEM records. If brought without, an error message is shown.
                </p>
                <p>
                    If using the Collector payment method,
                    the value MUST be 1. Collector will not be available
                    if the value is 0.
                </p>
            </td>
        </tr>
        <tr>
            <td>MSG_SETTLEMENT_PAYER</td>
            <td>Message to consumers bank statement or credit card bill if supported by payment method.
            </td>
            <td>O</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>MSG_SETTLEMENT_MERCHANT (Not yet available)</td>
            <td>Message to merchants bank statement if supported by payment method.</td>
            <td>O</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>MSG_UI_PAYMENT_METHOD</td>
            <td>Message shown in payment method provider page. Currently this is supported by Osuuspankki,
                Visa (Nets), MasterCard (Nets), American Express (Nets) and Diners Club (Nets).</td>
            <td>O</td>
            <td>&nbsp;</td>
            <td>Not all payment methods support showing the message.</td>
        </tr>
        <tr>
            <td>MSG_UI_MERCHANT_PANEL</td>
            <td>Message shown in Merchant's Panel.</td>
            <td>O</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>EXPIRATION_FOR_PAYMENT_CREATION</td>
            <td>
                Sets time when payment possibility is going to be expired for consumer. Payment can't be done if
                consumer enters to payment page after given expiration time.
                Time is validated when entering payment page and payment is created.
                Expired time will cause payment not to be created and not to be shown in merchant portal.
                Consumer will get error message if payment was expired.
                This does not disallow consumer from staying on payment page or being redirected to payment methods or
                completing payments after being able to get to payment page.
            </td>
            <td>O</td>
            <td>&nbsp;</td>
            <td>ISO-8601 notation datetime with time zone (yyyy-mm-ddThh:mm:ss+|-hh:mm).</td>
        </tr>
    </tbody>
{{< /table >}}

In addition to these, payer details can be brought to Paytrail service using the following fields.

{{< table caption="Payer for interface version E2" >}}
    <thead>
        <tr>
            <th>Field name</th>
            <th>Description</th>
            <th>Required / Optional</th>
            <th>Default</th>
            <th>Notes</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>PAYER_PERSON_FIRSTNAME</td>
            <td>Payer's first name.</td>
            <td>O</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>PAYER_PERSON_LASTNAME</td>
            <td>Payer's last name.</td>
            <td>O</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>PAYER_PERSON_EMAIL</td>
            <td>Payer's email.</td>
            <td>O</td>
            <td>&nbsp;</td>
            <td>Email is validated, no MX validation</td>
        </tr>
        <tr>
            <td>PAYER_PERSON_PHONE</td>
            <td>Payer's telephone number.</td>
            <td>O</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>PAYER_PERSON_ADDR_STREET</td>
            <td>Payer's street address.</td>
            <td>O</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>PAYER_PERSON_ADDR_POSTAL_CODE</td>
            <td>Payer's postal code.</td>
            <td>O</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>PAYER_PERSON_ADDR_TOWN</td>
            <td>Payer's town.</td>
            <td>O</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>PAYER_PERSON_ADDR_COUNTRY</td>
            <td>Payer's country.</td>
            <td>O</td>
            <td>&nbsp;</td>
            <td>ISO_3166-2</td>
        </tr>
        <tr>
            <td>PAYER_COMPANY_NAME</td>
            <td>Payer's company.</td>
            <td>O</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </tbody>
{{< /table >}}

In addition to these, order rows can be brought to Paytrail service using the following repetitive fields. First order item row is brought with index 0 (for example name of the first product in field `ITEM_TITLE[0]`). Payment total must be positive. Total sum of the product prices must be at least **0.65€**.

{{< table caption="Product details for interface version E2" >}}
    <thead>
        <tr>
            <th>Field name</th>
            <th>Description</th>
            <th>Required / Optional</th>
            <th>Default</th>
            <th>Notes</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>ITEM_TITLE[N]</td>
            <td>Free field for product name.</td>
            <td>O/R</td>
            <td>&nbsp;</td>
            <td>Required if product rows are included in data.</td>
        </tr>
        <tr>
            <td>ITEM_ID[N]</td>
            <td>Product id.</td>
            <td>O</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>ITEM_QUANTITY[N]</td>
            <td>Quantity of products.</td>
            <td>O</td>
            <td>1</td>
            <td>If a decimal number such as 0.5 is used, the Collector payment method will be hidden.</td>
        </tr>
        <tr>
            <td>ITEM_UNIT_PRICE[N]</td>
            <td>The price for a single product.</td>
            <td>O/R</td>
            <td>&nbsp;</td>
            <td>Required if product rows are included in data. If VAT_IS_INCLUDED value is 0, this is price
                not
                including VAT. Price may be negative value if discount is given.</td>
        </tr>
        <tr>
            <td>ITEM_VAT_PERCENT[N]</td>
            <td>Vat percent used for product.</td>
            <td>O/R</td>
            <td>&nbsp;</td>
            <td>Required if product rows are included in data.</td>
        </tr>
        <tr>
            <td>ITEM_DISCOUNT_PERCENT[N]</td>
            <td>Item discount.</td>
            <td>O</td>
            <td>0</td>
            <td>Percent is a number between 0 and 100.</td>
        </tr>
        <tr>
            <td>ITEM_TYPE[N]</td>
            <td>Type of the product.</td>
            <td>O</td>
            <td>1</td>
            <td>Available values 1 = normal, 2 = shipment cost, 3 = handling cost.</td>
        </tr>
    </tbody>
{{< /table >}}

{{< table caption="Validation of fields" >}}
    <thead>
        <tr>
            <th>Field name</th>
            <th>Form</th>
            <th>Max length</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>MERCHANT_ID</td>
            <td>Numeric</td>
            <td>11</td>
        </tr>
        <tr>
            <td>CURRENCY</td>
            <td>Only allowed value is EUR</td>
            <td>3</td>
        </tr>
        <tr>
            <td>URL_SUCCESS</td>
            <td>Valid URL including http(s). URLs that do not include any dots (e.g. http://localhost) are
                currently not supported.</td>
            <td>2048</td>
        </tr>
        <tr>
            <td>URL_CANCEL</td>
            <td>Valid URL including http(s). URLs that do not include any dots (e.g. http://localhost) are
                currently not supported.</td>
            <td>2048</td>
        </tr>
        <tr>
            <td>ORDER_NUMBER</td>
            <td>0-9, a-z, A-Z and ()[]{}*+-_,. As regular expression '/^[0-9a-zA-Z()\[\]{}*+\-_,.
                ]{1,64}$/'</td>
            <td>64</td>
        </tr>
        <tr>
            <td>AMOUNT</td>
            <td>Float between 0.65 and 499999</td>
            <td>10</td>
        </tr>
        <tr>
            <td>PARAMS_IN</td>
            <td>0-9, A-Z, [],_</td>
            <td>4096</td>
        </tr>
        <tr>
            <td>PARAMS_OUT</td>
            <td>0-9, A-Z, [],_</td>
            <td>255</td>
        </tr>
        <tr>
            <td>ALG</td>
            <td>Only allowed value is 1</td>
            <td>2</td>
        </tr>
        <tr>
            <td>AUTHCODE</td>
            <td>0-9, A-Z</td>
            <td>64</td>
        </tr>
        <tr>
            <td>URL_NOTIFY</td>
            <td>Valid URL including http(s). URLs that do not include any dots (e.g. http://localhost) are
                currently not supported.</td>
            <td>2048</td>
        </tr>
        <tr>
            <td>PARAMS_OUT_NOTIFY (Not yet available)</td>
            <td>0-9, A-Z, [],_</td>
            <td>255</td>
        </tr>
        <tr>
            <td>LOCALE</td>
            <td>Allowed values are fi_FI, sv_SE and en_US. As regular expression
                '/^[a-z]{1,2}[_][A-Z]{1,2}$/'</td>
            <td>5</td>
        </tr>
        <tr>
            <td>REFERENCE_NUMBER</td>
            <td>Alphanumeric, either numeric value complying Finnish reference number standard or numeric
                Finnish
                reference number in international RF format (e.g. 1232 or RF111232)</td>
            <td>20</td>
        </tr>
        <tr>
            <td>PAYMENT_METHODS</td>
            <td>0-9 and ,</td>
            <td>64</td>
        </tr>
        <tr>
            <td>VAT_IS_INCLUDED</td>
            <td>Allowed values 0 and 1</td>
            <td>1</td>
        </tr>
        <tr>
            <td>MSG_SETTLEMENT_PAYER</td>
            <td>Unicode alphabets and ()[]{}*+-_,."' As regular expression '/^[\pL-0-9- "\',
                ()\[\]{}*+\-_,.]*$/u'</td>
            <td>255</td>
        </tr>
        <tr>
            <td>MSG_SETTLEMENT_MERCHANT</td>
            <td>Unicode alphabets and ()[]{}*+-_,."' See regular expression from MSG_SETTLEMENT_PAYER</td>
            <td>255</td>
        </tr>
        <tr>
            <td>MSG_UI_PAYMENT_METHOD</td>
            <td>Unicode alphabets and ()[]{}*+-_,."' See regular expression from MSG_SETTLEMENT_PAYER</td>
            <td>255</td>
        </tr>
        <tr>
            <td>MSG_UI_MERCHANT_PANEL</td>
            <td>Unicode alphabets and ()[]{}*+-_,."' See regular expression from MSG_SETTLEMENT_PAYER</td>
            <td>255</td>
        </tr>
        <tr>
            <td>PAYER_PERSON_FIRSTNAME</td>
            <td>Unicode alphabets and ()[]{}*+-_,:&amp;!?@#$£=*;~/"'.
                As regular expression '/^[\pL-0-9- "\',()\[\]{}*\/+\-_,.:&amp;!?@#$£=*;~]*$/u'</td>
            <td>64</td>
        </tr>
        <tr>
            <td>PAYER_PERSON_LASTNAME</td>
            <td>Unicode alphabets and ()[]{}*+-_,:&amp;!?@#$£=*;~/"'. See regular expression from
                PAYER_PERSON_FIRSTNAME</td>
            <td>64</td>
        </tr>
        <tr>
            <td>PAYER_PERSON_EMAIL</td>
            <td>local-part@domain, max lenght for local part is 64</td>
            <td>255</td>
        </tr>
        <tr>
            <td>PAYER_PERSON_PHONE</td>
            <td>0-9, +-</td>
            <td>64</td>
        </tr>
        <tr>
            <td>PAYER_PERSON_ADDR_STREET</td>
            <td>Unicode alphabets</td>
            <td>128</td>
        </tr>
        <tr>
            <td>PAYER_PERSON_ADDR_POSTAL_CODE</td>
            <td>0-9, a-z, A-Z</td>
            <td>16</td>
        </tr>
        <tr>
            <td>PAYER_PERSON_ADDR_TOWN</td>
            <td>Unicode alphabets and ()[]{}*+-_,:&amp;!?@#$£=*;~/"'. See regular expression from
                PAYER_PERSON_FIRSTNAME</td>
            <td>64</td>
        </tr>
        <tr>
            <td>PAYER_PERSON_ADDR_COUNTRY</td>
            <td>a-z, A-Z</td>
            <td>2</td>
        </tr>
        <tr>
            <td>PAYER_COMPANY_NAME</td>
            <td>Unicode alphabets and ()[]{}*+-_,:&amp;!?@#$£=*;~/"'. See regular expression from
                PAYER_PERSON_FIRSTNAME</td>
            <td>128</td>
        </tr>
        <tr>
            <td>ITEM_TITLE[N]</td>
            <td>Unicode alphabets and ()[]{}*+-_,:&amp;!?@#$£=*;~/"'. See regular expression from
                PAYER_PERSON_FIRSTNAME</td>
            <td>255</td>
        </tr>
        <tr>
            <td>ITEM_ID[N]</td>
            <td>0-9</td>
            <td>16</td>
        </tr>
        <tr>
            <td>ITEM_QUANTITY[N]</td>
            <td>Float</td>
            <td>10</td>
        </tr>
        <tr>
            <td>ITEM_UNIT_PRICE[N]</td>
            <td>Float between 0 and 499 999,99</td>
            <td>10</td>
        </tr>
        <tr>
            <td>ITEM_VAT_PERCENT[N]</td>
            <td>Float between 0 and 100</td>
            <td>10</td>
        </tr>
        <tr>
            <td>ITEM_DISCOUNT_PERCENT[N]</td>
            <td>Float</td>
            <td>10</td>
        </tr>
        <tr>
            <td>ITEM_TYPE[N]</td>
            <td>Allowed values are 1, 2 and 3</td>
            <td>1</td>
        </tr>
        <tr>
            <td>EXPIRATION_FOR_PAYMENT_CREATION</td>
            <td>ISO-8601 notation datetime with time zone, yyyy-mm-ddThh:mm:ss+|-hh:mm (e.g.
                2018-08-18T22:09:17+02:00)</td>
            <td>25</td>
        </tr>
    </tbody>
{{< /table >}}
