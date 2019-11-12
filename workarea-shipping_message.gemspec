$:.push File.expand_path("../lib", __FILE__)

require "workarea/shipping_message/version"

Gem::Specification.new do |s|
  s.name        = "workarea-shipping_message"
  s.version     = Workarea::ShippingMessage::VERSION
  s.authors     = ["Mike Dalton"]
  s.email       = ["mdalton@workarea.com"]
  s.homepage    = "https://github.com/workarea-commerce/workarea-shipping-message"
  s.summary     = "Shipping Message plugin for the WebLinc ecommerce platform"
  s.description = "Plugin to display free shipping message on the cart for the WebLinc ecommerce platform"

  s.files       = `git ls-files`.split("\n")

  s.add_dependency "workarea", "~> 3.x", ">= 3.4.0"
end
