Rails.application.routes.draw do
  #resources :user
  root "user#index"
  get 'user/index' => "user#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "user/create" => "user#create"
  post "user/new" => "user#new"
  post "user/confirm" => "user#confirm"
  get "user/confirm" => "user#login"
  get "user/logout" => "user#logout"
  get "user/:id/edit" => "user#edit"
  post "user/:id/change" => "user#change"

  get "post/top" => "post#top"
  get "post/create" => "post#create"
  post "post/new" => "post#new"
  get "post/exit" => "post#exit"

  get "room/:id/top" => "room#top"
  post "room/:id/create" => "room#create"
  post "room/search" => "room#search"
  get "room/search" => "post#top"
  post "room/:id/destroy" => "room#destroy"

end
