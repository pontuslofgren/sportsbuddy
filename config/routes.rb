Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "up" => "rails/health#show", as: :rails_health_check

  resources :workouts do
    member do
      resources :bookings, only: %i[new create destroy]
    end
  end

  resources :profiles



  get '/about', to: 'pages#about', as: 'about'
end
