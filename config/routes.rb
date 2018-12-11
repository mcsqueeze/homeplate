Rails.application.routes.draw do

  devise_for :users

  root to: 'pages#home'
  get 'FAQ', to: 'pages#FAQ'
  patch 'clients/:id/change_usertype', to: "clients#change_usertype", as: :change_usertype
  get 'clients/:id/dashboard', to: "clients#dashboard", as: :dashboard

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :meals do
    resources :pictures, only: [:new, :create, :destroy]
    resources :reviews, only: [:new, :create, :destroy]
    resources :items, only: [:create]
  end

  resources :clients, only: [:show, :index]


  resources :orders, only: [:index, :show, :create, :destroy] do
    member do
      get 'payment', to: 'payments#new'
      post 'payment', to: 'payments#create'
      get 'confirmation', to: 'payments#confirmation'
    end
  end
end
