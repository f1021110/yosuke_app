Rails.application.routes.draw do
  get 'lists/new'
  # get 'documents/new'削除済み
  
  get 'posts/new'
  get 'sessions/new'
  get 'users/new'
  # get 'tops/index'
  root 'tops#index'

  resources :users
  resources :posts
  resources :lists
  # resources :documents削除済み

  post '/login', to: 'sessions#create'

  get '/login', to: 'sessions#new'
  get '/login', to: 'sessions#create'
  # get '/logout', to: 'sessions#destroy'
  delete 'logout', to: 'sessions#destroy'

  delete 'posts/:id' => 'posts#destroy'

  # get 'download', to: 'lists#download'
  # get 'download/:id', to: 'lists#download'
  get 'download/:id', to: 'lists#download', as: 'download'
end
