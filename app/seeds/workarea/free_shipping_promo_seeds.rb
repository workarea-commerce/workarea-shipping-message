module Workarea
  class FreeShippingPromoSeeds
    def perform
      puts "Adding free shipping discount with message..."

      create_shipping_message_discount
    end

    def create_shipping_message_discount
      shipping_service = Shipping::Service.where(name: "Ground").first || Shipping::Service.all.first

      discount = Pricing::Discount::Shipping.create!(
        name: "Free Shipping Over $50",
        shipping_service: shipping_service,
        amount: 0.to_m,
        order_total_operator: :greater_than,
        order_total: 50.to_m,
        message_active: true,
        message_applied: "You got FREE SHIPPING!",
        message: "You're only {amount} away from FREE SHIPPING!"
      )
    end
  end
end
