Rails.application.routes.draw do
  
  root 'users#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  resources :users do
    resources :reservations, only: [:show, :index]
    resources :workouts, only: [:show, :index]
  end

  resources :workouts do
    resources :reservations, only: [:show, :index]
  end
end
