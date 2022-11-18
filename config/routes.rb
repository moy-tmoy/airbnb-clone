Rails.application.routes.draw do
  
  # Default home/index page
  root to: 'static_pages#home'

  # STATIC PAGES - REACT Front-end 

  get '/login'                                 => 'static_pages#login'                      # page that will show if you are already loged in
  get '/property/:id'                          => 'static_pages#property'                   # page that will show every property available
  get '/:username/add-property'                => 'static_pages#add_property'               # page for adding property
  get '/:username/listings'                    => 'static_pages#listings'                   # page for user listings of properties
  get '/property/:id/edit-property'            => 'static_pages#edit_property'              # page for editing property for user who owns one
  get '/:username/bookings'                    => 'static_pages#bookings'                   # page for see user bookings
  get '/:username/reservations'                => 'static_pages#reservations'               # page to see user owned property reservations
  get '/property/:id/reservations'             => 'static_pages#properties_reservations'      # page to see reservations to each of the property

  # API routes - RAILS Back-end

  namespace :api do 

    # -> USERS <-
    post '/users'                              => 'users#create'

    # -> SESSIONS <-
    post '/sessions'                           => 'sessions#create'
    get '/authenticated'                       => 'sessions#authenticated'
    delete '/sessions'                         => 'sessions#destroy'

    # -> PROPERTIES <-
    post '/properties'                         => 'properties#create'
    get '/properties/'                         => 'properties#index'
    get '/properties/:id'                      => 'properties#show'
    patch '/properties/:id'                    => 'properties#update'
    delete '/properties/:id'                   => 'properties#destroy'
    
    # -> BOOKINGS <-
    resources :bookings, only: [:create]
    get '/properties/:id/bookings'             => 'bookings#get_property_bookings'
      
    get '/users/:username/properties/bookings' => 'bookings#get_user_properties_bookings'  # user own properties bookings

    get '/users/:username/bookings'            => 'bookings#index_by_user'                 # users/guests bookings to each properties

    # -> CHARGES <-
    resources :charges, only: [:create]
    # stripe webhook
    post '/charges/mark_complete'              => 'charges#mark_complete'

  end
end
