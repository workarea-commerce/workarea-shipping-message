Workarea::Admin::Engine.routes.draw do
  namespace :shipping_message do
    resource :settings, only: [:edit, :update]
  end

  resources :pricing_discounts, except: [:new, :create] do
    member do
      get :message
    end
  end
end
