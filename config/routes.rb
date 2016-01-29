Rails.application.routes.draw do
  resources :users, only: [:create, :new, :show]
  resources :bands do
    resources :albums, only: [:new, :create]
  end
  resources :albums, only: [:edit, :show, :update] do
    resources :tracks, only: [:new, :create]
  end
  resources :tracks, only: [:edit, :show, :update]
  resource :session, only: [:new, :create, :destroy]

  root 'sessions#new'
end
