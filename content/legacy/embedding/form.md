---
title: "Embedding with the Form Interface"
draft: false
---

### Signature

```ts
initWithForm(formId: string, options: object)
```

- `formId: string` \
The form element ID value data is sent to the payment service. The form element is replaced with a payment selection element once it has been downloaded. If JavaScript is not enabled, the customer can send this form normally and go to the payment selection page. Therefore, remember to keep a visible send button in the form.

- `options: object` \
Options is a data structure, which allows adding extra parameters for the design and functionality of the payment method selection page widget. The parameters are described in parameters.

**Example: Embedding the payment method selection page with the form interface**

```html
<form id="payment">
  <input type="hidden" name="MERCHANT_ID" value="12345" />
  <!--> ... -->
  <input type="submit" value="Go to payments" />
</form>

<!--> ... -->

<script src="//payment.paytrail.com/js/payment-widget-v1.0.min.js"></script>
<script>
    SV.widget.initWithForm('payment', {
        charset: 'ISO-8859-1'
    });
</script>
```
