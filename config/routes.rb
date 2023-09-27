Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  namespace :authentication, path: '', as: '' do
    resources :users, only: [:new, :create], path: '/register', path_names: { new: '/' }
    resources :sessions, only: [:new, :create, :destroy], path: '/login', path_names: { new: '/' }
  end

  resources :favorites, only: :create
  resources :users, only: [:show], path: '/user', param: :username
  resources :categories, except: :show
  resources :products, path: '/'



  # Defines the root path route ("/")
  # root "articles#index"
end
