Rails.application.routes.draw do
  
  devise_for :companies, controllers: {
    sessions:      'companies/sessions',
    passwords:     'companies/passwords',
    registrations: 'companies/registrations'
  }

  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
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

end
