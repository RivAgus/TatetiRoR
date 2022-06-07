Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :games, only: [:index, :show, :create, :update]
  resources :players, only: [:index, :show, :create]

end