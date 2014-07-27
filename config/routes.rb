Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations", :sessions => "sessions"}

  namespace :v1, defaults: {format: 'json'} do
    get 'users/me', to: 'users#show'
    delete 'users/remove_me', to: 'users#destroy'
    resources :buildings, except: [:edit, :new], path: 'me/buildings'
    resources :monsters, except: [:new, :edit], path: 'me/monsters'
  end
end
