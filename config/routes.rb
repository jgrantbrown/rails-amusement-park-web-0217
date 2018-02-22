Rails.application.routes.draw do
  resources :users
  resources :attractions

  post "/rides/new", to: "rides#new"
    root "static_pages#home"

    get '/signin'  => 'sessions#new'
    post '/signin'  => 'sessions#signin'

    get '/logout' => 'sessions#destroy'
end
