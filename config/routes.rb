Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :players, only: [:show, :index, :create, :getname]
  resources :games, only: [:create, :show, :update]

  post '/players', to: 'players#create'
  get '/players', to: 'players#index'
  get '/players/:id', to: 'players#show'
  get '/players/:id/name', to:'players#getname'
  post '/games', to: 'games#create'
  put '/games/:id/join', to: 'games#join'
  get '/games/:id', to: 'games#show'
  put '/games/:id', to:'games#update'

end
