Workarea.configure do |config|
  config.seeds.insert_after("Workarea::DiscountsSeeds", "Workarea::FreeShippingPromoSeeds")
end
