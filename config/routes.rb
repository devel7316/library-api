Rails.application.routes.draw do
  #   
  resources :genres
  get 'genres/1', to: 'genres#show'
  patch 'genres', to: 'genres#update'
  delete 'genres', to: 'genres#destroy'
  #   
  resources :writers
  get 'writers/1', to: 'writers#show'
  patch 'writers', to: 'writers#update'
  delete 'writers', to: 'writers#destroy'
  #
  resources :books
  get 'books', to: 'books#show'
  patch 'books', to: 'books#update'
  delete 'books', to: 'books#destroy'
  #
  resources :shelves
  get 'shelves', to: 'shelves#show'
  patch 'shelves', to: 'shelves#update'
  delete 'shelves', to: 'shelves#destroy'
  #
  resources :clients
  get 'clients', to: 'clients#show'
  patch 'clients', to: 'clients#update'
  delete 'clients', to: 'clients#destroy'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
