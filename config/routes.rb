Rails.application.routes.draw do
  root controller: :sessions, action: :index
  resources :sessions
  resources :users
  resources :sound_mynds
  resources :admins
  resources :attends
  resources :counselors
  resources :appointments

end
