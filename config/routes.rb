Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :presets do
    resources :activities
    resources :timer_sessions, only: [:create]
  end
  resources :breaks, only: [:index, :show, :update]
  resources :timer_sessions, only: [:index, :show, :destroy] do
    resources :breaks, only: [:new, :create, :show]
  end
  resources :start_timer_sessions, only: [:update]
  resources :end_timer_sessions, only: [:update]

  resources :break_timer, only: [:update]


  resources :activities, only: :destroy


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
