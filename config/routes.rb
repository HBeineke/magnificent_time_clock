Rails.application.routes.draw do
  root to: 'report_totals#show'
  devise_for :users, :path => 'accounts'

  resources :report_totals, only: [:show]
  resources :report_years, only: [:show]
  resources :report_months, only: [:show]
  resources :report_weeks, only: [:show]
  resources :report_days, only: [:show]
end
