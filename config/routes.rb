Rails.application.routes.draw do
  
  # Default home/index page
  root to: 'static_pages#home' #home page

  # STATIC PAGES - REACT Front-end 
  get '/login' => 'static_pages#login' # page that will show if you are already loged in
  get '/property/:id' => 'static_pages#property' # page that will show every property available
  get '/:username/add-property' => 'static_pages#add_property' # page for adding property
  get '/:username/listings' => 'static_pages#listings'  # page for user listings of properties
  get '/property/:id/edit-property' => 'static_pages#edit_property' # page for editing property for user who owns one
  get '/:username/bookings' => 'static_pages#bookings'

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
