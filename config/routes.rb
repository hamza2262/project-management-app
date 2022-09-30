# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :projects
  resources :teams do
    resources :members
  end
  get '/users/dashboard', to: 'dashboard#view'
  get '/users/profile', to: 'profile#show_profile'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
