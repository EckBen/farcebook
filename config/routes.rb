Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations', omniauth_callbacks: 'users/omniauth_callbacks' }

  # devise_scope :user do
  #   delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end

  root "welcome#index"
  resources :users, only: [:show, :index, :edit]
  resources :posts, only: [:index, :show, :new, :create]

  get '/welcome', to: 'welcome#index', as: 'welcome'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end