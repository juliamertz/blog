+++
title = "DHL Integration for lightspeed webshop"
date = 2024-06-15
[taxonomies]
tags = ["go"]
kind = ["work"]
+++

The all-in-one webshop provider [lightspeed](https://lightspeed.com) dropped support for DHL a while ago.
For small businesses, this meant they had to manually create, update, and cancel labels for each order—unless they were willing to pay a hefty monthly premium to unlock better options.

When I was approached with this problem, I couldn’t understand why something so simple had to be so complicated.
So, I built a small web service to act as a broker between DHL and Lightspeed.

Luckily, Lightspeed made this easier by providing a webhook for retrieving orders.
To update an order's status in Lightspeed, the service includes polling logic to check if the DHL label for that order has been created.

The code is open-source and can be deployed with a single binary and configuration file:  [repository](https://github.com/juliamertz/lightspeed-dhl-adapter).

<div class='filename'>
  <div>config.toml</div>
</div>

```toml
[DHL]
UserId    = "uuid"
ApiKey    = "uuid"
AccountId = "0700000"

[Lightspeed]
Frontend = "https://<subdomain>.webshopapp.com"
Cluster = "https://api.webshopapp.com/en/"
Key     = ""
Secret  = ""

[CompanyInfo]
Name         = ""
Street       = ""
City         = ""
PostalCode   = ""
CountryCode  = ""
Number       = ""
Addition     = ""
Email        = ""
PhoneNumber  = ""
PersonalNote = "Your order is on it's way!"

[Options]
DryRun      = false
Port        = 3000
Environment = "development"
Debug       = true
PollingInterval = 5 
```


