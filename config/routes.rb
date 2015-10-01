Rails.application.routes.draw do
  root 'main#index'
  resources :matches
  resources :players
end
