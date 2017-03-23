Rails.application.routes.draw do
  devise_scope :user do
    authenticated :user do
      root 'periods#new', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  devise_for :users, :path => 'accounts'

  namespace :reports do
    resources :roots, only: [:show]
    resources :years, only: [:show]
    resources :months, only: [:show]
    resources :weeks, only: [:show]
    resources :days, only: [:show]
  end

  resources :periods, only: [:new, :create]
end
