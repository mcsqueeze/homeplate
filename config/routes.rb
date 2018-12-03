Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  get 'FAQ', to: 'pages#FAQ'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :meals do
    resources :pictures, only: [:create, :destroy]
    resources :reviews, only: [:create, :destroy]
  end

  resources :users, only: [:show] do
    resources :orders, only: [:index, :show, :create, :destroy] do
      member do
        get 'payment', to: 'payments#new'
        get 'confirmation', to: 'payments#confirmation'
      end
    end
  end


end
