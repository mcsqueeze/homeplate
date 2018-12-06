Rails.application.routes.draw do
  devise_for :users

  patch 'users/:id/change_usertype', to: "users#change_usertype", as: :change_usertype

  root to: 'pages#home'
  get 'FAQ', to: 'pages#FAQ'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :meals do
    resources :pictures, only: [:create, :destroy]
    resources :reviews, only: [:create, :destroy]
    resources :items, only: [:create]
  end

  resources :users, only: [:show, :index]

  resources :orders, only: [:index, :show, :create, :destroy] do
    member do
      get 'payment', to: 'payments#new'
      post 'payment', to: 'payments#create'
      get 'confirmation', to: 'payments#confirmation'
    end
  end
end
