Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pages#main'
  
  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :spots do
    resources :ratings
  end

end
