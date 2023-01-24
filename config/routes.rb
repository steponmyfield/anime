Rails.application.routes.draw do
  root to: 'animations#index'
  resources :animations do
    get :search, on: :collection
    resources :reviews, only: [:index, :new, :create]
    get :username_flash_message, on: :collection
    get :session_flash_message, on: :collection
  end

  resources :users, only: [:account, :profile, :update] do
    get :account, on: :collection
    get :profile, on: :collection
  end

  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
    get 'users/guest_sign_in', to: 'users/sessions#new_guest'
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :records, only: [:index, :new, :create, :destroy]
end
