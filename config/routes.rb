Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :countries
  resources :embassies
  resources :french_foreigners
  root to: "static_page#home"

end
