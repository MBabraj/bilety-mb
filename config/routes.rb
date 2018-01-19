Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :events
  devise_for :users
  root 'home#index'
  #get 'tickets/index'

  resources :tickets
  root :to => "tickets#index"

  resources :seats
  get 'seats/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
