Rails.application.routes.draw do
  
  # Default home/index page
  root to: 'static_pages#home'

  # STATIC PAGES - REACT Front-end

  get '/property/:id' => 'static_pages#property'
  get '/login' => 'static_pages#login'
  get '/:username/add-property' => 'static_pages#add_property'
  get '/:username/listings' => 'static_pages#listings'
  get '/property/:id/edit-property' => 'static_pages#edit_property'

  # API routes - RAILS Back-end
  
  namespace :api do 

    # -> USERS <-
    post '/users' => 'users#create'

    # -> SESSIONS <-
    post '/sessions' => 'sessions#create'
    get '/authenticated' => 'sessions#authenticated'
    delete '/sessions' => 'sessions#destroy'

    # -> PROPERTIES <-
    get '/properties/' => 'properties#index'
    post '/properties/:id' => 'properties#show'
    post '/properties' => 'properties#create'
    patch '/properties/:id' => 'properties#update'
    delete '/properties/:id' => 'properties#destroy'
    
    # -> BOOKINGS <-
    resources :bookings, only: [:create]
    get '/properties/:id/bookings' => 'bookings#get_property_bookings'

    # -> CHARGES <-
    resources :charges, only: [:create]
    # stripe webhook
    post '/charges/mark_complete' => 'charges#mark_complete'

  end
end
