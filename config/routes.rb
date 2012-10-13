Codeage::Application.routes.draw do
  devise_for :users
  match '/auth/:provider/callback' => 'authentications#create'
  root :to => 'main#index'
end
