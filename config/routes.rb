Rails.application.routes.draw do
  root to: 'items#index'
  resources :items
  devise_for :users
  get 'items/:id', to: 'itmems#priced'
end