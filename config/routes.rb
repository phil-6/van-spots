Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pages#main'
  
  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :spots do
    resources :ratings
  end

  get '/users',           to: 'pages#main'
  get '/users/password',  to: redirect('/users/password/new')

  get '/map',             to: 'pages#map'
  get '/api/spots',       to: 'spots#api_index'
  get '/api/spots/:id',   to: 'spots#api_show'

  # get '/about',           to: 'pages#about'
  # get '/how-to',          to: 'pages#how_to'

  namespace :admin do
    resources :users
  end


end
