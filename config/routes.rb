Rails.application.routes.draw do
  root :to => "artists#index"
  devise_for :users
  resources :users
  resources :museums
  resources :artpieces
  resources :likes
  resources :artists
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
