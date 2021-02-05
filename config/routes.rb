Rails.application.routes.draw do

  devise_for :companies, controllers: {
    sessions:      'companies/sessions',
    passwords:     'companies/passwords',
    registrations: 'companies/registrations'
  }

  devise_scope :company do
    post 'companies/guest_sign_in', to: 'companies/sessions#new_guest_company'
  end

  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest_user'
  end

  root to: 'top#index'

  resources :articles do
    resource :like, only: [:show, :create, :destroy]
  end

  resource :following_list, only: [:show]
  resource :follower_list, only: [:show]

  resources :relationships, only: [:show] do
  resources :follows, only: [:create]
  resources :unfollows, only: [:create]
  end

  resource :profile, only: [:show, :edit, :update]
  resource :company_profile, only: [:show, :edit, :update]

  resources :favorites, only: [:index]

  resources :rooms, only:[:show, :create] do
    resources :messages, only: [:create]
  end

end
