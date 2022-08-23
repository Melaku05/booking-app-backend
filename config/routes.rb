Rails.application.routes.draw do
  devise_for :users,
    controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }
    resources :doctors
    resources :reservations
    get '/member-data', to: 'members#show'
    
end
 