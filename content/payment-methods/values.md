---
title: "Payment Method IDs and Names"
draft: false
---

This list defines the ID numbers for different payment methods supported by Paytrail.

* **1** _Nordea_
* **2** _Osuuspankki_
* **3** _Danske Bank_
* **5** _Ålandsbanken_
* **6** _Handelsbanken_
* **9** _PayPal_
  
  Only available as an interface. Requires own agreement with PayPal and is hidden until credentials are saved in Merchant's Panel.

* **10** _S-Pankki_
* **11** _Klarna Invoice_
  
  Field `PAYER_PERSON_PHONE` and payer details should be defined (name, address, zip, city, and country). Only available as an interface. Requires own agreement with Klarna, and is hidden until credentials are saved in Merchant's Panel.

* **12** _Klarna Installment_
  
  Field `PAYER_PERSON_PHONE` and payer details should be defined (name, address, zip, city, and country). Only available as an interface. Requires own agreement with Klarna and is hidden until credentials are saved in Merchant's Panel.

* **18** _Jousto_
  
  Amount must be between 20 and 5000 €.

* **30** _Visa_
* **31** _MasterCard_
* **34** _Diners Club_
* **35** _JCB_
* **50** _Aktia_
* **51** _POP Pankki_
* **52** _Säästöpankki_
* **53** _Visa (Nets)_
* **54** _MasterCard (Nets)_
* **55** _Diners Club (Nets)_
* **56** _American Express (Nets)_
* **58** _MobilePay_
* **60** _Collector Bank_
  
  Field `VAT_IS_INCLUDED` should be `1`. Field `ITEM_QUANTITY[N]` should be an integer. Maximum amount is 5000 €. Product details should be defined. Payer details should be defined (name, address, zip, city, and country)

* **61** _Oma Säästöpankki_
