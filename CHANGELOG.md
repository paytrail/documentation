# Release Notes by Paytrail

## Revision 6.0 (Unreleased)

### New
- Ported the project to public GitHub for easier access to contributors.
- Switched releases to semantic versioning.

## Revision 5.7 (2nd July 2019)

### New
- Documentation about confirming payments through payment status query services.

## Revision 5.6 (11th June 2019)

### Changed
- "Notify URL call" chapter.
- Notify URL call status flow diagrams.
- "Settlement details" chapter ("Structure and detailed information on returned values" -table, possible values for refund object's status parameter).

## Revision 5.5 (19th March 2019)

### New
- Added mention about Merchant API charset (UTF-8).

### Changed
- Payment method requirements in Payment method values chapter.
- The terms used in E2 and channel payment chapters.

### Fixed
- Wrongly calculated signature in Merchant API refund creation example.

## Revision 5.4 (23rd October 2018)

### New
- Added mention about refund location in create refund response.

### Changed
- Updated card payment test instructions.
- Removed mention about `ORDER_NUMBER` being required in `PARAMS_OUT` as it is not required.

## Revision 5.3 (25th September 2018)

### New
- Added documentation for new optional field `EXPIRATION_FOR_PAYMENT_CREATION` in E2 interface.

## Revision 5.2 (17th April 2018)

### Changed
- Removed references to payment method Paytrail account which will be removed in June 2018.

## Revision 5.1 (27th March 2018)

### Changed
- Updated E2 field validation.

## Revision 5.0 (12th December 2017)

### Changed
- Removed Connect API documentation, API will be removed 2018.

## Revision 4.9 (21st November 2017)

### Changed
- Updated E2 calculating the payment `AUTHCODE` examples.

## Revision 4.8 (31st October 2017)

### Changed
- Updated channel documentation.
- Updated E2 `ITEM_ID` validation.

## Revision 4.7 (10th October 2017)

### Changed
- Updated E2 receipt value info.

## Revision 4.6 (19th September 2017)

### New
- Added recommendation for E2 to not use `AMOUNT` when order rows are provided.

## Revision 4.5 (13th June 2017)

### New
- Added Shopify token for testing.
- Added new interface version E2.
- Added new payment method MobilePay (ID 58).

## Revision 4.4 (4th April 2017)

### Changed
- Updated length of merchant API signature.
- Removed XML interface documentation. XML has been replaced with merchant API settlements.
- Removed link to unsupported library.

### Fixed
- Fixed `AMOUNT` to be required with interface version S1.

## Revision 4.3 (21st February 2017)

### Changed
- Added example image of form payment creation.
- Removed link to unsupported library.

## Revision 4.2 (10th January 2017)

### New
- Added American Express test credentials.

## Revision 4.1 (16th November 2016)

### New
- Added credit card refund documentation to Merchant API section.

## Revision 4.0 (11th October 2016)

### New
- Added documentation for Merchant API settlement, payment and refund resources.

### Changed
- Removed references to payment method Maestro (not in use).
- Removed old Collector version (ID 19).

### Fixed
- Fixed authcode in E1 example.

## Revision 3.9 (6th September 2016)

### Changed
- Updated customer care phone number.

## Revision 3.8 (26th July 2016)

### New
- Added payment method Oma Säästöpankki, `PRESELECTED_METHOD = 61`.

## Revision 3.7 (3rd May 2016)

### New
- Added info about REST interface not supporting payment page bypass.

### Fixed
- Fixed info about validity of REST token.

## Revision 3.6 (19th January 2016)

### Changed
- Updated `vatPercent` description that it's not allowed in Merchant API to create refund requests for payments done with S1.

## Revision 3.5 (15th December 2015)

### New
- Added Collector Bank to payment method lists.
- Added status flow diagrams for bank payment/invoice refunds.

## Revision 3.4 (27th October 2015)

### New
- Added test credentials for Visa and MasterCard.
- Added new error code refunds-not-enabled to Merchant API.

### Changed
- Removed Payment method Tapiola (ID 4) since Tapiola has merged with S-Pankki (ID 10).

## Revision 3.3 (15th September 2015)

### New
- Added new payment methods 53-57 (Nets).
- Added link to Connect API Python library and Merchant API Ruby library.
- Added Paytrail account ID to payment page bypass documentation.

### Changed
- Updated Merchant API service address and warning text (pilot).
- Updated `VISIBLE_METHOD` field documentation.
- Removed method 8 (Nets).

### Fixed
- Fixed Merchant API and Connect API examples.

## Revision 3.2 (4th August 2015)

### Changed
- Changed refund item amounts and VAT percentages to be given as integers instead of floats in Merchant API.

## Revision 3.1 (23rd June 2015)

### New
- Added the first version of Merchant API v1 documentation.

## Revision 3.0 (9th December 2014)

### Changed
- Changed the name of the downloadable REST module zip package and omitted file paths in the archive.
- Changed HTTP status received in error cases in REST documentation.

### Fixed
- Fixed timestamp format in Connect API examples.

## Revision 2.9 (4th November 2014)

### New
- Added test credentials for S-Pankki.
- Added METHOD values for card methods 30-35 in payment notify.
- Added test credentials for Aktia, Säästöpankki and POP Pankki.

### Changed
- Changed Sampo Pankki's name to Danske Bank.
- Changed the name of the Luottokunta payment method to Nets.
- Stylized Payment service and Connect API chapters.
- Moved form interface documentation from a PDF to the docbook (chapter 5.3).
- Removed references to old Collector payment method (METHOD 13).
- Removed supported browsers from payment method selection page embedding chapter.
Removed references to disabled payment methods Säästöpankit, paikallisosuuspankit, - Aktia, Nooa (METHOD 7), Maestro (METHOD 32) and American Express (METHOD 33).
- Removed reference to old VAT base 23.

## Revision 2.8 (11th August 2014)

### Changed
- Updated channel API documentation PDF to use the new company name and stylized the language in it.
- Updated new name for Jousto (previously Joustoraha).

## Revision 2.7 (8th May 2014)

### New
- Added the descriptions of email and phone parameters in returned delivery address JSON.

### Fixed
- Fixed documentation on delivery address return HTTP codes
- Fixed max length for product code field in A1 payment format to be 16 chars.

## Revision 2.6 (28th February 2014)

### New
- Updated Paytrail Connect API documentation.

## Revision 2.5 (10th February 2014)

### New
- Added a new element "payer" to the SVPayment datatype in the Bookkeeping XML. This element needs to be taken into account when using the new URLs.
- Added card payment method identifiers (30-35) tp payment page bypass documentation.

### Changed
- Updated the Bookkeeping XML URLs.

## Revision 2.4 (28th November 2013)

### New
- Added the bank test credentials to the test credentials chapter.
- Added a know issues chapter to the form interface description. This was done, since there have been some changes, and they aren't reflected in the PDF.
- Added the dynamic payment method banner documentation in English.

### Changed
- Moved the test credentials to their own chapter, since the same ones are used in several places.
- Moved the Bookkeeping XML API documentation to HTML format
- Moved payment status query documentation to HTML format and documented support for new localisations
- Moved first name and last name in separate fields in Connect API documentation.
- Changed the minimum sum of a payment to be 0.65 euros.
- Changed documentation of `INCLUDE_VAT` and `ITEM_AMOUNT` to reflect Collector requirements.
- Changed the payment gateway URLs from payment.verkkomaksut.fi to payment.paytrail.com

## Revision 2.3 (4th June 2013)

### New
- Added Paytrail Connect API to documentation.
- Added text to introduction and to payment service description.

## Revision 2.2 (29th October 2012)

### New
- Added information to PENDING_ADDRESS that it is not longer used.
- Added information to payment method lists about replacing Collector-method (13) with new Collector method (19).
- Added Joustoraha (18) to payment method lists where it was missing.

### Changed
- Removed references to Netposti payment method (no longer available)

## Revision 2.1.2 (22nd August 2012)

### Changed
- Updated REST API illustrations with English translations.
- Removed recurring payments documentation.

## Revision 2.1.1 (18th June 2012)

### Changed
- Updated embed JavaScript URI.
- Removed beta label from payment method selection page embedding documentation.

## Revision 2.1 (1st December 2011)

### New
- Added test credentials under payment service documentation.
- Ported English documentation body to HTML.

### Fixed
- Fixed and updated payment method selection page embedding documentation.
- Fixed REST API example
- Fixed S1 form API example. `PENDING_ADDRESS` should be empty in the example, it had set value in the listing.
