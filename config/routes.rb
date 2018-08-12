# config/routes.rb
Rails.application.routes.draw do

  get '/ratings', to: 'ratings#ratings_index'

  resources :spots do
   resources :ratings
  end

  root to: "spots#index"

  get   '/api/spots',        to: 'spots#api_index'
  get   '/api/spots/:id',    to: 'spots#api_show'
  post  '/api/spots',        to: 'spots#api_create'
  put   '/api/spots/:id',    to: 'spots#api_update'
  delete '/api/spots/:id',   to: 'spots#api_destroy'


  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
end