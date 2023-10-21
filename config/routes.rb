Rails.application.routes.draw do
  get 'welcome/index'
  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'

    authenticated :user do
      root to: "groups#index", as: :authenticated_root
    end

    unauthenticated do
      root to: "welcome#index", as: :unauthenticated_root
    end
  end

  
  resources :groups do
    resources :entities, only: [:index, :new, :create, :edit, :update, :destroy]
  end
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
