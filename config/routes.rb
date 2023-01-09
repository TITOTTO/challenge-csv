Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :countries, only: [:index, :show, :new, :create]
  resources :embassies, only: [:index, :show, :new, :create]
  resources :french_foreigners, only: [:index, :show, :new, :create]
  root to: "static_page#home"

end
