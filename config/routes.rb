# config/routes.rb
Rails.application.routes.draw do

  root 'pages#main'

  get '/ratings', to: 'ratings#ratings_index'

  resources :spots do
   resources :ratings
  end




  #Routes For API
  get     '/api/spots',      to: 'spots#api_index'
  get     '/api/spots/:id',  to: 'spots#api_show'
  post    '/api/spots',      to: 'spots#api_create'
  put     '/api/spots/:id',  to: 'spots#api_update'
  delete  '/api/spots/:id',  to: 'spots#api_destroy'

  get     '/api/ratings',                      to: 'ratings#api_ratings_index'
  get     '/api/spots/:spot_id/ratings',       to: 'ratings#api_index'
  get     '/api/spots/:spot_id/ratings/:id',   to: 'ratings#api_show'
  post    '/api/spots/:spot_id/ratings',       to: 'ratings#api_create'
  put     '/api/spots/:spot_id/ratings/:id',   to: 'ratings#api_update'
  delete  '/api/spots/:spot_id/ratings/:id',   to: 'ratings#api_destroy'


  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
end