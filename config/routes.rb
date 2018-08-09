# config/routes.rb
Rails.application.routes.draw do
  resources :spots do
    resources :ratings
  end

  post 'auth/login', to: 'authentication#authenticate'
end