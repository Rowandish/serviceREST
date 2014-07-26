Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations", :sessions => "sessions"}

  namespace :v1, defaults: {format: 'json'} do
  	# resources :users, only: [:show, :destroy]
  	get 'users/me', to: 'users#show'
	 delete 'users/remove_me', to: 'users#destroy'
  	resources :buildings, except: [:edit, :new], path: 'users/me/buildings'
  	# post '/me/buildings/:static_building_id/', to: 'building#create'
  	
	
  end
end
