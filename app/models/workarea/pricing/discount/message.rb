module Workarea
  module Pricing
    class Discount
      module Message
        extend ActiveSupport::Concern

        included do
          field :message, type: String, localize: true
          field :message_active, type: Boolean, default: false
          field :message_applied, type: String, localize: true
        end
      end
    end
  end
end
