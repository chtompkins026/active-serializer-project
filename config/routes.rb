Rails.application.routes.draw do
  'users#new'
  resources :users

  resources :teams do
    resources :players
    resources :comments
  end

  get '/signup' => 'users#new'
  get 'next_team/:id', to: "teams#next_team"
end
