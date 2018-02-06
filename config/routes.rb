Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { registrations: 'registrations' }
  root to: 'home#index'

  #  do
  #   resources :tickets
  # end
  resources :events
  resources :tickets

  get "tickets/all"
  get "money/index"


  resources :money
end