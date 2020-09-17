Rails.application.routes.draw do
 root "application#hello"

 resources :books
 resources :stocks
 
 get "/signup", to: "users#new"
 post "signup", to: "users#create"
 
 get "/signin", to: "session#new"
 post "/signin", to: "session#create"

end