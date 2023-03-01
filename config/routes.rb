Rails.application.routes.draw do
  resources :models
  resources :brands
  resources :categories
  resources :colors
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
