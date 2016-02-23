Rails.application.routes.draw do
  root 'main#index'
  resources :matches
  resources :players
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
end
