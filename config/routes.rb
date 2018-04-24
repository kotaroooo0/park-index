Rails.application.routes.draw do

  root 'static_pages#home'

  resources :skiresorts, only: %i[index]
  resources :parks, only: %i[index show]
  resources :users, only: %i[show edit update]
  resources :lanes, only: %i[create update destroy]
  resources :inquiries, only: %i[new create]
  resources :comments, only: %i[create destroy] do
    resources :likes, only: %i[create destroy]
  end

  get '/skiresorts/search', to: 'skiresorts#search'
  get 'auth/:provider/callback', to: 'sessions#callback'
  get '/logout', to: 'sessions#destroy'
  get '/login', to: 'static_pages#login'

  namespace :api, { format: 'json' } do
    namespace :v1 do
      resources :skiresorts
      resources :parks
      resources :users
      resources :lanes
      resources :inquiries
    end
  end

end
