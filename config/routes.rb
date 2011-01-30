Donttrustthisguy::Application.routes.draw do
  get "authentication/login"

  get "authentication/logout"

  resources :posts
  
  match 'login' => 'authentication#login', :as => :login
  match 'logout' => 'authentication#logout', :as => :logout
  
  match "/:year/:month/:day/:id" => "posts#show"
  root :to => "posts#index"
end
