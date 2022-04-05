Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :categories, only: [:index, :create, :edit, :update] do
    resources :recipes, only: [:index]
  end

  resources :recipes, only: [:show, :create]
end
