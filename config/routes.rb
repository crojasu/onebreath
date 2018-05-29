Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :presets
  resources :breaks, only: [:index, :show, :new, :create]
  resources :timer_sessions, only: [:index, :show, :new, :create, :destroy]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
