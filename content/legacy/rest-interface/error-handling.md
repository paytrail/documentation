---
title: "Error Handling"
draft: false
---

If the sent request is incorrect or there is an error in the interface usage, the interface returns an error message. The error message is in _XML_ or _JSON_ format depending on the request data type (`Content-Type` header). If the data type is incorrect or it was not read, the error message is returned in XML format. Return message for an incorrect request is returned with HTTP error code 400.

Error message XML root element is called `<error>`. Error message returns the following records:

- `errorCode` (character string) \
  Error code. Error code is an unambiguous character string that describes the error. Possible error codes are listed in table [error codes][errors].
- `errorMessage` (character string) \
  Error description. This is a description of the error in chosen localisation. The error description is not to be shown to customers using the service.

**Example: REST service error message in XML format**

```xml
<?xml version="1.0" encoding="UTF-8"?>
<error>
  <errorCode>invalid-order-number</errorCode>
  <errorMessage>Missing or invalid order number</errorMessage>
</error>
```

**Example: REST service error message in JSON format**

```json
{
  errorCode: 'invalid-order-number',
  errorMessage: 'Missing or invalid order number'
}
```

[errors]: {{< ref "legacy/rest-interface/error-codes" >}}
