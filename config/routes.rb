Rails.application.routes.draw do

  devise_for :users
  resources :users, except: :show

  get "/profile/:username", to: "users#show"

  resources :posts do
    resources :comments
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "posts#index"
end
