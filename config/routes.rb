Rails.application.routes.draw do
  get 'posts/new'
  get 'sessions/new'
  get 'users/new'
  # get 'tops/index'
  root 'tops#index'

  resources :users
  resources :posts

  post '/login', to: 'sessions#create'

  get '/login', to: 'sessions#new'
  get '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
 

end
