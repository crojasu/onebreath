Rails.application.routes.draw do
  get 'timer_sessions/index'
  get 'timer_sessions/show'
  get 'timer_sessions/new'
  get 'timer_sessions/create'
  get 'timer_sessions/edit'
  get 'timer_sessions/destroy'
  get 'presets/index'
  get 'presets/show'
  get 'presets/new'
  get 'presets/create'
  get 'presets/edit'
  get 'presets/update'
  get 'presets/destroy'
  get 'activities/index'
  get 'activities/show'
  get 'activities/new'
  get 'activities/create'
  get 'activities/destroy'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
