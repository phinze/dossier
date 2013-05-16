Dossier::Application.routes.draw do
  root to: 'home#index'

  resources :communities
end
