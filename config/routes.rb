require 'resque/server'

Codeage::Application.routes.draw do
  mount Resque::Server.new, :at => "/settings/resque"

  devise_for :users

  resources :user, :only => [] do
    collection do 
      get :profile
      get :force_earn
    end
  end

  namespace :settings do
    match '/auth/:provider/callback' => 'authentications#create'
    match '/auth' => 'authentications#create', as: :authorization
    match '/noemail' => 'main#noemail', as: :noemail
  end

  root :to => 'main#index'

  match ':username' => 'user#public', as: :user
end
