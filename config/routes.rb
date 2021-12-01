Rails.application.routes.draw do
  resources :cities
  resources :countries
  resources :activities
  resources :highlights
  resources :restaurants
  resources :trips
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
