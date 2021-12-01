Rails.application.routes.draw do
  scope path: ApplicationResource.endpoint_namespace, defaults: { format: :jsonapi } do
    scope module: 'api/v1', as: 'api' do
      resources :dishes

      resources :eating_lists

      resources :itineraries

      resources :cities

      resources :countries

      resources :activities

      resources :highlights

      resources :restaurants

      resources :trips

      resources :users

    end
    mount VandalUi::Engine, at: '/vandal'
    # your routes go here
  end
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
