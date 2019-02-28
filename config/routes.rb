Rails.application.routes.draw do
  root 'users#new'
  resources :users, :sessions
  resources :comments, except: [:delete]

  resources :teams do
    resources :players
    resources :comments
  end

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  get 'next_team/:id', to: "teams#next_team"

  get 'comments/:id/comment_data', to: 'comments#comment_data'
  get 'next_comment/:id', to: "comments#next_comment"

  get '/auth/:provider/callback' => 'omniauth_callbacks#create', as: "authorize"
  get '/auth/failure', to: redirect('/')

end
