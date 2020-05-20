---
title: Structure and detailed information on returned values
draft: false
weight: 2
---

Structure for settlement detail information. Format is `Field name` type [max length/value] 

- `id` string [64]
- `referenceNumber`	number [32]
- `settledAmount` number [50000000] \
How much money was settled to merchant? Amount is in the currency's smallest unit. e.g. in Euro cents
- `settledAt` date [timestamp || null] \
When the settlement was paid to merchant's bank account. Can be null if it's not yet paid.
- `currency` string [3] \
ISO 3 letter symbol for settlement currency e.g. "EUR"
- `payments` array \
`1-N` Payment objects
  - `id` number [12]
  - `referenceNumber` number [32]
  - `orderNumber` string [64]
  - `createdAt` date [timestamp]
  - `status` string \
  Possible values: "waiting payment", "paid", "cancelled", "waiting acceptance"
  - `paymentMethodId` number \
  Payment method id, see available methods from selection and visibility of payment methods. List of available methods is [**here**][payment-methods]
  - `payerName`	string [32] \
  Payer name, only available for bank payments
  - `amounts` \
  Payment amounts object
    - `original` number [50000000] \
    Amount provided in payment data from web shop
    - `charged`	number [50000000] \
    Charged amount
    - `settled`	number [50000000] \
    Amount settled to merchant
    - `currency` string [3] \
    ISO 3 letter symbol for settlement currency e.g. "EUR"
  - `consumerFees` \
  Payment consumer fees object
    - `paymentMethod` number [50000000] \
    Payment method fee
    - `currency` string [3] \
    ISO 3 letter symbol for settlement currency e.g. "EUR"
  - `merchantFees` \
  Payment merchant fees object
    - `transaction` number [50000000] \
    Transaction fee
    - `provision` number [50000000] \
    Provision
    - `currency` string [3] \
    ISO 3 letter symbol for settlement currency e.g. "EUR"
  - `paymentServiceProvider` string \
  Possible values: "Paytrail"
  - `paymentServiceType` string \
  Possible values: "collecting", "direct"
  - `refunds` \
  `0-N` Arefund objects (refunds linked to payment)
    - `id` string [64]
    - `createdAt` date [timestamp]
    - `status` string \
    Possible values: "created", "completed", "cancelled"
    - `paymentId` number [12]
    - `updatedAt` date [timestamp || null]
    - `originalAmount` number [50000000] \
    Original fee
    - `settledAmount` number [50000000] \
    Amount settled to merchant
    - `merchantFees` \
    Payment merchant fees object
      - `transactionFee` number [50000000] \
      Transaction fee
    - `currency` string [3] \
    ISO 3 letter symbol for settlement currency e.g. "EUR"
    - `settlementId` string [64]
- `refunds`	array \
`0-N` refund objects (refunds linked to settlement)
  - `id` string [64]
  - `createdAt`	date [timestamp]
  - `status` string \
  Possible values: "created", "completed", "cancelled"
  - `paymentId`	number [12]
  - `updatedAt`	date [timestamp || null]
  - `originalAmount` number [50000000] \
  Original fee
  - `settledAmount`	number [50000000] \
  Amount settled to merchant
  - `merchantFees` \
  Payment merchant fees object
    - `transactionFee`	number [50000000] \
    Transaction fee
  - `currency` string [3] \
  ISO 3 letter symbol for settlement currency e.g. "EUR"
  - `settlementId` string [64]

  [payment-methods]: {{< ref "payment-methods/values" >}}