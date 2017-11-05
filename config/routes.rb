Rails.application.routes.draw do
  root to: "home#index"
  get 'home/index'
  resources :schedules
  resources :bookings
  resources :packs
  resources :employees
  resources :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
