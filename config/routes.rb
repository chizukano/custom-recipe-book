Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :categories, only: [:index, :new, :create]
  resources :recipes, only: [:show]
end
