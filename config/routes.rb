Rails.application.routes.draw do
  devise_for :users
  root to: "result_items#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :result_items

  post '/search', to: 'search#search', as: 'search'

end
