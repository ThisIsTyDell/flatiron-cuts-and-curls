Rails.application.routes.draw do
  get '/users' => 'users#index'
  get '/users/:id' => 'users#show' 

  devise_for :users
  root 'static#index'

end
