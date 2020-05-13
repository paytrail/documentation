---
title: "Refund Status Notifications"
draft: false
weight: 4
---

### Description

Paytrail calls the notify URL with a `GET` request when the refund status changes. The received notification must be acknowledged by responding with an HTTP status in the `200–299` range.

If an update is not acknowledged by the receiving end, the update to that refund is postponed until the next retry round. Updates will be retried after **1, 3, 6, 10, 15, 21, 28, 36, 45** and **55** hours, after which the notification is discarded. This may cause some updates to be skipped if the notification URL endpoint cannot be contacted within 55 hours.

### Notification Flow

![Refund Notification Flow](../refund_notify_call.svg)

### Parameters

#### `refundToken`
**Type:** `String`

Refund token.

#### `oldStatus`
**Type:** `String`

Refund's previous status.

#### `newStatus`
**Type:** `String`

Refund's new status.

#### `signature`
**Type:** `String`

Signature to ensure the update comes from Paytrail. Signature is calculated with the following formula.

```js
sha256(refundToken + '|' + oldStatus + '|' + newStatus + '|' + merchantSecret)
```

### Refund Statuses

#### `created`
Refund was created. Never used as `newStatus`, since notify is not sent when a refund is created.

#### `completed`
Refund paid to customer. For bank or _Collector_ refund, amount is deducted from merchant's settlement.

#### `cancelled`
Refund cancelled or failed.

{{% notice note %}}New statuses may be introduced in the future. Implementations should be able to discard any other statuses received.{{% /notice %}}
