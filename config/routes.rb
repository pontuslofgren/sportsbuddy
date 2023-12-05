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
  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
  
  mount StripeEvent::Engine, at: '/webhook'
  get '/about', to: 'pages#about', as: 'about'
  get '/success/:id', to: 'bookings#success', as: 'success'
  get '/cancel/:id', to: 'bookings#cancel', as: 'cancel'
end
