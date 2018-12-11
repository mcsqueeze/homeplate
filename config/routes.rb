Rails.application.routes.draw do

  devise_for :users

  root to: 'pages#home'
  get 'FAQ', to: 'pages#FAQ'
  patch 'users/:id/change_usertype', to: "users#change_usertype", as: :change_usertype
  get 'users/:id/dashboard', to: "users#dashboard", as: :dashboard
  get 'users/:id/show', to: "users#show", as: :profile

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :meals do
    resources :pictures, only: [:new, :create, :destroy]
    resources :reviews, only: [:new, :create, :destroy]
    resources :items, only: [:create]
  end

  resources :users, only: [:index]


  resources :orders, only: [:index, :show, :create, :destroy] do
    member do
      get 'payment', to: 'payments#new'
      post 'payment', to: 'payments#create'
      get 'confirmation', to: 'payments#confirmation'
    end
  end
end
