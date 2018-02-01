Rails.application.routes.draw do

  root 'static_pages#home'
  resources :skiresorts
  resources :parks
  get 'auth/:provider/callback', to: 'sessions#callback'
  get '/logout', to: 'sessions#destroy'
  get '/login', to: 'static_pages#login'

end
