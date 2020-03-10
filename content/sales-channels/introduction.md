---
title: "Introduction to Sales Channel"
draft: false
weight: 1
---

### Channel Description

The sales channel enables purchasing different products from different merchants in a single payment via Paytrail's service. Each merchant in the sales channel must have a sales channel agreement with Paytrail.

The channel provider can define a formula for taking a commission from every product in the channel. This formula is included in the agreement between the channel provider and Paytrail and must be used by the channel provider.

Paytrail charges its own commission for every payment made via the channel. This commission is also defined in the agreement between Paytrail and the channel provider. The channel provider is responsible for ensuring that the combined commissions do not exceed the total payment amount.

Merchants using a sales channel can review their payments in the Merchant's Panel. Each merchant can only see their own products sold in a single purchase bundle.

### Interface Description

The Sales Channel URL is <https://payment.paytrail.com/channel-payment>

The purchase bundle is sent to the service as a `POST` query. When a payment is completed, the customer will be redirected back to the return address defined by the payment channel. The parameters used to determine that payment has been successful are also sent to the return address.

### Fields to Send

The tables below describe the fields that should be sent to Paytrail’s payment service. If the maximum lengths are exceeded, the payment will not be accepted.

The format of the fields is **N**, **F** or **AN**.

**N** stands for an integer value and **F** for decimal number. Decimal numbers have a maximum count of two decimals. Decimal delimiter is a dot (`.`). **AN** stands for alphanumeric value meaning that the value of the field can include any characters. Supported character sets are **UTF-8** or **ISO-8859-1**. Character sets cannot be mixed.

{{% notice note %}}No value for field should contain “|”, the vertical bar. Pipe characters should be replaced by another character before the data is sent to Paytrail’s payment service. If special characters have to be used in the return address, we recommend encoding the return address URL (e.g. function urlencode in PHP). E.g. pipe character has to be replaced with a string “%C7”.{{% /notice %}}

Table column _Mandatory/Optional_ tells if the field has to be sent or if it is optional. We recommend using the `NOTIFY_ADDRESS` field even though it's optional.

{{< table caption="Fields to be sent to the payment gateway" >}}
    <thead>
        <tr>
            <th>Field</th>
            <th>Name</th>
            <th>Max length</th>
            <th>Format</th>
            <th>Mandatory / optional</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Channel ID</td>
            <td>CHANNEL_ID</td>
            <td>11</td>
            <td>N</td>
            <td>M</td>
        </tr>
        <tr>
            <td>Order number</td>
            <td>ORDER_NUMBER</td>
            <td>64</td>
            <td>AN</td>
            <td>M</td>
        </tr>
        <tr>
            <td>Currency</td>
            <td>CURRENCY</td>
            <td>3</td>
            <td>AN</td>
            <td>M</td>
        </tr>
        <tr>
            <td>Return address / Successful payment</td>
            <td>RETURN_ADDRESS</td>
            <td>255</td>
            <td>AN</td>
            <td>M</td>
        </tr>
        <tr>
            <td>Return address / Cancelled payment</td>
            <td>CANCEL_ADDRESS</td>
            <td>255</td>
            <td>AN</td>
            <td>M</td>
        </tr>
        <tr>
            <td>Notify address</td>
            <td>NOTIFY_ADDRESS</td>
            <td>255</td>
            <td>AN</td>
            <td>M</td>
        </tr>
        <tr>
            <td>Interface version</td>
            <td>VERSION</td>
            <td>2</td>
            <td>N</td>
            <td>M</td>
        </tr>
        <tr>
            <td>Culture code / Payment page language</td>
            <td>CULTURE</td>
            <td>5</td>
            <td>AN</td>
            <td>O</td>
        </tr>
        <tr>
            <td>Preselected payment method for Payment page bypass
                Payment methods
                <table>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>Nordea</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>Osuuspankki</td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>Danske Bank</td>
                        </tr>
                        <tr>
                            <td>5</td>
                            <td>Ålandsbanken</td>
                        </tr>
                        <tr>
                            <td>6</td>
                            <td>Handelsbanken</td>
                        </tr>
                        <tr>
                            <td>10</td>
                            <td>S-Pankki</td>
                        </tr>
                        <tr>
                            <td>50</td>
                            <td>Aktia</td>
                        </tr>
                        <tr>
                            <td>51</td>
                            <td>POP Pankki</td>
                        </tr>
                        <tr>
                            <td>52</td>
                            <td>Säästöpankki</td>
                        </tr>
                        <tr>
                            <td>53</td>
                            <td>Visa (Nets)</td>
                        </tr>
                        <tr>
                            <td>54</td>
                            <td>MasterCard (Nets)</td>
                        </tr>
                        <tr>
                            <td>61</td>
                            <td>Oma Säästöpankki</td>
                        </tr>
                    </tbody>
                </table>
            </td>
            <td>PRESELECTED_METHOD</td>
            <td>2</td>
            <td>AN</td>
            <td>O</td>
        </tr>
        <tr>
            <td>AUTHCODE</td>
            <td>AUTHCODE</td>
            <td>32</td>
            <td>AN</td>
            <td>M</td>
        </tr>
        <tr>
            <td>Payer’s telephone number</td>
            <td>CONTACT_TELNO</td>
            <td>64</td>
            <td>AN</td>
            <td>O</td>
        </tr>
        <tr>
            <td>Payer’s cellphone number</td>
            <td>CONTACT_CELLNO</td>
            <td>64</td>
            <td>AN</td>
            <td>O</td>
        </tr>
        <tr>
            <td>Payer’s email address</td>
            <td>CONTACT_EMAIL</td>
            <td>255</td>
            <td>AN</td>
            <td>M</td>
        </tr>
        <tr>
            <td>Payer’s first name</td>
            <td>CONTACT_FIRSTNAME</td>
            <td>64</td>
            <td>AN</td>
            <td>M</td>
        </tr>
        <tr>
            <td>Payer’s last name</td>
            <td>CONTACT_LASTNAME</td>
            <td>64</td>
            <td>AN</td>
            <td>M</td>
        </tr>
        <tr>
            <td>Payer’s company</td>
            <td>CONTACT_COMPANY</td>
            <td>128</td>
            <td>AN</td>
            <td>O</td>
        </tr>
        <tr>
            <td>Payer's street address</td>
            <td>CONTACT_ADDR_STREET</td>
            <td>128</td>
            <td>AN</td>
            <td>M</td>
        </tr>
        <tr>
            <td>Payer’s zip code</td>
            <td>CONTACT_ADDR_ZIP</td>
            <td>16</td>
            <td>N</td>
            <td>M</td>
        </tr>
        <tr>
            <td>Payer’s city</td>
            <td>CONTACT_ADDR_CITY</td>
            <td>64</td>
            <td>AN</td>
            <td>M</td>
        </tr>
        <tr>
            <td>Payer’s country</td>
            <td>CONTACT_ADDR_COUNTRY</td>
            <td>2</td>
            <td>AN</td>
            <td>M</td>
        </tr>
        <tr>
            <td>VAT is included in price</td>
            <td>INCLUDE_VAT</td>
            <td>1</td>
            <td>N</td>
            <td>M</td>
        </tr>
        <tr>
            <td>Amount of items</td>
            <td>ITEMS</td>
            <td>8</td>
            <td>N</td>
            <td>M</td>
        </tr>
    </tbody>
{{< /table >}}

Products in the payment bundle can be sent with the recurring fields described below.

{{< table caption=" Product Rows" >}}
    <thead>
        <tr>
            <th>Field</th>
            <th>Name</th>
            <th>Max length</th>
            <th>Format</th>
            <th>Mandatory / optional</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Product name</td>
            <td>ITEM_TITLE[X]</td>
            <td>255</td>
            <td>AN</td>
            <td>M</td>
        </tr>
        <tr>
            <td>Product number</td>
            <td>ITEM_NO[X]</td>
            <td>16</td>
            <td>AN</td>
            <td>O</td>
        </tr>
        <tr>
            <td>Amount of products</td>
            <td>ITEM_AMOUNT[X]</td>
            <td>10</td>
            <td>F</td>
            <td>M</td>
        </tr>
        <tr>
            <td>Product price</td>
            <td>ITEM_PRICE[X]</td>
            <td>10</td>
            <td>F</td>
            <td>M</td>
        </tr>
        <tr>
            <td>Tax percent for product</td>
            <td>ITEM_TAX[X]</td>
            <td>10</td>
            <td>F</td>
            <td>M</td>
        </tr>
        <tr>
            <td>Merchant ID of product</td>
            <td>ITEM_MERCHANT_ID[X]</td>
            <td>8</td>
            <td>N</td>
            <td>M</td>
        </tr>
        <tr>
            <td>Product’s channel commission class ID</td>
            <td>ITEM_CP[X]</td>
            <td>10</td>
            <td>F</td>
            <td>M</td>
        </tr>
        <tr>
            <td>Product’s discount</td>
            <td>ITEM_DISCOUNT[X]</td>
            <td>10</td>
            <td>F</td>
            <td>O</td>
        </tr>
        <tr>
            <td>Product type</td>
            <td>ITEM_TYPE[X]</td>
            <td>2</td>
            <td>N</td>
            <td>O</td>
        </tr>
    </tbody>
{{< /table >}}

{{< table caption="Description for the Fields" >}}
    <thead>
        <tr>
            <th>Field</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Channel ID</td>
            <td>Channel ID is an identifier given to the payment channel by Paytrail. Channel ID contains
                only numbers. (mandatory)</td>
        </tr>
        <tr>
            <td>Order number</td>
            <td>Order number is a unique string for order. (mandatory)</td>
        </tr>
        <tr>
            <td>Currency</td>
            <td>Currency of the payment. The only allowed value is EUR. (mandatory)</td>
        </tr>
        <tr>
            <td>Return address / Successful payment</td>
            <td>After a successful payment, the customer will be redirected to the return address.
                (mandatory)</td>
        </tr>
        <tr>
            <td>Return address / Cancelled payment</td>
            <td>After cancelled or unsuccessful payment customer will be redirected to the cancel address.
                (mandatory)</td>
        </tr>
        <tr>
            <td>Notify address</td>
            <td>
                After the payment is marked as successful, Paytrail will call the notify address and send the
                same GET parameters as when directing customer to RETURN_ADDRESS after a successful payment. (mandatory)
            </td>
        </tr>
        <tr>
            <td>Interface version</td>
            <td>Version of payment interface. Channel interface is 1. (mandatory)</td>
        </tr>
        <tr>
            <td>Culture code/Payment page language</td>
            <td>
                Culture affects the default language of Paytrail’s payment service page as well as the format of the
                displayed sum.
                Possible values are “fi_FI”, “sv_SE” and “en_US”. Default is “fi_FI”. (optional)
            </td>
        </tr>
        <tr>
            <td>Preselected payment method for Payment page bypass</td>
            <td>
                If the payment method selection is done in the webshop, the payment method is delivered in this field.
                Paytrail's service can be bypassed when preselected payment method is delivered (PRESELECTED_METHOD).
                Use requires an additional agreement with Paytrail.
            </td>
        </tr>
        <tr>
            <td>AUTHCODE</td>
            <td>
                AUTHCODE is a calculated with MD5 algorithm.
                With AUTHCODE we prevent the abuse of payments.
                Value is calculated from a string that contains all the information from the order and channel’s secret.
                See example below. (mandatory)
            </td>
        </tr>
        <tr>
            <td>Payer’s telephone number</td>
            <td>Payer’s telephone number. (optional)</td>
        </tr>
        <tr>
            <td>Payer’s cellphone number</td>
            <td>Payer’s cellphone number. (optional)</td>
        </tr>
        <tr>
            <td>Payer’s email address</td>
            <td>Payer’s email address. (mandatory)</td>
        </tr>
        <tr>
            <td>Payer’s first name</td>
            <td>Payer’s first name. (mandatory)</td>
        </tr>
        <tr>
            <td>Payer’s last name</td>
            <td>Payer’s last name. (mandatory)</td>
        </tr>
        <tr>
            <td>Payer’s company</td>
            <td>Payer’s company. (optional)</td>
        </tr>
        <tr>
            <td>Payer’s street address</td>
            <td>Payer’s street address. (mandatory)</td>
        </tr>
        <tr>
            <td>Payer’s zip code</td>
            <td>Payer’s zip code. (mandatory)</td>
        </tr>
        <tr>
            <td>Payer’s city</td>
            <td>Payer’s city. (mandatory)</td>
        </tr>
        <tr>
            <td>Payer’s country</td>
            <td>
                Payer’s country.
                The value follows the ISO-3166-1 standard and it contains two letters.
                For example, Finland is FI and Sweden is SE. It does not matter if the value is in lower or upper case.
                (mandatory)
            </td>
        </tr>
        <tr>
            <td>Is VAT is included in price?</td>
            <td>
                Do the prices in item rows include VAT or not.
                Value 1 means that VAT is included in given prices, value 0 means that given VAT has to be added to
                price.
                If your products are saved including VAT in your webshop, use value 1.
                If products are saved without VAT, use value 0. (mandatory)
            </td>
        </tr>
        <tr>
            <td>Amount of items</td>
            <td>Amount of item rows. (mandatory)</td>
        </tr>
        <tr>
            <td>Product name</td>
            <td>Free-formatted name for the product. (mandatory)</td>
        </tr>
        <tr>
            <td>Product number</td>
            <td>
                Optional product number that is displayed in the Merchant’s Panel with the product.
                Using this field may help find the right product. (optional)
            </td>
        </tr>
        <tr>
            <td>Amount of products</td>
            <td>
                If the order includes several of the same products this field can be used to determine amount of them.
                This means that identical products do not need their own rows. (mandatory)
            </td>
        </tr>
        <tr>
            <td>Product price</td>
            <td>
                Price of the product.
                If INCLUDE_VAT has value 0, value of this field is price without VAT.
                If INCLUDE_VAT has value 1, value of this field is price including VAT.
                Price has to be always positive. Discounts for products can be sent with the ITEM_DISCOUNT[X] field.
                (mandatory)
            </td>
        </tr>
        <tr>
            <td>Tax percent for product</td>
            <td>VAT percent used for products. (mandatory)</td>
        </tr>
        <tr>
            <td>Merchant ID of product</td>
            <td>
                One payment can contain products from several merchants.
                Every item row has to contain merchant ID of the product’s merchant. (mandatory)
            </td>
        </tr>
        <tr>
            <td>Product’s channel commission class ID</td>
            <td>
                Payment channel may have several commission classes.
                Every product can have their own commission class.
                This allows different prices for premium merchants or smaller commission class for more expensive
                products.
                Paytrail will deliver commission class IDs to payment channel.
                Commission class IDs are defined in the contract between Paytrail and payment channel. (mandatory)
            </td>
        </tr>
        <tr>
            <td>Products discount</td>
            <td>
                If product has a discount, this defines the discount percentage.
                The value can be between 0 and 100. Default value is 0. (optional)
            </td>
        </tr>
        <tr>
            <td>Product type</td>
            <td>
                Type can be defined for every item row.
                Type 1 means normal product, 2 shipping, and 3 handling. Default value is 1. (optional)
            </td>
        </tr>
    </tbody>
{{< /table >}}
