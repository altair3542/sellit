Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :categories, except: :show
  resources :products, path: '/'

  # Defines the root path route ("/")
  # root "articles#index"
end
