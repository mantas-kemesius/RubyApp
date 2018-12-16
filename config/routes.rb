# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  resources :articles
  get '/login', to: 'home#index'
  get '/register', to: 'home#index'

  post '/user/create', to: 'user#register'
  post '/user/login', to: 'user#login'
  get '/users', to: 'user#fetch_all'

  post '/subject/create', to: 'subject#create'
  post '/subject/delete', to: 'subject#delete'
  get '/subjects', to: 'subject#fetch_all'

  post '/message/create', to: 'message#create'
  post '/message/delete', to: 'message#delete'
  get '/messages', to: 'message#fetch_all'

  post '/ssubjects/create', to: 'ssubjects#create'
  post '/ssubjects/delete', to: 'ssubjects#delete'
  get '/ssubjects', to: 'ssubjects#fetch_all'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
