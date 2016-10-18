Rails.application.routes.draw do
  root 'static#index'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users

  resources :users, only: [:index, :show]

  resources :appointments
end
