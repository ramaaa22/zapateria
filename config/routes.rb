Rails.application.routes.draw do
  devise_for :users
  resources :orders
  resources :carts
  resources :line_items do
    member do
      put 'decrement'
    end
  end
  resources :store

  get 'admin/index'
  resources :articles do
    member do
      get 'copy'
      post 'save_copy'
    end
  end
  resources :models
  resources :brands
  resources :categories
  resources :colors
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "admin#index"
end
