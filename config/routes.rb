Rails.application.routes.draw do
  devise_for :admins
  resources :clocks
  resources :moments
  resources :employees
  resources :departments
  root 'clocks#new'
end
