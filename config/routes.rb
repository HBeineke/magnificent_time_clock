Rails.application.routes.draw do
  root to: 'reports#show'
  devise_for :users, :path => 'accounts'

  resources :users do
    resources :reports, only: [:show]
  end
end
