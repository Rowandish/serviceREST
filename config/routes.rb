Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations", :sessions => "sessions"}

  namespace :v1, defaults: {format: 'json'} do
	get 'me', to: 'users#show'
  end

  # resources :cats, :defaults => { :format => 'json'}
end
