---
title: Cancelling the Refund
draft: false
weight: 3
---

### Route

The customer will be notified of a successful refund cancellation by email. Using the `DELETE` method is not allowed for card refunds. Response in case of a card refund is **405**.

```http
DELETE /merchant/v1/refunds/:refundToken
```

### Return Codes

- **HTTP 204:** Refund was cancelled successfully.
- **HTTP 404:** Refund was not found with given token. Check that you gave a non-empty token that points to an existing refund.
- **HTTP 405:** Refund cannot be cancelled from its current state. Check refund’s status from the Merchant Panel.