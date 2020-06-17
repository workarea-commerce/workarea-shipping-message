Workarea Shipping Message 1.2.1 (2020-06-17)
--------------------------------------------------------------------------------

*   Scope routes to include locale


    Ben Crouse



Workarea Shipping Message 1.2.0 (2019-11-26)
--------------------------------------------------------------------------------

*   Upgrade for v3.5 compatibility

    Ben Crouse



Workarea Shipping Message 1.1.0 (2019-04-16)
--------------------------------------------------------------------------------

*   Update for v3.4 compatibility

    * Update admin pricing_discounts/cards to include metrics card
    * Add minimum version requirement

    SHIPPNGMSG-6
    Jake Beresford



Workarea Shipping Message 1.0.0 (2018-03-21)
--------------------------------------------------------------------------------

*   Upgrade for v3 compatibility

    In addition to standard upgrade tasks this plugin was significantly refactored to be more conventional. The implementation was updated with a Discount::Message concern which is extended in Pricing::Discount::Shipping removing the need for a custom settings object and unconventional configuration on the host app. This change should also make it more intuitive to add discount messages to other discount types if necessary. Additional logic would need to be defined to achieve this.

    * Discount::Message uses {amount} keyword that is gsubbed for the amount delta in the view_model
    * Rename everything, update decorators, change before_filter to before_action
    * Add dotfiles and bamboo dependencies
    * Update cart view model decorator so it works
    * Add translations
    * Move admin UI into discounts UI
    * Convert tests to minitest

    SHIPPNGMSG-5
    Jake Beresford



