Rails.application.routes.draw do

  devise_for :users
  root 'homes#top'
  get 'home/about'=>'homes#about'

  resources :books, only: [:create, :index, :show, :edit, :update, :destroy] do
  	resources :post_comments, only: [:create, :destroy]
  resource :favorites, only: [:create, :destroy]
end

  
  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
