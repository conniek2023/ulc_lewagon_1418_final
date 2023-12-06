Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.

  resources :communities do #community manager
    resources :community_members, only: [:create] #community_member
    resources :events, only: [:new, :create] do#event_manager
      resources :event_members, only: [:create, :destory] #event_member
    end
  end

  resources :events, only:[:edit, :update, :destory, :show]

  get "/me", to: "users#me", as: :me
  patch "update",to: "users#update", as: :update
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
