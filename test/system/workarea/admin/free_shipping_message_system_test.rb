require "test_helper"

module Workarea
  module Admin
    class FreeShippingMessageSettingsSystemTest < Workarea::SystemTest
      include Admin::IntegrationTest

      setup :create_discount_with_message

      def create_discount_with_message
        shipping_method = create_shipping_service
        @discount = create_shipping_discount(
          name: "Shipping Discount",
          shipping_service: shipping_method,
          amount: 0.to_m,
          order_total_operator: :greater_than,
          order_total: 1.to_m,
          message_active: true,
          message_applied: "You got FREE SHIPPING!",
          message: "You're only {amount} away from FREE SHIPPING!"
        )
      end

      def test_managing_discount_messages
        visit admin.pricing_discounts_path

        click_link("Shipping Discount")

        assert(page.has_content?(t("workarea.admin.pricing_discounts.cards.message.header")))
        click_link(t("workarea.admin.pricing_discounts.cards.message.header"))

        fill_in "discount[message_applied]", with: "Discount Applied"
        fill_in "discount[message]", with: "Before amount {amount} after amount"

        click_button "save_discount_message"
        assert(page.has_content?("Success"))
      end

      def test_card_is_only_displayed_for_discounts_with_messaging_included
        visit admin.pricing_discount_path(@discount)
        assert(page.has_content?(t("workarea.admin.pricing_discounts.cards.message.header")))

        invalid_discount = create_quantity_fixed_price_discount()
        visit admin.pricing_discount_path(invalid_discount)
        refute(page.has_content?(t("workarea.admin.pricing_discounts.cards.message.header")))
      end
    end
  end
end
