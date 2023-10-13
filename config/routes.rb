Rails.application.routes.draw do
  resources :shelves
  resources :books
  resources :clients
  resources :writers
  #   
  resources :genres
  get 'genres', to: 'genres#show'
  patch 'genres', to: 'genres#update'
  delete 'genres', to: 'genres#destroy'
  #
  #
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
