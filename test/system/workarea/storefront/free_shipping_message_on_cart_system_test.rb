require "test_helper"

module Workarea
  module Storefront
    class FreeShippingMessageOnCartSystemTest < Workarea::SystemTest
      include Storefront::SystemTest
      setup :set_product
      setup :set_discount

      def set_product
        @product = create_product(
          name: "Integration Product",
          variants: [
            { name: "SKU1", sku: "SKU1", regular: 1.to_m },
            { name: "SKU2", sku: "SKU2", regular: 2.to_m }
          ]
        )
      end

      def set_discount
        shipping_method = create_shipping_service(
          rates: [
            { price: 2.to_m }
          ]
        )

        discount = create_shipping_discount(
          shipping_service: shipping_method,
          amount: 0.to_m,
          order_total_operator: :greater_than,
          order_total: 2.to_m,
          message_active: true,
          message_applied: "You got FREE SHIPPING!",
          message: "You're only {amount} away from FREE SHIPPING!"
        )
      end

      def test_user_does_not_meet_criteria_for_free_shipping
        visit storefront.product_path(@product)
        select @product.skus.first, from: "sku"
        click_button t("workarea.storefront.products.add_to_cart")

        assert(page.has_content?("Success"))

        click_link t("workarea.storefront.carts.view_cart")

        assert(page.has_content?("You're only $1.00 away from FREE SHIPPING!"))
      end

      def test_user_meets_criteria_for_free_shipping
        visit storefront.product_path(@product)
        select @product.skus.last, from: "sku"
        click_button t("workarea.storefront.products.add_to_cart")
        click_link t("workarea.storefront.carts.view_cart")

        assert(page.has_content?("You got FREE SHIPPING!"))
      end
    end
  end
end
