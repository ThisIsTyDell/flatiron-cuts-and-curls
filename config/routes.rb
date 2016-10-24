Rails.application.routes.draw do
  root 'static#index'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users, only: [:index, :show, :update]


  resources :appointments

  resources :services, except: [:show]

  resources :categories do
    resources :services, only: [:show, :index, :new]
  end

  resources :charges
end
