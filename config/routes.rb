Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :categories, only: [:index, :new, :create, :edit, :update] do
    resources :recipes, only: [:show, :index]
  end
end
