Rails.application.routes.draw do
  root 'teams#index'

  resources :teams do
    resources :players
  end

  get 'next_team/:id', to: "teams#next_team"
end
