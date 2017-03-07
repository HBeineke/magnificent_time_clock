Rails.application.routes.draw do
  root to: 'reports#welcome'
  devise_for :users, :path => 'accounts'
end
