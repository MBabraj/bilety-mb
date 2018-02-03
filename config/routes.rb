# Rails.application.routes.draw do
#   devise_for :users
#   #get 'order_items/create'
#
#   #get 'order_items/update'
#
#   #get 'order_items/destroy'
#
#   #get 'carts/show'
#
#   #devise_for :admin_users, ActiveAdmin::Devise.config
#   resources :events
#
#   root 'home#index'
#   get 'tickets/index'
#
#   resources :tickets, only: [:index]
#   root :to => "events#index"
#
#   #resource :carts, only: [:show]
#
#   #resource :order_items, only: [:create, :update, :destroy]
#
#   #resources :seats
#   #get 'seats/show'
#   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
# end


Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'home#index'

  resources :events do
    resources :tickets
  end

  get "tickets/all"
  get "money/index"


  resources :money
end