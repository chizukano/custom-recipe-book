Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :categories, only: %i[index new create] do
    resources :recipes, only: %i[index]
  end
  resources :recipes, only: %i[show new create edit update destroy] do
    resources :ingredients, only: %i[new create]
  end
  resource :user, only: [:show]
end
