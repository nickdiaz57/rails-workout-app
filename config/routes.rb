Rails.application.routes.draw do
  
  root 'users#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  resources :users do
    resources :reservations, only: [:show, :index, :new, :edit]
    resources :workouts, only: [:show, :index]
  end

  resources :workouts
  resources :reservations

  get '/auth/google_oauth2/callback', to: "sessions#google_login"
end
