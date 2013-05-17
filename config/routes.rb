Dossier::Application.routes.draw do
  devise_for :users
  root to: 'home#index'

  get 'home' => 'home#user', as: :user_home

  resources :communities
end
