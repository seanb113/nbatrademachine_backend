Rails.application.routes.draw do
  get 'swaps/create'
  get 'votes/index'
  get 'votes/create'
  get 'votes/show'
  get 'users/index'
  get 'users/create'
  get 'users/show'
  get 'trades/index'
  get 'trades/create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
