Rails.application.routes.draw do
  
  root to: 'items#index'
  root to: 'orders#index'
  resources :items
  resources :orders, only:[:create]
  devise_for :users
 
 
 
end