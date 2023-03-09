Rails.application.routes.draw do
  resources :carts
  resources :line_items
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
