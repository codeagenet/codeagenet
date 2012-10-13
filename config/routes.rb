require 'resque/server'

Codeage::Application.routes.draw do
  get "user/profile", 'user/force_earn'

  devise_for :users
  match '/auth/:provider/callback' => 'authentications#create'
  match '/auth' => 'authentications#create', as: :authorization
  match '/about' => 'main#about'
  match '/noemail' => 'main#noemail', as: :noemail
  match '/profile' => 'user#profile'

  match '/public/:username' => 'user#public'

  mount Resque::Server.new, :at => "/resque"

  root :to => 'main#index'
end
