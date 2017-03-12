Rails.application.routes.draw do

  root 'players#index'

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  resources :matches
  resources :players
  resources :users

end
