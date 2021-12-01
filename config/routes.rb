Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "trips#index"
  resources :dishes
  resources :eating_lists
  resources :itineraries
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
