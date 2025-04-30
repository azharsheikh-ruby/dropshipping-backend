Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'login', to: 'auth#login'
      post 'signup', to: 'auth#signup'
      resources :products, only: [:index, :show, :create] do
        get "category", on: :collection
      end
      resources :orders, only: [:index, :create]
    end
  end
end
