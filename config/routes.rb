Rails.application.routes.draw do
  root "home#top"
  get "/" => "home#top"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "map" => "home#map"
  get "adress" => "home#adress"
  get "size" => "home#size"
  get "money" => "home#money"
  get "matching" => "home#matching"
  get "match" => "home#match"
  get "login" => "home#login"
  get "mypage" => "home#mypage"
  get "user" => "home#user"
  get "review" => "home#review"
  get "card" => "home#card"
  get "recipe" => "home#recipe"
  get "pull" => "home#pull"

  get "index" => "reviews#index"
  get "reviews/:id" => "reviews#show"
  get "new" => "reviews#new"
  post "create" => "reviews#create"
  get "reviews/:id/edit" => "reviews#edit"
  post "reviews/:id/update" => "reviews#update"
  post "reviews/:id/destroy" => "reviews#destroy"

  get "users/:id" => "users#show"
  get "signup" => "users#new"
  post "users/create" => "users#create"
  get "users/:id/edit" => "users#edit"
  post "users/:id/update" => "users#update"

  get "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"
end
