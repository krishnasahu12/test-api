Rails.application.routes.draw do  

  root 'pages#index'
  
  resources :users, only: [:new, :create, :index]
  resources :sessions, only: [:new, :create]

  get 'logout', to: 'sessions#destroy'

end
