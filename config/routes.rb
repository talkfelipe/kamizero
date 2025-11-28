Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  get "/dashboard", to: "pages#dashboard", as: :dashboard

  resources :notices, only: [:new, :create, :index, :show] do
    collection do
      get :events
    end
  end

  post "/scan_file", to: "notices#scan_file", as: :scan_file

  resources :notices, only: [:destroy]

  resources :subscriptions, only: [:new, :create]

  resources :notices do
    post :mark_as_read, on: :member
  end

end
