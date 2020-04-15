---
title: "Parameters"
draft: false
---

The last parameter of `initWithToken` and `initWithForm` is an object named `options`. This object can be used to customize the design and functionality of the payment method selection widget. All parameters of the options structure are optional and their _default_ values are presented in parenthesis.

- `widgetId: string` (_default_: `'sv-widget'`) \
You can define the widget element's root ID manually if you wish to handle the element dynamically, or the _default_ ID is already in use. 

- `charset: string` (_default_: `'UTF-8'`) \
Character set for the page. Supported character sets are **UTF-8** and **ISO-8859-1**. Parameter is not required for the REST implementation.

- `debug: number` (_default_: `0`) \
The widget can be set to test mode with this parameter (value `1`). When in test mode the widget reports its functionality to development tools.

- `defaultLocale: string` \
_Default_ localization for the widget. Supported localizations are:

```js
['da_DK', 'de_DE', 'en_US', 'et_EE', 'fi_FI', 'fr_FR', 'no_NO', 'ru_RU', 'sv_SE']
```
    
- `locales: Array<string>` (_default_: all the available localizations are shown in alphabetical order) \
List of the available localizations. See supported localizations in the `_default_Locale` field description.

- `width: number` (_default_: `500`) \
Widget width in pixels. 

- `height: number` (_default_: `0`) \
Widget height in pixels. `0` is an acceptable value, the widget height is then automatically determined based on the content. If the widget height is set too small for the content to fit in, a vertical scroll bar is shown in the widget.
