Rails.application.routes.draw do
  namespace :donations do
    resources :registrations, only: [:new, :create]
    resources :hole_sponsors, only: [:new, :create]
    resources :lunches, only: [:new, :create]
    resources :donations, only: [:new, :create]
  end
  get "donations/hole_sponsors", to: "donations/hole_sponsors#new"
  get "donations/registrations", to: "donations/registrations#new"
  get "donations/lunches", to: "donations/lunches#new"
  get "donations/donations", to: "donations/donations#new"
  post "hook", to: "successes#hook"
  get "successes/index", to: "successes#index"
  get "successes", to: "successes#index"
  get "cancellations/index", to: "cancellations#index"
  get "cancellations", to: "cancellations#index"
  resources :donations, only: [:index]

  # Static image pages for events
  namespace :images do
    namespace :events do
      get "2023/", to: "event_images#index"
      get "2023/:id", to: "event_images#show", constraints: {id: /\d+/}
    end
  end

  get "about", to: "about#index"
  get "sponsors", to: "sponsors#index"
  get "robots.:format", to: "robots#index"

  root "welcome#index"

  post "/", to: "welcome#create"
  match "*unmatched", to: "application#route_not_found", via: :all
end
