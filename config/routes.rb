Rails.application.routes.draw do

  root 'main#index'

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  resources :matches
  resources :players
  resources :users

  namespace :api do
    resources :players, only: [:index]
  end

end
