Rails.application.routes.draw do
  root 'static#index'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users

  get '/users' => 'users#index'
  get '/users/:id' => 'users#show' 

end
