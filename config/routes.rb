Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users,
    controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }
    resources :doctors, only: [:index, :show, :create, :destroy]
    resources :reservations, only: [:index, :show, :create, :destroy]
    get '/member-data', to: 'members#show'
    resources :users, only: [:index, :show]  
end
 