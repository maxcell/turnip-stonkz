Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "home#index"

  resources :users, only: [:show]
  post "/buying", to: "buying_prices#create", as: 'buying'
  post "/selling", to: "selling_prices#create", as: 'selling'
  get '/boards', to: 'boards#index', as: 'boards'
  get '/boards/:id', to: 'boards#show', as: 'board'
  post "/join", to: "boards#join", as: 'join'
end
