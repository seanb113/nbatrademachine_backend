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
  # get 'auth/create'
  # get 'swaps/create'
  # get 'votes/index'
  # get 'votes/create'
  # get 'votes/show'
  # get 'users/index'
  # get 'users/create'
  # get 'users/show'
  # get 'trades/create'
  # post '/login', to: 'auth#create'
  # get '/profile', to: 'users#profile'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
