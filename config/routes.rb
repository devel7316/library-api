Rails.application.routes.draw do
  resources :shelves
  resources :books
  resources :clients
  #resources :writers
  
  #patch 'writers', to: 'writers#update'
  #delete 'writers', to: 'writers#destroy'
  #
  #   
  resources :genres
  get 'genres', to: 'genres#show'
  patch 'genres', to: 'genres#update'
  #put 'genres', to: 'genres#update'
  delete 'genres', to: 'genres#destroy'
  #   
  resources :writers
  get 'writers', to: 'writers#show'
  patch 'writers', to: 'writers#update'
  delete 'writers', to: 'writers#destroy'
  #
  #
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
