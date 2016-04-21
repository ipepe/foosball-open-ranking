Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  namespace :api do
    namespace :v2, defaults: {format: 'json'} do
      resources :matches
      resources :players
      resources :users
    end
    resources :players, only: [:index, :show]
    resources :matches, only: [:index]
  end

  mount_ember_app :frontend, to: "/"

end
