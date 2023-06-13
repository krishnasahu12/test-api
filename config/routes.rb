Rails.application.routes.draw do  

  root 'pages#index'
  
  resources :users, only: [:new, :create, :index, :show] 

    resources :posts, only: [:new, :create, :index, :show] do
      resources :comments, only: [:index,:new, :create, :show]
    end
  

  resources :sessions, only: [:new, :create]

  post 'logout', to: 'sessions#destroy'
  get 'my_post', to: 'posts#my_post'

end
