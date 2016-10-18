Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get '/users' => 'users#index'
  get '/users/:id' => 'users#show' 

  devise_for :users
  root 'static#index'

end
