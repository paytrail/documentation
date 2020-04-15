---
title: "Migrating E1 to E2 and S1 to S2"
draft: false
---

Interface version E2 has replaced the previous versions E1 and S1. E2 is extensible which means that it can be used with or without product and delivery contact data. Interface version upgrade requires definition of fields used in payment creation and return call in fields `PARAMS_IN` and `PARAMS_OUT`. Interface version E2 also provides more data when returning from payment process to web shop.

### Breaking Changes

Some of the fields have been renamed or removed but all features supported in E1 and S1 interfaces are still available. Also validation of fields is stricter than with previous versions. Check the list of changed fields from the table below.

#### New Fields

- `PARAMS_IN` \
  Defines the fields sent to payment gateway and used in authcode calculation.
- `PARAMS_OUT`\
  Defines the fields returned as a part of `URL_SUCCESS`, `URL_CANCEL`, and `URL_NOTIFY` and used in return authcode calculation.
- `ALG` \
  Defines the algorithm used in authcode calculation.

#### Renamed Fields (E1 & S1)

- `ORDER_DESCRIPTION` renamed to `MSG_UI_MERCHANT_PANEL`
- `RETURN_ADDRESS` renamed to `URL_SUCCESS`
- `CANCEL_ADDRESS` renamed to `URL_CANCEL`
- `NOTIFY_ADDRESS` renamed to `URL_NOTIFY`
- `CULTURE` renamed to `LOCALE`
- `PRESELECTED_METHOD` renamed to `PAYMENT_METHODS`

#### Renamed Fields (E1)

- `CONTACT_CELLNO` renamed to `PAYER_PERSON_PHONE`
- `CONTACT_EMAIL` renamed to `PAYER_PERSON_EMAIL`
- `CONTACT_FIRSTNAME` renamed to `PAYER_PERSON_FIRSTNAME`
- `CONTACT_LASTNAME` renamed to `PAYER_PERSON_LASTNAME`
- `CONTACT_COMPANY` renamed to `PAYER_COMPANY_NAME`
- `CONTACT_ADDR_STREET` renamed to `PAYER_PERSON_ADDR_STREET`
- `CONTACT_ADDR_ZIP` renamed to `PAYER_PERSON_ADDR_POSTAL_CODE`
- `CONTACT_ADDR_CITY` renamed to `PAYER_PERSON_ADDR_TOWN`
- `CONTACT_ADDR_COUNTRY` renamed to `PAYER_PERSON_ADDR_COUNTRY`
- `INCLUDE_VAT` renamed to `VAT_IS_INCLUDED`
- `ITEM_NO` renamed to `ITEM_ID`
- `ITEM_AMOUNT` renamed to `ITEM_QUANTITY`
- `ITEM_PRICE` renamed to `ITEM_UNIT_PRICE`
- `ITEM_TAX` renamed to `ITEM_VAT_PERCENT`
- `ITEM_DISCOUNT` renamed to `ITEM_DISCOUNT_PERCENT`

#### Removed Fields (E1 & S1)

- `TYPE`
- `PENDING_ADDRESS`
- `MODE` \
  Payment page bypass is implemented using the field `PAYMENT_METHODS`.
- `VISIBLE_METHODS` \
  Payment page method visibility selection is implemented using the field `PAYMENT_METHODS`.
- `GROUP`

#### Removed Fields (E1)

- `CONTACT_TELNO`
- `ITEMS`
