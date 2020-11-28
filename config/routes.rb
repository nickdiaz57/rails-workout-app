Rails.application.routes.draw do

  resources :users do
    resources :reservations, only: [:show, :index]
    resources :workouts, only: [:show, :index]
  end

  resources :workouts do
    resources :reservations, only: [:show, :index]
  end
end
