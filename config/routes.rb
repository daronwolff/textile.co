Rails.application.routes.draw do
  resources :clocks
  resources :moments
  resources :employees
  resources :departments
  root 'clocks#new'
end
