Rails.application.routes.draw do
  resources :evento_salas
  resources :users
  resources :eventos
  resources :formacaos
  resources :docentes
  resources :salas
  resources :edificios
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  root "home#index"
  post 'logout', to: 'home#logout', as: 'logout'
  
  get "indexEstatis", to: "estatistica#indexEstatis"  # rota para a ação indexEstatis
  get "estatistica", to: "estatistica#estatistica"  # rota para a ação estatistica
  get "logout", to: "home#logout"  # rota para a ação logout
  get "index", to: "home#index" # rota para a ação index
  get "home", to: "home#home"  # rota para a ação home
  get "listEdificios", to: "edificios#listEdificios" # rota para a ação lista de edificios
  get "listUsers", to: "users#listUsers" # rota para a ação lista de users
  get 'login', to: 'users#login' # Rota para o formulário de login


end
