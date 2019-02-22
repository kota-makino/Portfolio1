Rails.application.routes.draw do
  get 'sessions/new'
  root 'pages#index'
  get 'users/new'

  resources :users

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

end
