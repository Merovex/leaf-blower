Rails.application.routes.draw do
  resources :events

  resources :attendances

  resources :packs

  resources :patrols

  resources :boys

  resources :ranks

  resources :locations

  root :to => "visitors#index"
  devise_for :users
  resources :users
end
