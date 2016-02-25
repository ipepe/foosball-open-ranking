Rails.application.routes.draw do

  root 'main#index'

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  resources :matches
  resources :players
  resources :users

end
