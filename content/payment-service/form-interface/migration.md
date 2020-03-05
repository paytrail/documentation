---
title: "Migrating from E1 to E2 and S1 to S2"
date: 2020-03-05T09:47:15+02:00
lastmod: 2020-03-05T09:47:15+02:00
draft: false
---

Interface version E2 has replaced the previous versions E1 and S1. E2 is extensible which means that it can be used with or without product and delivery contact data. Interface version upgrade requires definition of fields used in payment creation and return call in fields `PARAMS_IN` and `PARAMS_OUT`. Interface version E2 also provides more data when returning from payment process to web shop.

Some of the fields have been renamed or removed but all features supported in E1 and S1 interfaces are still available. Also validation of fields is stricter than with previous versions. Check list of changed fields from the table below.

{{< table caption="Changed payment creation fields comparing E2 to older interfaces" >}}
<thead>
<tr>
<th>Change type</th>
<th>Old interface</th>
<th>Old field name</th>
<th>New E2 Field name</th>
<th>notes</th>
</tr>
</thead>
<tr>
<td>Field renamed</td>
<td>E1, S1</td>
<td>ORDER_DESCRIPTION</td>
<td>MSG_UI_MERCHANT_PANEL</td>
<td></td>
</tr>
<tr>
<td>Field renamed</td>
<td>E1, S1</td>
<td>RETURN_ADDRESS</td>
<td>URL_SUCCESS</td>
<td></td>
</tr>
<tr>
<td>Field renamed</td>
<td>E1, S1</td>
<td>CANCEL_ADDRESS</td>
<td>URL_CANCEL</td>
<td></td>
</tr>
<tr>
<td>Field renamed</td>
<td>E1, S1</td>
<td>NOTIFY_ADDRESS</td>
<td>URL_NOTIFY</td>
<td></td>
</tr>
<tr>
<td>Field renamed</td>
<td>E1, S1</td>
<td>CULTURE</td>
<td>LOCALE</td>
<td></td>
</tr>
<tr>
<td>Field renamed</td>
<td>E1, S1</td>
<td>PRESELECTED_METHOD</td>
<td>PAYMENT_METHODS</td>
<td></td>
</tr>
<tr>
<td>Field renamed</td>
<td>E1</td>
<td>CONTACT_CELLNO</td>
<td>PAYER_PERSON_PHONE</td>
<td></td>
</tr>
<tr>
<td>Field renamed</td>
<td>E1</td>
<td>CONTACT_EMAIL</td>
<td>PAYER_PERSON_EMAIL</td>
<td></td>
</tr>
<tr>
<td>Field renamed</td>
<td>E1</td>
<td>CONTACT_FIRSTNAME</td>
<td>PAYER_PERSON_FIRSTNAME</td>
<td></td>
</tr>
<tr>
<td>Field renamed</td>
<td>E1</td>
<td>CONTACT_LASTNAME</td>
<td>PAYER_PERSON_LASTNAME</td>
<td></td>
</tr>
<tr>
<td>Field renamed</td>
<td>E1</td>
<td>CONTACT_COMPANY</td>
<td>PAYER_COMPANY_NAME</td>
<td></td>
</tr>
<tr>
<td>Field renamed</td>
<td>E1</td>
<td>CONTACT_ADDR_STREET</td>
<td>PAYER_PERSON_ADDR_STREET</td>
<td></td>
</tr>
<tr>
<td>Field renamed</td>
<td>E1</td>
<td>CONTACT_ADDR_ZIP</td>
<td>PAYER_PERSON_ADDR_POSTAL_CODE</td>
<td></td>
</tr>
<tr>
<td>Field renamed</td>
<td>E1</td>
<td>CONTACT_ADDR_CITY</td>
<td>PAYER_PERSON_ADDR_TOWN</td>
<td></td>
</tr>
<tr>
<td>Field renamed</td>
<td>E1</td>
<td>CONTACT_ADDR_COUNTRY</td>
<td>PAYER_PERSON_ADDR_COUNTRY</td>
<td></td>
</tr>
<tr>
<td>Field renamed</td>
<td>E1</td>
<td>INCLUDE_VAT</td>
<td>VAT_IS_INCLUDED</td>
<td></td>
</tr>
<tr>
<td>Field renamed</td>
<td>E1</td>
<td>ITEM_NO</td>
<td>ITEM_ID</td>
<td></td>
</tr>
<tr>
<td>Field renamed</td>
<td>E1</td>
<td>ITEM_AMOUNT</td>
<td>ITEM_QUANTITY</td>
<td></td>
</tr>
<tr>
<td>Field renamed</td>
<td>E1</td>
<td>ITEM_PRICE</td>
<td>ITEM_UNIT_PRICE</td>
<td></td>
</tr>
<tr>
<td>Field renamed</td>
<td>E1</td>
<td>ITEM_TAX</td>
<td>ITEM_VAT_PERCENT</td>
<td></td>
</tr>
<tr>
<td>Field renamed</td>
<td>E1</td>
<td>ITEM_DISCOUNT</td>
<td>ITEM_DISCOUNT_PERCENT</td>
<td></td>
</tr>
<tr>
<td>Field removed</td>
<td>E1, S1</td>
<td>TYPE</td>
<td>-</td>
<td></td>
</tr>
<tr>
<td>Field removed</td>
<td>E1, S1</td>
<td>PENDING_ADDRESS</td>
<td>-</td>
<td></td>
</tr>
<tr>
<td>Field removed</td>
<td>E1, S1</td>
<td>MODE</td>
<td>-</td>
<td>Payment page bypass is implemented using field PAYMENT_METHODS</td>
</tr>
<tr>
<td>Field removed</td>
<td>E1, S1</td>
<td>VISIBLE_METHODS</td>
<td>-</td>
<td>Payment page method visibility selection is implemented using field PAYMENT_METHODS</td>
</tr>
<tr>
<td>Field removed</td>
<td>E1, S1</td>
<td>GROUP</td>
<td>-</td>
<td></td>
</tr>
<tr>
<td>Field removed</td>
<td>E1</td>
<td>CONTACT_TELNO</td>
<td>-</td>
<td></td>
</tr>
<tr>
<td>Field removed</td>
<td>E1</td>
<td>ITEMS</td>
<td>-</td>
<td></td>
</tr>
<tr>
<td>New field</td>
<td>PARAMS_IN</td>
<td>Defines fields sent to payment gateway and used in authcode calculation.</td>
<td></td>
<td></td>
</tr>
<tr>
<td>New field</td>
<td>PARAMS_OUT</td>
<td>Defines fields returned as a part of URL_SUCCESS, URL_CANCEL and URL_NOTIFY and used in return authcode calculation.</td>
<td></td>
<td></td>
</tr>
<tr>
<td>New field</td>
<td>ALG</td>
<td>Defines algorithm used in authcode calculation.</td>
<td></td>
<td></td>
</tr>
{{< /table >}}
