Rails.application.routes.draw do
  resources :employees
  resources :customers
  resources :departments
  resources :quotes
  resources :vehicles
  resources :posts
  devise_for :users
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
