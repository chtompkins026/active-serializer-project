Rails.application.routes.draw do
  root 'users#new'
  resources :users

  resources :teams do
    resources :players
    resources :comments
  end

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  get 'next_team/:id', to: "teams#next_team"

  get '/auth/:provider/callback' => 'omniauth_callbacks#create', as: "authorize"
  get '/auth/failure', to: redirect('/')

end
