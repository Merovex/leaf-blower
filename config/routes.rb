Rails.application.routes.draw do
  get 'calendar/index'

  resources :events do 
    collection do 
      get :get_events
      post :move
      post :resize
    end
  end

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
