Rails.application.routes.draw do
  root 'dashboards#index'
  resources :registrations, only: %i[new create]
  resources :logins, only: %i[new create]
  delete 'logout', to: 'sessions#destroy'
  resources :postares
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
