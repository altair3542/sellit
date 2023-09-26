Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :categories, except: :show
  resources :products, path: '/'

  namespace :authentication, path: '', as: '' do
    resources :users, only: [:new, :create]
    resources :sessions, only: [:new, :create]
  end

  # Defines the root path route ("/")
  # root "articles#index"
end
