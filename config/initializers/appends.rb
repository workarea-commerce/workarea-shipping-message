module Workarea
  Plugin.append_partials(
    'admin.discount_cards',
    'workarea/admin/pricing_discounts/message_card'
  )

  Plugin.append_partials(
    "storefront.cart_checkout_actions",
    "workarea/storefront/carts/shipping_message"
  )
end
