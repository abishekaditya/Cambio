Rails.application.routes.draw do
  get 'transaction/show'

  get 'transaction/new/:id' => 'transaction#new'
  post '/transaction/transact' => 'transaction#transact'

  get '/group/show/:id' => 'group#show'

  devise_for :users, :controllers => { registrations: 'registrations' }

  root to: 'home#new'

  get '/group/new' => 'group#new'
  post '/group/new' => 'group#create'
  get '/group/add' => 'group#add'
  post '/group/add' => 'group#adder'
  get '/group/index' => 'group#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
