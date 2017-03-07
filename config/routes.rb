Rails.application.routes.draw do
  root to: 'record_sets#welcome'

  devise_for :users, :path => 'accounts'
  resources :users do
    resources :record_sets
  end
end
