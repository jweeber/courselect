Rails.application.routes.draw do

  root 'courses#index'

  post '/courses' => 'courses#show', as: 'search'
  get '/take' => 'courses#show_to_take', as: 'take'
  get '/taken' => 'courses#show_taken', as: 'taken'

  resources :users, :only => [:new, :create]

  resources :sessions, :only => [:new, :create]
  get "/logout" => "sessions#destroy"

end
