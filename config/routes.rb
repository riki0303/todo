Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: 'boards#index'

  resource :timeline, only: [:show]

  resources :boards do
    resources :tasks do
      resources :comments, only: %i[new create destroy]
    end
  end

  resources :accounts, only: [:show] do
    resources :follows, only: [:create]
    resources :unfollows, only: [:create]
  end
end
