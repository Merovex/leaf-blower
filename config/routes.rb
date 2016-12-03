Rails.application.routes.draw do

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resource :events
    end
  end

  resources :bonums

  resources :achievements do
    member do
      get 'fine'
      get 'undo'
    end
  end

  resources :requirements

  resources :badges

  resources :templates

  get 'templates/by/:scope', to: 'templates#scope'
  # get 'events/template', to: 'events#from_template'

  get 'site/about'

  get 'site/terms'

  get 'site/privacy'

  get 'site/contact'

  get 'calendar/index'
  get 'boys/advance'
  get '/boys/:id/promote', to: 'boys#promote', as: 'boy_promote'
  get '/boys/:boy_id/record/:key', to: 'ranks#record', as: 'rank_record'

  resources :events

  resources :events do 
    resources :attendances do
      member do 
        get 'add'
        get 'del'
      end
    end
    collection do 
      get :take_attendance
      get :get_events
      post :move
      post :resize
    end
  end

  resources :packs

  resources :attendances

  resources :patrols

  resources :boys do 
    resources :bonums
  end

  resources :ranks

  resources :locations

  root :to => "boys#index"
  devise_for :users 
  resources :users
end
