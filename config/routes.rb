Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations', omniauth_callbacks: 'users/omniauth_callbacks' }

  # devise_scope :user do
  #   delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end
  
  devise_scope :user do
    authenticated  do
      root to: 'posts#index'
    end

    unauthenticated do
      root to: 'devise/sessions#new', as: 'unauthenticated_root'
    end
  end

  # root "posts#index"
  resources :users, only: [:show, :index, :edit]
  resources :posts, only: [:index, :show, :new, :create, :destroy]
  resources :friendships, only: [:update, :create, :destroy]
  resources :comments, only: [:update, :create, :destroy]
  resources :likes, only: [:create, :destroy, :update]

  get 'notifications', to: 'notifications#routing', as: :notifications

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
