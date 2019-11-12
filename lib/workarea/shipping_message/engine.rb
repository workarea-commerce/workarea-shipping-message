module Workarea
  module ShippingMessage
    class Engine < ::Rails::Engine
      include Workarea::Plugin
      isolate_namespace Workarea::ShippingMessage
    end
  end
end
