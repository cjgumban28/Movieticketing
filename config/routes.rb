Rails.application.routes.draw do
  # get 'users/index'
  get 'sessions/index'
  # get 'customers/index'
  # get 'movies/index'
  # get 'movies/show/:id', to: "movies#show"
  get 'screens/index'
  # get 'theatres/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'theatres/movies/index'
  # Defines the root path route ("/")
  # root "articles#index"

  resources :movies
  resources :customers

  # resources :users
  # resources :sessions

  # get 'sessions/new'
  # post 'sessions/create'

  get 'sessions/new'
  post 'sessions/create'
  get 'sessions/destroy'

  # get 'users/new'
  # post 'users/create'
  # delete 'users/destroy'

  root "theatres#index"


end
