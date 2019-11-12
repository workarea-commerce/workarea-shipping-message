Workarea Shipping Message
================================================================================

Discount messaging plugin for the Workarea platform.

Out of the box this plugin adds messaging to the cart to let a customer know how
close they are to receiving a free shipping discount.

The plugin includes seed data that sets up a free shipping discount with message.

Configuration
--------------------------------------------------------------------------------

No additional configuration is necessary to use this plugin with free shipping messaging.

Other discount types can be configured to allow messaging.
To configure another discount type for messaging you will need to

1. Decorate the discount type and include Pricing::Discount::Message
2. Add a method called discount_message_valid? to the decorated discount type.
    See workarea-shipping-message/app/models/workarea/pricing/discount/shipping.decorator
    for an example.
3. Create a new discount that meets the criteria of your discount_message_valid?
    method
4. Add a method to render your discount message along with any necessary logic to
    the relevant view_model for where your message will be displayed.
5. Call the discount render method in the view where your message will be displayed

If you think your new discount message might be a useful addition to this plugin
please include a member of the plugin team on your pull request or open a PR against
this plugin.

Workarea Platform Documentation
--------------------------------------------------------------------------------

See [https://developer.workarea.com](https://developer.workarea.com) for Workarea platform documentation.

Copyright & Licensing
--------------------------------------------------------------------------------
Workarea Commerce Platform is released under the [Business Software License](https://github.com/workarea-commerce/workarea/blob/master/LICENSE)
