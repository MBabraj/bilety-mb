Rails.application.routes.draw do
  get 'order_items/create'

  get 'order_items/update'

  get 'order_items/destroy'

  get 'carts/show'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :events
  devise_for :users
  root 'home#index'
  #get 'tickets/index'

  resources :tickets, only: [:index]
  root :to => "tickets#index"

  resource :carts, only: [:show]

  resource :order_items, only: [:create, :update, :destroy]

  resources :seats
  get 'seats/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
