Codeage::Application.routes.draw do
  get "user/profile"

  devise_for :users
  match '/auth/:provider/callback' => 'authentications#create'
  match '/about' => 'main#about'
  match '/noemail' => 'main#noemail'
  match '/profile' => 'user#profile'
  root :to => 'main#index'
end
