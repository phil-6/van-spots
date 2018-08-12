# config/routes.rb
Rails.application.routes.draw do

  get '/ratings', to: 'ratings#ratings_index'

  resources :spots do
    resources :ratings
  end

  root to: "spots#index"

  get '/api/spots', to: 'spots#api_index'

  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
end