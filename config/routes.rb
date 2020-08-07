Rails.application.routes.draw do

  devise_for :users
  resources :users, except: :show

  # patch is update
  patch "/profile/:id/follow", to: "users#follow", as: :new_user_follow
  patch "/profile/:id/unfollow", to: "users#unfollow", as: :user_unfollow
  get "/profile/:username", to: "users#show", as: :show_profile

 

  resources :posts do
    resources :comments
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "posts#index"
end
