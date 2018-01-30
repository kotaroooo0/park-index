Rails.application.routes.draw do

  root 'static_pages#home'
  resources :skiresorts
  resources :parks

end
