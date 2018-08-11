# config/routes.rb
Rails.application.routes.draw do

  get '/ratings', to: 'ratings#ratings_index'

  resources :spots do
    resources :ratings
  end


  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
end