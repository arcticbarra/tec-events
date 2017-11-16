Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :attendees
    resources :events
    post 'events/:event_slug/download', to: 'events#download', as: 'download_event'

    root to: "events#index"
  end

  scope path: ':event', module: 'event', as: 'event' do
    # root to: 'sessions#new', as: 'login'
    # get 'login' => 'sessions#new'
    # post 'login' => 'sessions#create'
    get 'logout', to: 'sessions#destroy', as: 'logout'
    get 'register', to: 'sessions#new', as: 'register'
    post 'register', to: 'sessions#create', as: 'post_register'
    get 'user/edit', to: 'users#edit', as: 'edit_user'
    patch 'user/', to: 'users#update', as: 'user'
  end

  root 'pages#index'
end
