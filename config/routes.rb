Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resource :profile, only: [ :show, :update ]
  resources :potential_partners, only: [ :index ] do
    resources :matches, only: [ :create ]
  end
  resources :relationships, only: [ :index, :show, :update, :destroy ]
  resources :messages, only: [ :create ]
  resources :users, only: [ :show ]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
