Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  root to: 'home#new'

  get '/group/new' => 'group#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
