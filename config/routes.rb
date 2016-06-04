Rails.application.routes.draw do

  root 'courses#index'

  post '/courses' => 'courses#show', as: 'search'

  resources :users, :only => [:new, :create]

  resources :sessions, :only => [:new, :create]
  get "/logout" => "sessions#destroy"

end
