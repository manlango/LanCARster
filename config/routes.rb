Rails.application.routes.draw do
  resources :quotes
  get 'users/index'
  resources :customers
  resources :departments
  resources :vehicles
  resources :posts
  devise_for :users, :path_prefix => 'd'
  resources :users
  root 'home#index'
  match '/users',   to: 'users#index',   via: 'get'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
