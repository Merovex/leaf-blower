Rails.application.routes.draw do
  resources :templates

  get 'templates/by/:scope', to: 'templates#scope'
  # get 'events/template', to: 'events#from_template'

  get 'site/about'

  get 'site/terms'

  get 'site/privacy'

  get 'site/contact'

  get 'calendar/index'

  resources :events do 
    resources :attendances do
      member do 
        get 'add'
      end
    end
    collection do 
      get :get_events
      post :move
      post :resize
    end
  end

  resources :packs

  resources :attendances

  resources :patrols

  resources :boys

  resources :ranks

  resources :locations

  root :to => "visitors#index"
  devise_for :users
  resources :users
end
