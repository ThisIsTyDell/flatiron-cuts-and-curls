Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users

  get '/users' => 'users#index'
  get '/users/:id' => 'users#show' 
  root 'static#index'

end
