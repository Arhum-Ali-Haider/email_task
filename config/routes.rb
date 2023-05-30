Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "email_accounts#new"
  resources :email_accounts, only: [:index ,:new, :create]
  get '/compose_email', to: 'email_accounts#compose_email'
  post '/send_email', to: 'email_accounts#send_email'
  get '/logout', to: 'email_accounts#logout', as: 'logout'

end
