# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  get '/login', to: 'home#index'
  get '/register', to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
