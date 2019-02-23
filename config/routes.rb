Rails.application.routes.draw do
  get 'topics/new'
  get 'sessions/new'
  root 'pages#index'
  get 'users/new'



  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  resources :users
  resources :topics

end
