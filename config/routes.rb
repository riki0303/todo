require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq' if Rails.env.development?
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

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

  scope module: :apps do
    resources :accounts, only: [:show] do
      resources :follows, only: [:create]
      resources :unfollows, only: [:create]
    end
    resource :timeline, only: [:show]
  end
end
