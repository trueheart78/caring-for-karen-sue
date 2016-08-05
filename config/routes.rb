Rails.application.routes.draw do
  get 'about', to: 'about#index'
  get 'robots.:format', to: 'robots#index'

  root 'welcome#index'
end
