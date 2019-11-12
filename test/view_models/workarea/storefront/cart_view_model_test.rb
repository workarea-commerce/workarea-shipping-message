require "test_helper"

module Workarea
  module Storefront
    class CartViewModelTest < Workarea::TestCase
      setup :create_discount

      def create_discount
        @discount = create_shipping_discount(
          amount: 0.to_m,
          order_total_operator: :greater_than,
          order_total: 2.to_m,
          message_active: true,
          message_applied: "You got FREE SHIPPING!",
          message: "You're only {amount} away from FREE SHIPPING!"
        )
      end

      def test_amount_away_from_free_shipping_is_nil_if_the_free_shipping_discount_is_not_active
        @discount.update_attributes(active: false)

        view_model = CartViewModel.new(Order.new)

        assert_nil(view_model.amount_away_from_free_shipping)
      end

      def test_amount_away_from_free_shipping_is_zero_when_the_discount_qualifying_total_is_met
        view_model = CartViewModel.new(Order.new(subtotal_price: 2.to_m))
        assert_equal(0.to_m, view_model.amount_away_from_free_shipping)
      end

      def test_amount_away_from_free_shipping_is_negative_if_order_total_greater_than_the_discount_qualifying_total
        view_model = CartViewModel.new(Order.new(subtotal_price: 3.to_m))
        assert_equal(-1.to_m, view_model.amount_away_from_free_shipping)
      end

      def test_amount_away_from_free_shipping_is_correct_if_qualifying_total_is_not_met
        view_model = CartViewModel.new(Order.new(subtotal_price: 1.to_m))

        assert_equal(1.to_m, view_model.amount_away_from_free_shipping)
      end

      def test_free_shipping_message_includes_amount_left_to_apply
        view_model = CartViewModel.new(Order.new(subtotal_price: 1.to_m))

        assert_equal("You're only $1.00 away from FREE SHIPPING!", view_model.free_shipping_message)
      end

      def test_free_message_applied_returned_if_discount_is_applied
        view_model = CartViewModel.new(Order.new(subtotal_price: 2.to_m))

        assert_equal("You got FREE SHIPPING!", view_model.free_shipping_message)
      end
    end
  end
end
