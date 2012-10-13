Codeage::Application.routes.draw do
  devise_for :users
  match '/auth/:provider/callback' => 'authentications#create'
  match '/about' => 'main#about'
  match '/noemail' => 'main#noemail'
  match '/profile' => 'main#profile'
  root :to => 'main#index'
end
