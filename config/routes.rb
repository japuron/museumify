Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "artists#index"
  devise_for :users
  resources :users
  resources :museums
  resources :artpieces
  resources :likes
  resources :artists
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
