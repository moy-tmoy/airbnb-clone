Rails.application.routes.draw do
  
  # Default home/index page
  root to: 'static_pages#home'

  # STATIC PAGES - REACT Front-end

  get '/property/:id' => 'static_pages#property'
  get '/login' => 'static_pages#login'
  get '/:username/add-property' => 'static_pages#add_property'
  
  # API routes - RAILS Back-end
  
  namespace :api do 

    # -> USERS <-
    resources :users, only: [:create]

    # -> SESSIONS <-
    resources :sessions, only: %i[create destroy]
    get '/authenticated' => 'sessions#authenticated'
    delete '/sessions' => 'sessions#destroy'
    
    # -> PROPERTIES <-
    resources :properties, only: [:index, :show]
    post '/properties' => 'properties#create'
    
    # -> BOOKINGS <-
    resources :bookings, only: [:create]
    get '/properties/:id/bookings' => 'bookings#get_property_bookings'

    # -> CHARGES <-
    resources :charges, only: [:create]
    # stripe webhook
    post '/charges/mark_complete' => 'charges#mark_complete'

  end
end
