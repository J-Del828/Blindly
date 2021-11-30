Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resource :profile, only: [ :show, :update, :edit ]
  resources :potential_partners, only: [ :index ] do
    resources :matches, only: [ :create ]
  end
  resources :relationships, only: [ :index, :show, :destroy ] do
    resources :messages, only: [ :create ]
    member do
      patch :increase_affinity
      patch :decrease_affinity
    end
  end
  resources :users, only: [ :show ]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
