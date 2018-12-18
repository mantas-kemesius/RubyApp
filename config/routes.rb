# frozen_string_literal: true

Rails.application.routes.draw do
  get 'mail/index', to: 'mail#index'
  get 'mail/create', to: 'mail#create'
  get 'mail/destroy', to: 'mail#destroy'
  post 'mail/create', to: 'mail#create'
  root 'home#index'
  resources :articles
  get '/login', to: 'home#index'
  get '/register', to: 'home#index'
  
  post '/articles/show', to: 'articles#show'

  post '/user/create', to: 'user#register'
  post '/user/login', to: 'user#login'
  post '/user/modify/age', to: 'user#modify_age'
  post '/user/modify/last_name', to: 'user#modify_last_name'
  get '/users', to: 'user#fetch_all'
  post '/users/delete', to: 'user#delete'

  match '/lectures?method=create', to: 'lectures#create', via: [:get, :post]
  match '/lectures/create', to: 'lectures#create', via: [:get, :post]
  match '/lectures?id=*&method=edit', to: 'lectures#edit', via: [:get, :post]
  get 'lectures/:id', to: 'lectures#update'
  post 'lectures/:id', to: 'lectures#update' # with params this time
  post 'lectures/destroy', to: 'lectures#destroy'
  get '/lectures/update', to: 'lectures#update'
  get '/lectures/edit', to: 'lectures#update'
  post '/lectures/update', to: 'lectures#update'
  get '/lectures/addstudent/:id', to: 'lectures#addstudent'
  post '/lectures/addstudent/:id', to: 'lectures#addstudent'
  post '/lectures/addstudent/', to: 'lectures#addstudent' # test requirement

  post '/subject/create', to: 'subject#create'
  post '/subject/delete', to: 'subject#delete'
  get '/subjects', to: 'subject#fetch_all'

  post '/message/create', to: 'message#create'
  post '/message/delete', to: 'message#delete'
  get '/messages', to: 'message#fetch_all'

  post '/ssubjects/create', to: 'ssubjects#create'
  post '/ssubjects/delete', to: 'ssubjects#delete'
  get '/ssubjects', to: 'ssubjects#fetch_all'

  get '/ticket/index', to: 'ticket#index'
  get '/ticket/create', to: 'ticket#create'
  get '/ticket/destroy', to: 'ticket#destroy'
  get '/ticket/about', to: 'ticket#about'
  post '/ticket/create', to: 'ticket#create' # with params this time

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
