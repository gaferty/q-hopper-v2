Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get "review",to: "pages#review"

  # Defines the root path route ("/")
  # root "posts#index"
  get '/map', to: 'restaurants#restaurant_map', as: :restaurant_map
  get '/test', to: 'restaurants#test'


  resources :restaurants do

    resources :reviews, only:[:index, :new, :create, :show]
    post '/join_queue',  to: 'bookings#join_queue'
    patch '/accept_booking', to: 'bookings#accept_booking'
    resources :bookings, only: [:new, :create, :edit, :update]

      collection do
        get '/italian', to: 'restaurants#italian'
        get '/mexican', to: 'restaurants#mexican'
        get '/indian', to: 'restaurants#indian'
        get '/chinese', to: 'restaurants#chinese'
        get '/thai', to: 'restaurants#thai'
        get '/american', to: 'restaurants#american'
      end
  end
  # Booking routes
  resources :bookings
  # Restaurant user view
  resources :venues do
    post '/add_group', to: 'venues#add_group'
  end
end
