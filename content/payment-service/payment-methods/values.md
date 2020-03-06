---
title: "Payment method values"
date: 2020-03-06T14:09:25+02:00
lastmod: 2020-03-06T14:09:25+02:00
draft: false
---

{{< table caption="Available payment method IDs" >}}
    <thead>
        <tr>
            <th>Method name</th>
            <th>ID</th>
            <th>Type</th>
            <th>Requirements</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Nordea</td>
            <td>1</td>
            <td>Finnish bank</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>Osuuspankki</td>
            <td>2</td>
            <td>Finnish bank</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>Danske Bank</td>
            <td>3</td>
            <td>Finnish bank</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>Ålandsbanken</td>
            <td>5</td>
            <td>Finnish bank</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>Handelsbanken</td>
            <td>6</td>
            <td>Finnish bank</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>PayPal</td>
            <td>9</td>
            <td>Debit/credit card</td>
            <td>
                <p>Only available as interface; requires own agreement with PayPal and is hidden until credentials are
                    saved in Merchant's Panel</p>
            </td>
        </tr>
        <tr>
            <td>S-Pankki</td>
            <td>10</td>
            <td>Finnish bank</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>Klarna Invoice</td>
            <td>11</td>
            <td>Invoice</td>
            <td>
                <p>PAYER_PERSON_PHONE should be defined</p>
                <p>Payer details should be defined (name, address, zip, city, country)</p>
                <p>Only available as interface; requires own agreement with Klarna and is hidden until credentials
                    are saved in Merchant's Panel</p>
            </td>
        </tr>
        <tr>
            <td>Klarna Installment</td>
            <td>12</td>
            <td>Invoice</td>
            <td>
                <p>PAYER_PERSON_PHONE should be defined</p>
                <p>Payer details should be defined (name, address, zip, city, country)</p>
                <p>Only available as interface; requires own agreement with Klarna and is hidden until credentials
                    are saved in Merchant's Panel</p>
            </td>
        </tr>
        <tr>
            <td>Jousto</td>
            <td>18</td>
            <td>Invoice</td>
            <td>
                <p>Minimum amount 20 €</p>
                <p>Maximum amount 5000 €</p>
            </td>
        </tr>
        <tr>
            <td>Visa</td>
            <td>30</td>
            <td>Debit/credit card</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>MasterCard</td>
            <td>31</td>
            <td>Debit/credit card</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>Diners Club</td>
            <td>34</td>
            <td>Credit card</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>JCB</td>
            <td>35</td>
            <td>Debit/credit card</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>Aktia</td>
            <td>50</td>
            <td>Finnish bank</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>POP Pankki</td>
            <td>51</td>
            <td>Finnish bank</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>Säästöpankki</td>
            <td>52</td>
            <td>Finnish bank</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>Visa (Nets)</td>
            <td>53</td>
            <td>Debit/credit card</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>MasterCard (Nets)</td>
            <td>54</td>
            <td>Debit/credit card</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>Diners Club (Nets)</td>
            <td>55</td>
            <td>Credit card</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>American Express (Nets)</td>
            <td>56</td>
            <td>Credit card</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>MobilePay</td>
            <td>58</td>
            <td>Debit/credit card</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>Collector Bank</td>
            <td>60</td>
            <td>Invoice</td>
            <td>
                <p>VAT_IS_INCLUDED value 1</p>
                <p>ITEM_QUANTITY[n] should be integer</p>
                <p>Maximum amount 5000 €</p>
                <p>Product details should be defined</p>
                <p>Payer details should be defined (name, address, zip, city, country)</p>
            </td>
        </tr>
        <tr>
            <td>Oma Säästöpankki</td>
            <td>61</td>
            <td>Finnish bank</td>
            <td>&nbsp;</td>
        </tr>
    </tbody>
{{< /table >}}
