Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resource :profile, only: [ :show, :update ]
  resources :matches, only: [ :create ]
  resources :relationships, only: [ :index, :show, :update, :destroy ]
  resources :messages, only: [ :create ]
  resources :users, only: [ :show ]
  get '/user_profile', to: 'pages#profile'
  get '/profile_show', to: 'pages#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
