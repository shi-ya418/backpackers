Rails.application.routes.draw do
  devise_for :users
  root "posts#index"
  resources :posts do
    resources :comments, omly: :create
  end
  resources :users, only: [:show, :edit, :update]
end
