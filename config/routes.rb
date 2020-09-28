Rails.application.routes.draw do
  root 'home#index'
  get 'home/about' => 'home#about', as: 'about'
  devise_for :users, controllers: {
    cessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :books
  resources :users, only: [:index, :create, :show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  end





