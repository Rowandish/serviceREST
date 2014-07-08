Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations", :sessions => "sessions"}
  	get 'me', to: 'users#show'

  # resources :cats, :defaults => { :format => 'json'}
end
