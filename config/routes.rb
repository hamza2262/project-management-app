Rails.application.routes.draw do
  root 'home#index'
  resources :messages
  devise_for :users,  controllers: { registrations: 'users/registrations' }
  get '/users/dashboard', to: 'dashboard#view'
  get '/users/profile', to: 'profile#show_profile'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
