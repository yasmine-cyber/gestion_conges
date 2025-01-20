Rails.application.routes.draw do
  # Routes Devise avec contrôleurs personnalisés
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

   # Utilisation de devise_scope pour définir la route root
   devise_scope :user do
    root 'users/sessions#new' # Redirige vers la page de connexion
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Autres routes ici
end
