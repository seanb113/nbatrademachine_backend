Rails.application.routes.draw do
  get 'teams/index'
  get 'players/index'
  resources :players
  resources :teams
  resources :trades
  resources :users
  resources :votes
  post '/login', to: 'auth#create'
  get 'trades/index'
  delete '/trades/:id', to: 'trades#destroy'
end
