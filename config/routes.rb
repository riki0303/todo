Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: 'boards#index'

  resources :boards do
    resources :tasks do
      resources :comments, only: %i[new create destroy]
    end
  end
end
