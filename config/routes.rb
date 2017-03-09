Rails.application.routes.draw do
  root to: 'reports/roots#show'
  devise_for :users, :path => 'accounts'

  namespace :reports do
    resources :roots, only: [:show]
    resources :years, only: [:show]
    resources :months, only: [:show]
    resources :weeks, only: [:show]
    resources :days, only: [:show]
  end

end
