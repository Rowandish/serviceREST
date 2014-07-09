Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations", :sessions => "sessions"}

  namespace :v1, defaults: {format: 'json'} do
  	# resources :users, only: [:show, :destroy]
  	resources :buildings, only: [:index, :create, :destroy]
	get 'me', to: 'users#show'
	get 'remove_user', to: 'users#destroy'
  end
end
