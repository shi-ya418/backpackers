Rails.application.routes.draw do
  devise_for :users
  root "posts#index"
  resources :posts do
    resources :comments, only: :create
    resources :likes, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
  resources :users, only: [:show, :edit, :update] do
    member do
      get :followings, :followers
    end
  end
  resources :follow_relationships, only: [:create, :destroy]
  resources :messages, only: :create
  resources :rooms, only: [:create, :show, :index]
end
