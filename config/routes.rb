Rails.application.routes.draw do
  devise_for :users, :path_prefix => 'd'
  get 'users/index'
  resources :quotes
  resources :customers
  resources :vehicles
  resources :users
  root 'home#index'
  match '/users',   to: 'users#index',   via: 'get'
  get 'report/index', to: "report#index"
  post 'report/index', to: "report#generate_report"
  get '/report/generate_overview' => 'report#generate_overview', as: 'overview'
  resources :reports
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
