Rails.application.routes.draw do
  get 'homepage/index'
  root 'homepage#index'
  get 'teams/index'
  get 'players/index'
  get 'swaps/index'
  resources :players
  resources :teams
  resources :trades
  resources :users
  resources :votes
  resources :swaps
  post '/login', to: 'auth#create'
  get 'trades/index'
  delete '/trades/:id', to: 'trades#destroy'
end
