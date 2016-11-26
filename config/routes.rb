Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  root to: 'home#new'

  get '/group/new' => 'group#new'
  post '/group/new' => 'group#create'
  get '/group/add' => 'group#add'
  post '/group/add' => 'group#adder'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
