Rails.application.routes.draw do
  
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  resources :users do
    resources :reservations, only: [:show, :index]
    resources :workouts, only: [:show, :index]
  end

  resources :workouts do
    resources :reservations, only: [:show, :index]
  end
end
