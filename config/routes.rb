Rails.application.routes.draw do
  root "tasks#index"
  
  resources :tasks do
    member do
      patch :complete
      patch :reopen
    end
  end
  
  # Health check endpoint
  get "up" => "rails/health#show", as: :rails_health_check
end
