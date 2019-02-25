Rails.application.routes.draw do
  root 'teams#index'

  resources :teams do
    resources :players
    resources :comments 
  end

  get 'next_team/:id', to: "teams#next_team"
end
